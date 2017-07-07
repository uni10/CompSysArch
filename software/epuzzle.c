#include <stdint.h>

#define ROW     3
#define COLUMN  2
#define FIELDS  720

// #define DEBUG
// #define TESTING

#ifdef DEBUG
#include <stdio.h>
#endif

#ifdef TESTING
#include <stdio.h>
#endif

int8_t dy[] = {-1,  0,  1,  0};
int8_t dx[] = { 0,  1,  0, -1};

struct field {
  uint8_t state[ROW][COLUMN];
  uint8_t cmd;
  uint16_t prev_index;
};

struct field fields[FIELDS];
uint16_t field_length = 0;

struct field TARGET_FIELD = {
  .state = {1, 2, 3, 4, 5, 0},
  .cmd = 255,
  .prev_index = 0,
};

#ifdef DEBUG
void debug_print_state(struct field *);
#endif

static inline void set_field(uint16_t index, uint8_t state[ROW][COLUMN], uint8_t cmd, uint16_t prev_index)
{
  for (uint8_t y = 0; y < ROW; y++)
    for (uint8_t x = 0; x < COLUMN; x++)
      fields[index].state[y][x] = state[y][x];
  fields[index].cmd = cmd;
  fields[index].prev_index = prev_index;
  field_length++;
#ifdef DEBUG
  if (field_length > 720)
    printf("Error\n");
#endif
}

/*
 * If moving blank success, it returns 1.
 * Else, it returns 0.
 */ 
static inline uint8_t move(uint16_t prev_index, uint8_t cmd)
{
  uint8_t blank_x = 0, blank_y = 0;
  uint16_t new_index = field_length;

  for (uint8_t y = 0; y < ROW; y++) {
    for (uint8_t x = 0; x < COLUMN; x++) {
      if (fields[prev_index].state[y][x] == 0) {
        blank_x = x;
        blank_y = y;
      }
    }
  }
  uint8_t next_x = blank_x + dx[cmd];
  uint8_t next_y = blank_y + dy[cmd];

  switch(next_x) {
    case 0:
    case 1:
      break;
    default:
      return 0;
  }
  switch(next_y) {
    case 0:
    case 1:
    case 2:
      break;
    default:
      return 0;
  }
  set_field(new_index, fields[prev_index].state, cmd, prev_index);
  fields[new_index].state[blank_y][blank_x] = fields[new_index].state[next_y][next_x];
  fields[new_index].state[next_y][next_x] = 0;
  return 1;
}

static inline uint8_t is_equal(struct field *s, struct field *d)
{
  for (uint8_t y = 0; y < ROW; y++) {
    for (uint8_t x = 0; x < COLUMN; x++) {
      if (s->state[y][x] != d->state[y][x])
        return 0;
    }
  }
  return 1;
}

static inline uint8_t is_arrived()
{
  for (uint16_t i = 0; i < field_length - 1; i++) {
    if (is_equal(&fields[i], &fields[field_length - 1]) == 1)
      return 1;
  }
  return 0;
}

#ifdef DEBUG
void debug_print_state(struct field *f)
{
  printf("DEBUG\n");
  printf("state\n");
  for (uint8_t y = 0; y < ROW; y++) {
    for (uint8_t x = 0; x < COLUMN; x++) {
      printf("%u ", f->state[y][x]);
    }
    printf("\n");
  }
  printf("cmd: %d\n", f->cmd);
  printf("prev_index: %u\n", f->prev_index);
}
#endif

#define QUEUE_SIZE 256
uint16_t queue[QUEUE_SIZE] = { 0 };  /* index */
uint32_t head = 0, tail = 1;
static inline void queue_add(uint16_t value)
{
  queue[(tail - 1) % QUEUE_SIZE] = value;
  tail++;
}

static inline uint16_t queue_pop()
{
  uint16_t value = queue[head % QUEUE_SIZE];
  head++;
  return value;
}

void output(uint16_t index, uint16_t cmd)
{
  switch (cmd) {
    case 0:
#ifdef DEBUG
      printf("UP %u\n", index);
#endif
    break;
    case 1:
#ifdef DEBUG
      printf("RIGHT %u\n", index);
#endif
    break;
    case 2:
#ifdef DEBUG
      printf("DOWN %u\n", index);
#endif
    break;
    case 3:
#ifdef DEBUG
      printf("LEFT %u\n", index);
#endif
    break;
    default:
    break;
  }
}

int main()
{
  uint16_t current = 0;
  uint8_t finished = 0;
  uint8_t state[][COLUMN] = {{2, 4}, {5, 3}, {1, 0}};
  set_field(0, state, -1, 0);
  queue[0] = 0;

  while ((head < tail) && !finished) {
#ifdef DEBUG
    printf("head: %d tail: %d\n", head, tail);
    printf("field_length: %d\n", field_length);
#endif
    current = queue_pop();
    for (uint8_t i = 0; i < 4; i++) {
      if (move(current, i) == 1) {
        if (is_arrived()) {
          field_length--;   // overwrite
          continue;
        }
        if (is_equal(&fields[field_length - 1], &TARGET_FIELD) == 1) {
          finished = 1;
          break;
        }
        queue_add(field_length - 1);
      }
    }
  }
#ifdef DEBUG
  printf("head: %d tail: %d\n", head, tail);
#endif

  if (finished) {
    uint16_t log[256] = { 0 };  /* index */
    uint16_t count = 0;

#ifdef DEBUG
    printf("==========\n");
    debug_print_state(&fields[0]);
#endif

    for (uint16_t index = field_length - 1; index != 0; index = fields[index].prev_index) {
#ifdef DEBUG
      debug_print_state(&fields[index]);
#endif
      log[count++] = fields[index].cmd;
    }

    for (uint16_t i = 0; i < count; i++) {
      output(i, log[count - i - 1]);
#ifdef DEBUG
      printf("Log: %2u -> %u\n", i, log[count - i - 1]);
#endif
#ifdef TESTING
      printf("%u ", log[count - i - 1]);
#endif
    }
#ifdef TESTING
    printf("\n");
#endif
  }

  return 0;
}

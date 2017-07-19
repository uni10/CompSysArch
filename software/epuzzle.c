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

int dy[] = {-1,  0,  1,  0};
int dx[] = { 0,  1,  0, -1};

struct field {
  int state[ROW][COLUMN];
  int cmd;
  int prev_index;
};

struct field fields[FIELDS];
int field_length = 0;

int log_cmd[256] = { 0 };  /* index */

struct field TARGET_FIELD = {
  .state = {1, 2, 3, 4, 5, 0},
  .cmd = 255,
  .prev_index = 0,
};

#ifdef DEBUG
void debug_print_state(struct field *);
#endif

#ifdef DEBUG
void debug_print_state(struct field *f)
{
  printf("DEBUG\n");
  printf("state\n");
  for (int y = 0; y < ROW; y++) {
    for (int x = 0; x < COLUMN; x++) {
      printf("%u ", f->state[y][x]);
    }
    printf("\n");
  }
  printf("cmd: %d\n", f->cmd);
  printf("prev_index: %u\n", f->prev_index);
}
#endif

#define QUEUE_SIZE 256
int queue[QUEUE_SIZE] = { 0 };  /* index */
volatile int head = 0, tail = 1;

/*
void output(int index, int cmd)
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
*/
int current = 0;
int finished = 0;
int init_state[][COLUMN] = {{2, 4}, {5, 3}, {1, 0}};
int blank_x, blank_y;
int ret_val = 0;
int arg0, arg1, arg2, arg3, arg4;
int *ptr;

int main()
{
   goto init;

set_field:
  /*
   * arg0: index
   * arg1: prev_index
   * arg2: cmd
   */
  for (int y = 0; y < ROW; y++) {
    for (int x = 0; x < COLUMN; x++) {
      fields[arg0].state[y][x] = fields[arg1].state[y][x];
    }
  }
  fields[arg0].cmd = arg2;
  fields[arg0].prev_index = arg1;
  goto set_field_ret;

move:
  /*
   * arg1: prev_index
   * arg2: cmd
   */
  blank_x = 0;
  blank_y = 0;
  for (int y = 0; y < ROW; y++) {
    for (int x = 0; x < COLUMN; x++) {
      if (fields[arg1].state[y][x] == 0) {
        blank_x = x;
        blank_y = y;
      }
    }
  }

  switch(blank_x + dx[arg2]) {
    case 0:
    case 1:
      break;
    default:
      ret_val = 0;
      goto move_ret;
  }
  switch(blank_y + dy[arg2]) {
    case 0:
    case 1:
    case 2:
      break;
    default:
      ret_val = 0;
      goto move_ret;
  }
  arg0 = field_length;
  goto set_field;
set_field_ret:
  fields[field_length].state[blank_y][blank_x] =
    fields[field_length].state[blank_y + dy[arg2]][blank_x + dx[arg2]];
  fields[field_length].state[blank_y + dy[arg2]][blank_x + dx[arg2]] = 0;
  field_length++;
  ret_val = 1;
  goto move_ret;

is_equal:
  /*
   * arg0: index
   */
  for (int y = 0; y < ROW; y++) {
    for (int x = 0; x < COLUMN; x++) {
      if (fields[arg0].state[y][x] != fields[field_length - 1].state[y][x]) {
        ret_val = 0;
        goto is_equal_ret;
      }
    }
  }
  ret_val = 1;
  goto is_equal_ret;

is_target:
  for (int y = 0; y < ROW; y++) {
    for (int x = 0; x < COLUMN; x++) {
      if (TARGET_FIELD.state[y][x] != fields[field_length - 1].state[y][x]) {
        ret_val = 0;
        goto is_target_ret;
      }
    }
  }
  ret_val = 1;
  goto is_target_ret;

is_arrived:
  for (int i = 0; i < field_length - 1; i++) {
    arg0 = i;
    goto is_equal;
is_equal_ret:
    if (ret_val == 1)
      goto is_arrived_ret;
  }
  ret_val = 0;
  goto is_arrived_ret;

queue_pop:
  ret_val = queue[head % QUEUE_SIZE];
  head++;
  goto queue_pop_ret;

init:
  for (int y = 0; y < ROW; y++)
    for (int x = 0; x < COLUMN; x++)
      fields[0].state[y][x] = init_state[y][x];
  fields[0].cmd = -1;
  fields[0].prev_index = 0;
  field_length++;
  queue[0] = 0;

loop:
  if (head > tail) goto loop_end;
  if (finished) goto loop_end;
  if (head == tail) goto loop_end;
#ifdef DEBUG
    printf("head: %d tail: %d\n", head, tail);
    printf("field_length: %d\n", field_length);
#endif
    goto queue_pop;
queue_pop_ret:
    current = ret_val;
    for (int i = 0; i < 4; i++) {
      arg1 = current;
      arg2 = i;
      goto move;
move_ret:
      if (ret_val == 1) {
        goto is_arrived;
is_arrived_ret:
        if (ret_val == 1) {
          field_length--;   // overwrite
          continue;
        }
        goto is_target;
is_target_ret:
        if (ret_val == 1) {
          finished = 1;
          goto loop_end;
        }
        queue[(tail - 1) % QUEUE_SIZE] = field_length - 1;
        tail++;
      }
    }
  goto loop;
loop_end:
#ifdef DEBUG
  printf("head: %d tail: %d\n", head, tail);
#endif

  if (finished) {
    int count = 0;

#ifdef DEBUG
    printf("==========\n");
    debug_print_state(&fields[0]);
#endif

    for (int index = field_length - 1; index != 0; index = fields[index].prev_index) {
#ifdef DEBUG
      debug_print_state(&fields[index]);
#endif
      log_cmd[count++] = fields[index].cmd;
    }

    for (int i = 0; i < count; i++) {
      switch (log_cmd[i]) {
        case 0:
    #ifdef DEBUG
          printf("UP %u\n", i);
    #endif
        break;
        case 1:
    #ifdef DEBUG
          printf("RIGHT %u\n", i);
    #endif
        break;
        case 2:
    #ifdef DEBUG
          printf("DOWN %u\n", i);
    #endif
        break;
        case 3:
    #ifdef DEBUG
          printf("LEFT %u\n", i);
    #endif
        break;
        default:
        break;
      }
#ifdef DEBUG
      printf("Log: %2u -> %u\n", i, log_cmd[count - i - 1]);
#endif
#ifdef TESTING
      printf("%u ", log_cmd[count - i - 1]);
#endif
    }
#ifdef TESTING
    printf("\n");
#endif
  }

  return 0;
}

stack:
  .space 256
dy:
  .word -1
  .word 0
  .word 1
  .word 0
dx:
  .word 0
  .word 1
  .word 0
  .word -1
fields:
  .space 23040
field_length:
  .space  4
log_cmd:
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
  .word 4294967295
TARGET_FIELD:
  .word 1
  .word 2
  .word 3
  .word 4
  .word 5
  .word 0
  .word 255
  .word 0
queue:
  .space  1024
head:
  .space  4
tail:
  .word 1
current:
  .space  4
finished:
  .space  4
init_state:
  .word 2
  .word 4
  .word 5
  .word 3
  .word 1
  .word 0

blank_x:
  .space 4

blank_y:
  .space 4
ret_val:
  .space  4

arg0:
  .space 4

arg1:
  .space 4

arg2:
  .space 4

arg3:
  .space 4

arg4:
  .space 4

ptr:
  .space 4

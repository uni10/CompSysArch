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
  .space  1024
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

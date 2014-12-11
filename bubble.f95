SUBROUTINE bubble

  !Program to sort police files by social security number.
  !
  !Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  LOGICAL :: sorted
  INTEGER :: pass, nrecs, FIRST
  CHARACTER :: str1*105, str2*105

  pass = 1

  READ(9,'(I2)',REC=1)nrecs
  sorted = .FALSE.

  DO
    IF (sorted) EXIT
    sorted = .TRUE.
    DO FIRST=2,nrecs-pass+1
      READ(9,'(A105)',REC=FIRST)str1
      READ(9,'(A105)',REC=FIRST+1)str2
      IF (str1(1:9) < str2(1:9)) CYCLE
      WRITE(9,'(A105)',REC=FIRST)str2
      WRITE(9,'(A105)',REC=FIRST+1)str1
      sorted = .FALSE.
    END DO
    pass = pass + 1
  END DO

  WRITE(*,100)'Police records sorted. . .'
100 FORMAT(//,T15,A30//)

END SUBROUTINE bubble

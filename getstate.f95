SUBROUTINE getstate(statename)

  !Subroutine to read the state name of a person with a given ssn.

  USE police
  CHARACTER :: statename*22
  INTEGER :: nrecs

  OPEN(20,FILE='state.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=22)
  READ(20,'(I2)',REC=1) nrecs
  statename = '**********************'
  IF (istcode >= 1 .AND. istcode <= nrecs) THEN
    READ (20,'(A22)',REC=istcode+1) statename
  END IF
  CLOSE(20)

END SUBROUTINE getstate

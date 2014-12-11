SUBROUTINE getvmake(vmakename)

  !Subroutine to read the vmake name of a person with a given ssn.

  USE police
  CHARACTER :: vmakename*12
  INTEGER :: nrecs

  OPEN(20,FILE='vmake.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=12)
  READ(20,'(I2)',REC=1) nrecs
  vmakename = '************'
  IF (ivmcode >= 1 .AND. ivmcode <= nrecs) THEN
    READ (20,'(A12)',REC=ivmcode+1) vmakename
  END IF
  CLOSE(20)

END SUBROUTINE getvmake

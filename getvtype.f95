SUBROUTINE getvtype(vtypename)

  !Subroutine to read the vtype name of a person with a given ssn.

  USE police
  CHARACTER :: vtypename*16
  INTEGER :: nrecs

  OPEN(20,FILE='vtype.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=16)
  READ(20,'(I2)',REC=1) nrecs
  vtypename = '****************'
  IF (ivtcode >= 1 .AND. ivtcode <= nrecs) THEN
    READ (20,'(A16)',REC=ivtcode+1) vtypename
  END IF
  CLOSE(20)

END SUBROUTINE getvtype

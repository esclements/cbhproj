SUBROUTINE getcounty(countyname)

  !Subroutine to read the county name of a person with a given ssn.

  USE police
  CHARACTER :: countyname*12
  INTEGER :: nrecs

  OPEN(20,FILE='county.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=12)
  READ(20,'(I2)',REC=1) nrecs
  countyname = '************'
  IF (ictycode >= 0 .AND. ictycode <= nrecs) THEN
    READ (20,'(A12)',REC=ictycode+2) countyname
  END IF
  CLOSE(20)

END SUBROUTINE getcounty

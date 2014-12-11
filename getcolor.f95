SUBROUTINE getcolor(tcolorname,bcolorname)

  !Subroutine to read the color name of a person with a given ssn.

  USE police
  CHARACTER :: tcolorname*25, bcolorname*25
  INTEGER :: nrecs

  OPEN(20,FILE='color.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=25)
  READ(20,'(I2)',REC=1) nrecs
  tcolorname = '*************************'
  bcolorname = '*************************'
  IF (itccode >= 1 .AND. itccode <= nrecs) THEN
    READ (20,'(A25)',REC=itccode+1) tcolorname
  END IF
  IF (ibccode >= 1 .AND. ibccode <= nrecs) THEN
    READ(20,'(A25)',REC=ibccode+1) bcolorname
  END IF
  CLOSE(20)

END SUBROUTINE getcolor

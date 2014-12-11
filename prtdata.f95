SUBROUTINE prtdata

  !Subroutine to display police data read from a social security number.

  USE police
  CHARACTER :: statename*22, tcolorname*25, bcolorname*25, countyname*12, vtypename*16, vmakename*12

  CALL getstate(statename)
  CALL getcolor(tcolorname,bcolorname)
  CALL getcounty(countyname)
  CALL getvtype(vtypename)
  CALL getvmake(vmakename)

  WRITE(*,100) ssn(1:3),'-',ssn(4:5),'-',ssn(6:9),name,street,city,statename(3:22),zip(1:5),'-',zip(6:9),countyname, &
               vtypename, vmakename, tcolorname(4:25), bcolorname(4:25), tag
100 FORMAT(//X,A3,A,A2,A,A4,T28,A20,T48,A30,T68,A19,T88,A19,T108,A5,A,A4,T128,A12,/T28,A16,T48,A12,T68,A21,T88,A21,T108,A7)

END SUBROUTINE prtdata

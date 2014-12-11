SUBROUTINE dspdata

  !Subroutine to display police data read from a social security number.

  USE police
  CHARACTER :: statename*22, tcolorname*25, bcolorname*25, countyname*12, vtypename*16, vmakename*12

  CALL getstate(statename)
  CALL getcolor(tcolorname,bcolorname)
  CALL getcounty(countyname)
  CALL getvtype(vtypename)
  CALL getvmake(vmakename)

  WRITE(*,100) 'NAME: ',name
100 FORMAT(//T20,A,A20)
  WRITE(*,200) 'SOCIAL SECURITY NUMBER: ',ssn(1:3),'-',ssn(4:5),'-',ssn(6:9)
200 FORMAT(/T20,A,A3,A,A2,A,A4)
  WRITE(*,300) 'STREET: ',street,'CITY: ', city, 'STATE: ', statename(3:22), 'ZIP: ', zip(1:5),'-',zip(6:9), 'COUNTY: ', countyname
300 FORMAT(//T20,A,A30,//T20,A,A19,//T20,A,A19,//T20,A,A5,A,A4,//T20,A,A12)
  WRITE(*,400) 'VEHICLE TYPE: ', vtypename, 'VEHICLE MAKE: ', vmakename
400 FORMAT(//T20,A,A16,//T20,A,A12,//T20,A,A22,//T20,A,A22)
  WRITE(*,450)'TOP COLOR: ', tcolorname(4:25), 'BOTTOM COLOR: ', bcolorname(4:25) 
450 FORMAT(T20,A,A22,//T20,A,A22)
  WRITE(*,500) 'TAG: ', tag
500 FORMAT(/T20,A,A9)
  WRITE(*,600) 'Press enter to continue.'
600 FORMAT(///T30,A)

END SUBROUTINE dspdata

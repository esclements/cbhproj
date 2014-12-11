SUBROUTINE option6

  !Option 6 of the project. Used to change an already existing file.
  !
  !By:Emma Clements
  !CBH-101-001

  USE police
  INTEGER :: bsearch, recno
  CHARACTER :: searchssn*9, readssn*11, option*1, newrec*105, inputzip*10

  OPEN(9,FILE='police.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=105)

  DO
    CALL SYSTEM("clear")
    WRITE(*,100)"* * *CHANGE A RECORD* * *."
100 FORMAT(T20,A) 
    WRITE(*,'(///20X,A)',ADVANCE='NO')"Enter social security number or Q to quit: "
    READ(*,'(A11)') readssn
    IF (readssn(1:1) == 'Q' .OR. readssn(1:1) == 'q') EXIT
    IF (readssn(4:4) == '-') THEN
      searchssn = readssn(1:3)//readssn(5:6)//readssn(8:11)
    ELSE
      searchssn = readssn(1:9)
    END IF
    recno = bsearch(searchssn)
    IF (recno == 0) THEN
      WRITE(*,'(T10,A)') "Social security number not found. Please press enter."
      READ*
      CYCLE
    END IF
    CALL dspdata
    WRITE(*,200,ADVANCE='NO') 'Press Y to change this record, or press Q to cancel. '
  200 FORMAT(//T20,A)  
    READ(*,'(A1)') change
    IF (change = 'y' .OR. change = 'Y') THEN
      DO
        CALL SYSTEM('clear')
        WRITE(*,100)"* * *CHANGE A RECORD* * *"
        PRINT*
        WRITE(*,150),"1 - Name","7 - County"
      150 FORMAT(/,T20,A,T40,A)
        WRITE(*,150),"2 - Social Security Number","8 - Vehicle Type"
        WRITE(*,150),"3 - Street","9 - Vehicle Make"
        WRITE(*,150),"4 - City","10 - Top Color"
        WRITE(*,150),"5 - Zip","11 - Bottom Color"
        WRITE(*,150),"6 - State","12 - Tag"
        PRINT*

        WRITE(*,150,ADVANCE="NO"),"Please select a variable to change: "
        READ(*,"(A1)"),option

        SELECT CASE (option)
          CASE ("1")
            !Change name
            WRITE(*,200,ADVANCE='NO') 'Enter the new name: '
          200 FORMAT(//,T20,A)
            READ(*,'(A20)') name
            WRITE(*,210) 'Name changed to', name, '. Please press enter.'
          210 FORMAT(//T20,A,A20,A)
          CASE ("2")
            !Change Social Security Number
            WRITE(*,200,ADVANCE='NO') 'Enter the new social security number: '
            READ(*,'(A11)') readssn
            IF (readssn(4:4) == '-') THEN
              searchssn = readssn(1:3)//readssn(5:6)//readssn(8:11)
            ELSE
              searchssn = readssn(1:9)
            END IF
            WRITE(*,220) 'Social Security Number changed to', searchssn(1:3)//'-'//searchssn(4:5)//'-'//searchssn(6:9), &
                         '. Please press enter.'
          220 FORMAT(//T20,A,A3,A,A2,A,A4,A)
          CASE ("3")
            !Change street
            WRITE(*,200,ADVANCE='NO') 'Enter the new street: '
            READ(*,'(A30)') street
            WRITE(*,230) 'Street changed to', street,'. Please press enter.'
          230 FORMAT(//T20,A,A30,A)
          CASE ("4")
            !Change city
            WRITE(*,200,ADVANCE='NO') 'Enter the new city: '
            READ(*,'(A19)') city
            WRITE(*,240) 'City changed to', city, '. Please press enter.'
          240 FORMAT(//T20,A,A19,A)
          CASE ("5")
            !Change zip
            WRITE(*,200,ADVANCE='NO') 'Enter the new nine digit zip code: '
            READ(*,'(A10)') inputzip
            IF (inputzip(6:6) == '-') THEN
              zip = inputzip(1:5)//inputzip(7:10)
            ELSE
              zip = inputzip
            END IF
            WRITE(*,200) 'Zip changed to', zip(1:5)//'-'//zip(6:9), '. Please press enter.'
          CASE("6")
            !Change state
            CALL statedisplay
            WRITE(*,200,ADVANCE='NO') 'Please enter the new state code: '
            READ(*,'(I2)') istcode
            CALL getstate(statename)
            WRITE(*,200) 'The new state is', statename, '. Please press enter.'
          CASE("7")
            !Change county
            CALL countydisplay
            WRITE(*,200,ADVANCE='NO') 'Please enter the new county code: '
            READ(*,'(I2)') ictycode
            CALL getcounty(countyname)
            WRITE(*,200) 'The new county is', countyname, '. Please press enter.'
          CASE("8")
            !Change Vehicle Type
            CALL vtypedisplay
            WRITE(*,200,ADVANCE='NO') 'Please enter the new vehicle type code: '
            READ(*,'(I2)') ivtcode
            CALL getvtype(vtypename)
            WRITE(*,200) 'The new vehicle type is', vtypename, '. Please press enter.'
          CASE("9")
            !Change Vehicle Make
            CALL vmakedisplay
            WRITE(*,200,ADVANCE='NO') 'Please enter the new vehicle make code: '
            READ(*,'(I2)') ivmcode
            CALL getvmake(vmakename)
            WRITE(*,200) 'The new vehicle make is', vmakename, '. Please press enter.'
          CASE("10")
            !Change Top Color
            CALL colordisplay
            WRITE(*,200,ADVANCE='NO') 'Please enter the new top color code: '
            READ(*,'(I2)') itccode
            CALL getcolor(tcolorname,bcolorname)
            WRITE(*,200) 'The new top color is', tcolorname, '. Please press enter.'
          CASE("11")
            !Change Bottom Color
            CALL colordisplay
            WRITE(*,200,ADVANCE='NO') 'Please enter the new bottom color code: '
            READ(*,'(I2)') ibccode
            CALL getcolor(tcolorname,bcolorname)
            WRITE(*,200) 'The new bottom color is', bcolorname, '. Please press enter.'
          CASE("12")
            !Change tag
            WRITE(*,200,ADVANCE='NO') 'Please enter the new tag: '
            READ(*,'(A7)') tag
          CASE ("s")
            !Save the file
            WRITE(9,'(A105)',REC=nrecs+2)
            EXIT
        END SELECT
      END DO
    ELSE
      WRITE(*,200) 'Record not changed. Please press enter.'
    END IF
    CYCLE
  END DO
END SUBROUTINE option6

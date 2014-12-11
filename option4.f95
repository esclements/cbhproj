SUBROUTINE option4

  !Option 4 of the project. Used to add a record.
  !
  !By:Emma Clements
  !CBH-101-001

  USE police
  INTEGER :: bsearch, recno
  CHARACTER :: searchssn*9, readssn*11, zipinput*10

  OPEN(9,FILE='police.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=105)
  READ(9,'(I2)',REC=1) nrecs

  DO
    CALL SYSTEM("clear")
    WRITE(*,100)"* * *ADD RECORDS* * *."
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
    ssn = searchssn
    IF (recno /= 0) THEN
      WRITE(*,'(T10,A)') "Social security already exists. Please press enter."
      READ*
      CYCLE
    ELSE  IF (recno == 0) THEN
      WRITE(*,200,ADVANCE='NO') 'Please enter name (Last,First M.): '
    200 FORMAT(/T20,A)
      READ(*,'(A20)') name
      WRITE(*,200,ADVANCE='NO') 'Please enter city: '
      READ(*,'(A19)') city
      WRITE(*,200,ADVANCE='NO') 'Please enter street: '
      READ(*,'(A30)') street
      WRITE(*,200,ADVANCE='NO') 'Please enter zip code: '
      READ(*,'(A10)',ADVANCE='NO') zipinput

      IF (zipinput(6:6) == '-') THEN
        zip  = zipinput(1:5)//zipinput(7:10)
      ELSE
        zip = zipinput
      END IF
      READ*
      CALL statedisplay
      WRITE(*,200,ADVANCE='NO') 'Please enter state code: '
      READ(*,'(I2.2)') istcode
      CALL countydisplay
      WRITE(*,200,ADVANCE='NO') 'Please enter county code: '
      READ(*,'(I2.2)') ictycode
      CALL vtypedisplay
      WRITE(*,200,ADVANCE='NO') 'Please enter vehicle type code: '
      READ(*,'(I2.2)') ivtcode
      CALL vmakedisplay
      WRITE(*,200,ADVANCE='NO') 'Please enter vehicle make code: '
      READ(*,'(I2.2)') ivmcode 
      CALL colordisplay
      WRITE(*,200,ADVANCE='NO') 'Please enter top color code: '
      READ(*,'(I2.2)') itccode 
      CALL colordisplay
      WRITE(*,200,ADVANCE='NO') 'Please enter bottom color code: '
      READ(*,'(I2.2)') ibccode 
      WRITE(*,200,ADVANCE='NO') 'Please enter tag: '
      READ(*,'(A7)') tag
   
      nrecs = nrecs + 1
      WRITE(9,'(I2)',REC=1) nrecs
      WRITE(9,300,REC=nrecs+1) ssn,name,street,city,zip,istcode,ictycode,ivtcode,ivmcode, &
                                    itccode,ibccode,tag
    300 FORMAT(A9,A20,A30,A19,A9,2I2,I1,3I2,A7)
      CALL bubble

      CALL SYSTEM('clear')
      CALL dspdata
      WRITE(*,200) 'Record written as shown above. Press enter to continue.'
    END IF
    READ*
    CYCLE
  END DO

END SUBROUTINE option4

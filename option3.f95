SUBROUTINE option3

  !Option 3 of the project. Allows the user to sort through the police data by ssn.
  !
  !By:Emma Clements
  !CBH-101-001

  USE police
  INTEGER :: bsearch, recno
  CHARACTER :: searchssn*9, readssn*11

  OPEN(9,FILE='police.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=105)

  DO
    CALL SYSTEM("clear")
    WRITE(*,100)"* * *SEARCH RECORDS* * *."
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
    READ*
    CYCLE
  END DO
END SUBROUTINE option3

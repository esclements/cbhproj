SUBROUTINE option5

  !Option 5 of the project. Used to delete records.
  !
  !By:Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  INTEGER :: bsearch, recno, nrecs
  CHARACTER :: searchssn*9, readssn*11, delete*1, rec*105

  OPEN(9,FILE='police.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=105)
  READ(9,'(I2)',REC=1) nrecs
 
  DO
    CALL SYSTEM("clear")
    WRITE(*,100)"* * *DELETE RECORDS* * *."
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
    WRITE(*,200,ADVANCE='NO') 'Press Y to delete this record or C to cancel.'
  200 FORMAT(T20,A)
    READ*, delete
    IF (delete == 'y' .OR. delete == 'Y') THEN
      READ(9,'(A105)',REC=nrecs+1) rec
      WRITE(9,'(A105)',REC=recno) rec
      nrecs = nrecs - 1
      WRITE(9,'(I2)',REC=1) nrecs
      WRITE(*,300) 'Record ', searchssn(1:3),'-',searchssn(4:5),'-',searchssn(6:9),' was deleted. Press enter to continue.'
    300 FORMAT(T20,A,A3,A,A2,A,A4,A)
      READ*
      CALL bubble
    ELSE
      WRITE(*,300) 'Record ', searchssn(1:3),'-',searchssn(4:5),'-',searchssn(6:9),' was not deleted. Press enter to continue.'
      READ*
    END IF
    CYCLE
  END DO
END SUBROUTINE option5

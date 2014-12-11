PROGRAM menu

  !This is a program for a menu screen thing. I dunno man. Enter a number
  !and do the thing.
  !
  !By: Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  CHARACTER :: option*1

  DO
    CALL SYSTEM('clear')
    WRITE(*,100)
   100 FORMAT(/,T15,"* * * POLICE DATABASE MAIN MENU * * *",/)
    PRINT*
    WRITE(*,200),"1 - Initial Data Load"
   200 FORMAT(/,T20,A)
    WRITE(*,200),"2 - Display Auxiliary Files"
    WRITE(*,200),"3 - Display a Record (by SSN)"
    WRITE(*,200),"4 - Add a Record"
    WRITE(*,200),"5 - Delete a Record"
    WRITE(*,200),"6 - Modify a Record"
    WRITE(*,200),"7 - List Master File"
    WRITE(*,200),"8 - Exit"
    PRINT*

    WRITE(*,200,ADVANCE="NO"),"     Please select an option:"
    READ(*,"(A1)"),option

    SELECT CASE (option)
      CASE ("1")
        !Run option 1
        CALL OPTION1
      CASE ("2")
        !Run option 2 
        CALL OPTION2
      CASE ("3")
        !Run option 3
        CALL OPTION3
      CASE ("4")
        !Run option 4
        CALL OPTION4
      CASE ("5")
        !Run option 5
        CALL OPTION5
      CASE ("6")
        !Run option 6
        CALL OPTION6
      CASE ("7")
        !Run option 7
        CALL OPTION7
      CASE ("8")
        EXIT
      CASE DEFAULT
        PRINT*,"ERROR: Number not valid"
        READ*
        CYCLE
    END SELECT
  END DO
END PROGRAM menu


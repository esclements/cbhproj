SUBROUTINE option2

  !This is a subroutine to display the option 2 menu. I dunno man. Pick a number
  !and do the thing.
  !
  !By: Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  CHARACTER :: option*1

  DO
    CALL SYSTEM('clear')
    WRITE(*,100)
   100 FORMAT(/,T15,"* * * Police Information System Option 2 Menu * * *",/)
    PRINT*
    WRITE(*,150),"1 - Display State Data"
   150 FORMAT(/,T20,A)
    WRITE(*,150),"2 - Display County Data"
    WRITE(*,150),"3 - Display Vehicle Makes"
    WRITE(*,150),"4 - Display Vehicle Types"
    WRITE(*,150),"5 - Display Vehicle Colors"
    WRITE(*,150),"6 - Return to Main Menu"
    PRINT*

    WRITE(*,150,ADVANCE="NO"),"     Please select an option: "
    READ(*,"(A1)"),option

    SELECT CASE (option)
      CASE ("1")
        !Run option 1
        CALL statedisplay
        WRITE(*,200)
      200 FORMAT(//,T20,'Please press enter.')
        READ*
     CASE ("2")
        !Run option 2 
        CALL countydisplay
        WRITE(*,200)
        READ*
      CASE ("3")
        !Run option 3
        CALL vmakedisplay
        WRITE(*,200)
        READ*
      CASE ("4")
        !Run option 4
        CALL vtypedisplay
        WRITE(*,200)
        READ*
      CASE ("5")
        !Run option 5
        CALL colordisplay
        WRITE(*,200)
        READ*
      CASE ("6")
        !Return to main menu
        EXIT
    END SELECT
  END DO

END SUBROUTINE option2

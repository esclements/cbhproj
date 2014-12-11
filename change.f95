SUBROUTINE change

  !Subroutine to display a menu and ask for changes to a file.

  USE police
  CHARACTER :: option*1

  DO
    CALL SYSTEM('clear')
    WRITE(*,100)
   100 FORMAT(/,T20,"* * * CHANGE A RECORD * * *",/)
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
        WRITE(*,200) 'Name changed to' name
     CASE ("2")
        WRITE(*,200)
        READ*
      CASE ("3")
        WRITE(*,200)
        READ*
      CASE ("4")
        WRITE(*,200)
        READ*
      CASE ("5")
        WRITE(*,200)
        READ*
      CASE ("6")
        !Return to main menu
        EXIT
    END SELECT
  END DO



END SUBROUTINE change

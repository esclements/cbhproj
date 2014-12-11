SUBROUTINE option1

  !Option 1 of the project
  !
  !By:Emma Clements
  !CBH-101-001

  IMPLICIT NONE

  CALL SYSTEM("clear")

  WRITE(*,100)
100 FORMAT(T20,'* * *INITIAL DATA LOAD* * *',//)
  CALL COLOR
  PRINT*
  CALL COUNTY
  PRINT*
  CALL STATE
  PRINT*
  CALL VMAKE
  PRINT*
  CALL VTYPE
  PRINT*
  CALL POLICE
 
  WRITE(*,200)
200 FORMAT(//,T20,'Please press enter.')
  READ*

END SUBROUTINE option1

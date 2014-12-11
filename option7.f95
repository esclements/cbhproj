SUBROUTINE option7

  !Option 7 of the project. Displays the master list.
  !
  !By:Emma Clements
  !CBH-101-001

  USE police
  INTEGER :: nrecs,count
  CHARACTER :: user*1

  OPEN(9,FILE='police.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=105)
  READ(9,'(I2)',REC=1) nrecs

  CALL SYSTEM('clear')
  
  count = 0

  WRITE(*,'(T73,A)') '* * *POLICE DATABASE* * *'
  WRITE(*,50)'(SOCIAL SECURITY NUMBER)','(NAME)','(STREET)','(CITY)','(STATE)','(ZIP)','(COUNTY)', &
              '(VEHICLE TYPE)','(VEHICLE MAKE)','(T COLOR)','(B COLOR)','(TAG)', &
              '-----------------------------------------------------------------------------------------------------------------'
 50 FORMAT(//,X,A,T28,A,T48,A,T68,A,T88,A,T108,A,T128,A,/T28,A,T48,A,T68,A, &
           T88,A,T108,A,/T30,A)
  DO I=2,nrecs+1
    READ(9,100,REC=I) ssn,name,street,city,zip,istcode,ictycode,ivtcode,ivmcode,itccode,ibccode,tag
  100 FORMAT(A9,A20,A30,A19,A9,2I2,I1,3I2,A7)
    CALL prtdata
    count = count + 1
    IF (MOD(count,5) == 0) THEN
      WRITE (*,'(//T15,A)',ADVANCE='NO') 'Press enter to continue or Q to stop.'
      READ(*,'(A1)') user
      IF (user == 'q' .OR. user == 'Q') EXIT  
      CALL SYSTEM('clear')
      WRITE(*,'(T73,A)') '* * *POLICE DATABASE* * *'
      WRITE(*,50) '(SOCIAL SECURITY NUMBER)','(NAME)','(STREET)','(CITY)','(STATE)','(ZIP)','(COUNTY)', &
                    '(VEHICLE TYPE)','(VEHICLE MAKE)','(T COLOR)','(B COLOR)','(TAG)', &
               '-----------------------------------------------------------------------------------------------------------------'
      CYCLE
    END IF
    IF (count == nrecs) THEN
      WRITE (*,'(//T15,A)',ADVANCE='NO') 'You have reached the end of the database. Please press enter'
      READ*
    END IF
  END DO

END SUBROUTINE option7

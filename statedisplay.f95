SUBROUTINE statedisplay

  !Program to display all of the colors in the color data file.
  !
  !Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  INTEGER :: NumberRows=17, nrecs, row, colpos, column, colwidth=27, I
  CHARACTER :: LINE(17)*100, data*22

  CALL SYSTEM('clear')

  WRITE(*,100)
100 FORMAT(T35,'* * *STATES* * *',//)

  OPEN(14,FILE='state.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=22)  
  READ(14,'(I2)',REC=1),nrecs

  DO I = 1, NumberRows
    LINE(I)=''
  END DO

  row = 1
  column = 1

  DO I = 1, nrecs
    colpos = (column - 1) * colwidth
    READ(14,'(A22)',REC=I+1),data
    LINE(row)(colpos+4:colpos+5) = data(1:2)
    LINE(row)(colpos+7:colpos+26) = data(3:22)
    WRITE(LINE(row)(colpos+1:colpos+2),'(I2.2)'),I
  
    row = row + 1
    IF (row > NumberRows) THEN
      row = 1
      column = column + 1
    END IF
  END DO

  DO I = 1, NumberRows
    WRITE(*,'(T10,A100)'),LINE(I)
  END DO

  CLOSE(14)
 

END SUBROUTINE statedisplay

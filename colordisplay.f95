SUBROUTINE colordisplay

  !Program to display all of the colors in the color data file.
  !
  !Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  INTEGER :: NumberRows=16, nrecs, row, colpos, column, colwidth=30, I
  CHARACTER :: LINE(16)*100, data*25

  CALL SYSTEM('clear')

  WRITE(*,100)
100 FORMAT(T20,'* * *VEHICLE COLORS* * *',//)

  OPEN(14,FILE='color.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=25)  
  READ(14,'(I2)',REC=1),nrecs

  DO I = 1, NumberRows
    LINE(I)=''
  END DO

  row = 1
  column = 1

  DO I = 1, nrecs
    colpos = (column - 1) * colwidth
    READ(14,'(A25)',REC=I+1),data
    LINE(row)(colpos+4:colpos+6) = data(1:3)
    LINE(row)(colpos+8:colpos+29) = data(4:25)
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

END SUBROUTINE colordisplay

SUBROUTINE vmakedisplay

  !Program to display all of the colors in the color data file.
  !
  !Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  INTEGER :: NumberRows=17, nrecs, row, colpos, column, colwidth=17, I
  CHARACTER :: LINE(17)*100, data*12

  CALL SYSTEM('clear')

  WRITE(*,100)
100 FORMAT(T20,'* * *VEHICLE MAKES* * *',//)

  OPEN(14,FILE='vmake.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=12)  
  READ(14,'(I2)',REC=1),nrecs

  DO I = 1, NumberRows
    LINE(I)=''
  END DO

  row = 1
  column = 1

  DO I = 1, nrecs
    colpos = (column - 1) * colwidth
    READ(14,'(A12)',REC=I+1),data
    LINE(row)(colpos+4:colpos+16) = data(1:12)
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

END SUBROUTINE vmakedisplay

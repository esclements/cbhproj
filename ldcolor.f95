SUBROUTINE color

  !Program to read colors from a file and write them in a more accessable
  !format in a different file.
  !nrecs is the number of records. icolor is the number associated
  !with the color. badcount is the number of bad records.
  !
  !By Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  INTEGER :: nrecs, icolor, fs, badcount
  CHARACTER :: data*25

  OPEN(7,FILE='color.data')
  OPEN(8,FILE='color.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=25)

  nrecs = 0
  badcount = 0

  DO
    READ(7,100,IOSTAT=fs),icolor,data
  100 FORMAT(I2,A25)
    IF (fs /= 0) EXIT
    IF (icolor < 1 .OR. icolor > 31) THEN
      badcount = badcount + 1
    END IF
    WRITE(8,200,REC=icolor+1),data
  200 FORMAT(A25)
    nrecs = nrecs + 1
 END DO

  WRITE(8,300,REC=1),nrecs
300 FORMAT(I2)  

  CLOSE(7)
  CLOSE(8)

  WRITE(*,400),'Number of colors recorded:',nrecs,'Number of bad records:',badcount
400 FORMAT(A30,I2,A30,I2)

END SUBROUTINE color

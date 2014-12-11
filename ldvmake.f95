SUBROUTINE vmake

  !Program to read vmakes from a file and write them in a more accessable
  !format in a different file.
  !nrecs is the number of records. ivmake is the number associated
  !with the vmake. badcount is the number of bad records.
  !
  !By Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  INTEGER :: nrecs, ivmake, fs, badcount
  CHARACTER :: data*12

  OPEN(7,FILE='vmake.data')
  OPEN(8,FILE='vmake.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=12)

  nrecs = 0
  badcount = 0

  DO
    READ(7,100,IOSTAT=fs),ivmake,data
  100 FORMAT(I2,A12)
    IF (fs /= 0) EXIT
    IF (ivmake < 1 .OR. ivmake > 51) THEN
      badcount = badcount + 1
    END IF
    WRITE(8,200,REC=ivmake+1),data
  200 FORMAT(A12)
    nrecs = nrecs + 1
 END DO

  WRITE(8,300,REC=1),nrecs
300 FORMAT(I2)  

  CLOSE(7)
  CLOSE(8)

  WRITE(*,400),'Number of makes recorded:',nrecs,'Number of bad records:',badcount
400 FORMAT(A30,I2,A30,I2)

END SUBROUTINE vmake

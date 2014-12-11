SUBROUTINE county

  !Program to read countys from a file and write them in a more accessable
  !format in a different file.
  !nrecs is the number of records. icounty is the number associated
  !with the county. badcount is the number of bad records.
  !
  !By Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  INTEGER :: nrecs, icounty, fs, badcount
  CHARACTER :: data*12

  OPEN(7,FILE='county.data')
  OPEN(8,FILE='county.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=12)

  nrecs = 0
  badcount = 0

  DO
    READ(7,100,IOSTAT=fs),icounty,data
  100 FORMAT(I2,A12)
    IF (fs /= 0) EXIT
    IF (icounty < 0 .OR. icounty > 67) THEN
      badcount = badcount + 1
    END IF
    WRITE(8,200,REC=icounty+2),data
  200 FORMAT(A12)
    nrecs = nrecs + 1
 END DO

  nrecs = nrecs - badcount

  WRITE(8,300,REC=1),nrecs
300 FORMAT(I2)  

  CLOSE(7)
  CLOSE(8)

  WRITE(*,400),'Number of counties recorded:',nrecs,'Number of bad records:',badcount
400 FORMAT(A30,I2,A30,I2)

END SUBROUTINE county

SUBROUTINE vtype

  !Program to read vtypes from a file and write them in a more accessable
  !format in a different file.
  !nrecs is the number of records. ivtype is the number associated
  !with the vtype. badcount is the number of bad records.
  !
  !By Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  INTEGER :: nrecs, ivtype, fs, badcount
  CHARACTER :: data*16

  OPEN(7,FILE='vtype.data')
  OPEN(8,FILE='vtype.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=16)

  nrecs = 0
  badcount = 0

  DO
    READ(7,100,IOSTAT=fs),ivtype,data
  100 FORMAT(I2,A16)
    IF (fs /= 0) EXIT
    IF (ivtype < 1 .OR. ivtype > 15) THEN
      badcount = badcount + 1
    END IF
    WRITE(8,200,REC=ivtype+1),data
  200 FORMAT(A16)
    nrecs = nrecs + 1
 END DO

  WRITE(8,300,REC=1),nrecs
300 FORMAT(I2)  

  CLOSE(7)
  CLOSE(8)

  WRITE(*,400),'Number of types recorded:',nrecs,'Number of bad records:',badcount
400 FORMAT(A30,I2,A30,I2)

END SUBROUTINE vtype

SUBROUTINE police

  !Program to read police records from a file and write them in a more
  !accessable format in a different file.
  !nrecs is the number of records.
  !
  !By Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  CHARACTER :: P1*3,P2*2,P3*78,P4*22
  INTEGER :: nrecs, fs

  OPEN(7,FILE='police1.data')
  OPEN(9,FILE='police.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=105)

  nrecs = 0

  DO
    READ(7,100,IOSTAT=fs),P1,P2,P3,P4
  100 FORMAT(A3,1X,A2,1X,A78,1X,A22)
    IF (fs /= 0) EXIT
    WRITE(9,200,REC=nrecs+2),P1,P2,P3,P4
  200 FORMAT(A3,A2,A78,A22)
    nrecs = nrecs + 1
 END DO

  CLOSE(7)
  OPEN(8,FILE='police2.data')

  DO
    READ(8,100,IOSTAT=fs),P1,P2,P3,P4
    IF (fs /= 0) EXIT
    WRITE(9,200,REC=nrecs+2),P1,P2,P3,P4
    nrecs = nrecs + 1
  END DO

  WRITE(9,300,REC=1),nrecs
300 FORMAT(I2)  
  
  CALL bubble

  CLOSE(9)
  CLOSE(8)

  WRITE(*,400),'Number of police records written: ',nrecs
400 FORMAT(T10,A40,I2,//)

END SUBROUTINE police

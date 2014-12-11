SUBROUTINE state

  !Program to read states from a file and write them in a more accessable
  !format in a different file.
  !nrecs is the number of records. istate is the number associated
  !with the state. badcount is the number of bad records.
  !
  !By Emma Clements
  !CBH-101-001

  IMPLICIT NONE
  INTEGER :: nrecs, istate, fs, badcount
  CHARACTER :: data*22

  OPEN(7,FILE='state.data')
  OPEN(8,FILE='state.db',FORM='FORMATTED',ACCESS='DIRECT',RECL=22)

  nrecs = 0
  badcount = 0

  DO
    READ(7,100,IOSTAT=fs),istate,data
  100 FORMAT(I2,A22)
    IF (fs /= 0) EXIT
    WRITE(8,200,REC=istate+1),data
  200 FORMAT(A22)
    nrecs = nrecs + 1
    IF (istate < 1 .OR. istate > 51) THEN
      badcount = badcount + 1
    END IF
  END DO

  WRITE(8,300,REC=1),nrecs
300 FORMAT(I2)  

  CLOSE(7)
  CLOSE(8)

  WRITE(*,400),'Number of states recorded:',nrecs,'Number of bad records:',badcount
400 FORMAT(A30,I2,A30,I2)

END SUBROUTINE state

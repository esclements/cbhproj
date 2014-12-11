INTEGER FUNCTION bsearch(searchssn)

  !Program to search through the module of police data.

  USE police
  CHARACTER :: searchssn*9
  INTEGER :: nrecs, first, last, middle

  READ(9,'(I2)',REC=1) nrecs
  first = 2
  last = nrecs + 1
  bsearch = 0

  DO
    IF (first > last) RETURN
    middle = (first + last) / 2 
    READ(9,100,REC=middle) ssn, name, street, city, zip, istcode, ictycode, ivtcode, itccode, ivmcode, ibccode, tag
  100 FORMAT(A9,A20,A30,A19,A9,2I2,I1,3I2,A7)
   IF (searchssn < ssn) THEN
      last = middle - 1
      CYCLE
    ELSE IF (searchssn > ssn) THEN
      first = middle + 1
      CYCLE
    ELSE IF (searchssn == ssn) THEN
      bsearch = middle
      RETURN
    END IF
  END DO

END FUNCTION bsearch

#
# Makefile for cbhproj
#
CC=f95
CFLAGS=
OBJ=cbhproj.o option2.o option3.o option4.o option5.o option6.o option7.o option1.o ldcolor.o ldcounty.o ldstate.o ldvmake.o ldvtype.o colordisplay.o countydisplay.o statedisplay.o vmakedisplay.o vtypedisplay.o police.o ldmaster.o bubble.o bsearch.o dspdata.o getstate.o getcounty.o getvtype.o getvmake.o getcolor.o prtdata.o

cbhproj: $(OBJ)
	$(CC) -o cbhproj $(OBJ)

cbhproj.o: cbhproj.f95
	$(CC) $(CFLAGS) -c cbhproj.f95

option1.o: option1.f95
	$(CC) $(CFLAGS) -c option1.f95

option2.o: option2.f95
	$(CC) $(CFLAGS) -c option2.f95

option3.o: option3.f95
	$(CC) $(CFLAGS) -c option3.f95

option4.o: option4.f95
	$(CC) $(CFLAGS) -c option4.f95

option5.o: option5.f95
	$(CC) $(CFLAGS) -c option5.f95

option6.o: option6.f95
	$(CC) $(CFLAGS) -c option6.f95

option7.o: option7.f95
	$(CC) $(CFLAGS) -c option7.f95

ldcolor.o: ldcolor.f95
	$(CC) $(CFLAGS) -c ldcolor.f95

ldcounty.o: ldcounty.f95
	$(CC) $(CFLAGS) -c ldcounty.f95

ldstate.o: ldstate.f95
	$(CC) $(CFLAGS) -c ldstate.f95

ldvmake.o: ldvmake.f95
	$(CC) $(CFLAGS) -c ldvmake.f95

ldvtype.o: ldvtype.f95
	$(CC) $(CFLAGS) -c ldvtype.f95

colordisplay.o: colordisplay.f95
	$(CC) $(CFLAGS) -c colordisplay.f95

countydisplay.o: countydisplay.f95
	$(CC) $(CFLAGS) -c countydisplay.f95

statedisplay.o: statedisplay.f95
	$(CC) $(CFLAGS) -c statedisplay.f95

vmakedisplay.o: vmakedisplay.f95
	$(CC) $(CFLAGS) -c vmakedisplay.f95

vtypedisplay.o: vtypedisplay.f95
	$(CC) $(CFLAGS) -c vtypedisplay.f95

ldmaster.o: ldmaster.f95
	$(CC) $(CFLAGS) -c ldmaster.f95

bubble.o: bubble.f95
	$(CC) $(CFLAGS) -c bubble.f95

police.o: police.f95
	$(CC) $(CFLAGS) -c police.f95

bsearch.o: bsearch.f95
	$(CC) $(CFLAGS) -c bsearch.f95

dspdata.o: dspdata.f95
	$(CC) $(CFLAGS) -c dspdata.f95

getstate.o: getstate.f95
	$(CC) $(CFLAGS) -c getstate.f95

getcounty.o: getcounty.f95
	$(CC) $(CFLAGS) -c getcounty.f95

getvtype.o: getvtype.f95
	$(CC) $(CFLAGS) -c getvtype.f95


getvmake.o: getvmake.f95
	$(CC) $(CFLAGS) -c getvmake.f95

getcolor.o: getcolor.f95
	$(CC) $(CFLAGS) -c getcolor.f95

prtdata.o: prtdata.f95
	$(CC) $(CFLAGS) -c prtdata.f95


clean:
	rm cbhproj *.o *.db core darren.tar darren.tar.gz

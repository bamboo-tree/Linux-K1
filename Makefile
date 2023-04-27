.PHONY: clean
.SUFIXES: .c .o .a .so




myApp: mainApplication.o scalograms.a osciloscope.so
	gcc -o $@ $^
mainApplication.o: mainApplication.c
	gcc -c $< -o $@


scalograms.a: drawScalogram.o createScalogramPath.o
	ar rs $@ $^
drawScalogram.o: drawScalogram.c
	gcc -c $< -o $@
createScalogramPath.o: createScalogramPath.c
	gcc -c $< -o $@
	

osciloscope.so: drawOsciloscope.o createOsciloscopePath.o
	gcc -shared -o $@ $^
drawOsciloscope.o: drawOsciloscope.c
	gcc -fPIC -c $<
createOsciloscopePath.o: createOsciloscopePath.c
	gcc -fPIC -c $<
	
clean:
	rm *.o *.a *.so

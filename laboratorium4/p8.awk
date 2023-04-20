{ pay = pay + $3*$4 }
END { 
	print NR, "pracownikow";
	print "calkowita placa wynosi : ", pay;
	print "srednia : ", pay/NR
}

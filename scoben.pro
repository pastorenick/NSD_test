pro scoben
;PULIZIA DEI FILE DI PRECEDENTI AVVII
file_delete, 'FITSFILE',/allow_nonexistent,/recursive

if (file_test('EXTRAMODELS_I') eq 1) then begin
	file_delete, 'EXTRAMODELS_I',/allow_nonexistent,/recursive
endif
if (file_test('EXTRAMODELS_e') eq 1) then begin
	file_delete, 'EXTRAMODELS_e',/allow_nonexistent,/recursive
endif	
if (file_test('EXTRAMODELS_r') eq 1) then begin
	file_delete, 'EXTRAMODELS_r',/allow_nonexistent,/recursive
endif
file_delete, 'par.par',/allow_nonexistent,/recursive
file_delete, 'res_chi2.par',/allow_nonexistent,/recursive

if (file_test('err*.dat') eq 1) then begin
	file_delete, 'err*.dat'
endif
if (file_test('moreprec*') eq 1) then begin
	file_delete, 'moreprec*'
endif
if (file_test('valoriNew*') eq 1) then begin
	file_delete, 'valoriNew*'
endif

;CREAZIONE MODELLI
spawn, 'idl < Idl_proc/idl2'

;CALCOLO ISOFOTE SUI MODELLI SOTTRATTI
openw,1,'tmp.txt'
printf,1,''
printf,1,'cd ./FITSFILE/'
printf,1,'pwd'
printf,1,''
printf,1,'lor lista'
printf,1,''
printf,1,'logout'
printf,1,''
printf,1,''
printf,1,''
close,1
spawn, 'cl < tmp.txt'
file_delete,'tmp.txt'

;CALCOLO ERRORI
spawn, 'idl < Idl_proc/idl3'

;#########SECONDO GIRO#################
file_delete, 'par.par'
if (file_lines('moreprec.txt') gt 4) then begin
	stop
endif

file_delete, 'FITSFILE',/allow_nonexistent,/recursive

;CREAZIONE MODELLI
spawn, 'idl < Idl_proc/idl2'

;CALCOLO ISOFOTE SUI MODELLI SOTTRATTI
openw,1,'tmp.txt'
printf,1,''
printf,1,'pwd'
printf,1,''
printf,1,''
printf,1,'cd ./FITSFILE/'
printf,1,'lor lista'
printf,1,''
printf,1,'logout'
close,1
spawn, 'cl < tmp.txt'
file_delete,'tmp.txt'

;CALCOLO ERRORI
spawn, 'idl < Idl_proc/idl3'

;#########TERZO GIRO#################
file_delete, 'par.par'
if (file_lines('moreprec2.txt') gt 4) then begin
	stop
endif
file_delete, 'FITSFILE',/allow_nonexistent,/recursive

;CREAZIONE MODELLI
spawn, 'idl < Idl_proc/idl2'

;CALCOLO ISOFOTE SUI MODELLI SOTTRATTI
openw,1,'tmp.txt'
printf,1,''
printf,1,'pwd'
printf,1,''
printf,1,''
printf,1,'cd ./FITSFILE/'
printf,1,'lor lista'
printf,1,''
printf,1,'logout'
close,1
spawn, 'cl < tmp.txt'
file_delete,'tmp.txt'

;CALCOLO ERRORI
spawn, 'idl < Idl_proc/idl3'

;ALLARGAMENTO DEI MODELLI PER GLI ERRORI
spawn, 'idl < Idl_proc/idl4'

if (file_test('EXTRAMODELS_I') eq 1) then begin
	openw,1,'tmp.txt'
	printf,1,''
	printf,1,''
	printf,1,''
	printf,1,'cd ./EXTRAMODELS_I/'
	printf,1,'pwd'
	printf,1,''
	printf,1,''
	printf,1,''
	printf,1,''
	printf,1,'lor lista'
	printf,1,''
	printf,1,'logout'
	close,1
	spawn, 'cl < tmp.txt'
	file_delete,'tmp.txt'
endif

if (file_test('EXTRAMODELS_r') eq 1) then begin
	openw,1,'tmp.txt'
	printf,1,''
	printf,1,''
	printf,1,''
	printf,1,'cd ./EXTRAMODELS_r/'
	printf,1,'pwd'
	printf,1,''
	printf,1,''
	printf,1,''
	printf,1,''
	printf,1,'lor lista'
	printf,1,''
	printf,1,'logout'
	close,1
	spawn, 'cl < tmp.txt'
	file_delete,'tmp.txt'
endif


if (file_test('EXTRAMODELS_e') eq 1) then begin
	openw,1,'tmp.txt'
	printf,1,''
	printf,1,''
	printf,1,''
	printf,1,'cd ./EXTRAMODELS_e/'
	printf,1,'pwd'
	printf,1,''
	printf,1,''
	printf,1,''
	printf,1,''
	printf,1,'lor lista'
	printf,1,''
	printf,1,'logout'
	close,1
	spawn, 'cl < tmp.txt'
	file_delete,'tmp.txt'
endif
;VALUTAZIONE FINALE
spawn, 'idl < Idl_proc/idl5'

;CONVERSIONE RISULTATI E PRESENTAZIONE A SCHERMO
spawn, 'idl < Idl_proc/idl6'
end

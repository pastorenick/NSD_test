pro beg
file_delete, 'control.tab',/allow_nonexistent,/recursive
file_delete, 'par2.txt',/allow_nonexistent,/recursive

spawn, 'ds9&'
spawn, 'idl < Idl_proc/idl0' ;#Trova l'angolo dell'asse maggiore partendo da unsharp.fits

;CREAZIONE FILE PER FARE PRIMO ELLIPSE DI CONTROLLO
openr,3,'parameters.txt'		;serve solo per il nome ed il centro
spce=' '
im_name=''
gal=''
path=''
readf,3,spce,spce,im_name,spce,xc,yc,spce,p1,p2,p3,$
       spce,gal,spce,path,spce,lsup,linf,lbord,spce,scal,spce,nm,spce,initialA4
close,3

openr,2,'par2.txt'
readf,2,pa
close,2
pa=strcompress(string(-(90-double(pa))))

openw,1,'tmp.txt'
printf,1,''
printf,1,''
printf,1,''
printf,1,''
printf,1,'stsdas'
printf,1,'ana'
printf,1,'iso'
printf,1,'ellipse (input="',strcompress(string(im_name)),'",output="control.tab",interac=yes,maxsma=200,step=1,x0=',strcompress(xc),',y0=',strcompress(yc),',olthres=0.0,pa=',pa,')',format='((A16,A15,A56,A10,A4,A10,A16,A10,A1))'
printf,1,'flpr'
printf,1,'logout'
close,1
spawn, 'cl < tmp.txt'
file_delete,'tmp.txt'

spawn, 'idl < Idl_proc/idl1'	;Crea file original.eps 

end

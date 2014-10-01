PRO countmap
;recupero parametri
openr,2,'./parameters.txt'
spce=' '
im_name=''
gal=''
path=''
readf,2,spce,spce,im_name,spce,xco,yco,spce,p1,p2,p3,spce,gal,spce,path,spce,lsup,linf,lbord,spce,scal,spce,nm,spce,initialA4
close,2	
	dati=dblarr(file_lines('./results.txt'))
	openr,3,'./results.txt' ;r,e,i,ang,min rms,numero punti,erre,erri,errr
	readf,3,dati
	close,3
	rpix=dati(0)
	e=dati(1)
	ang=dati(3)
	mu=dati(2)
	err_e_1=dati(6)
	err_e_2=dati(7)
	err_I_1=dati(8)
	err_I_2=dati(9)
	err_r_1=dati(10)
	err_r_2=dati(11)
	
	openr, 4, './par2.txt'
	readf, 4, angle
	close, 4
	head=headfits('./'+im_name)
	PA_V3=double(sxpar(head, 'PA_v3'))	
	EXPTIME=sxpar(head, 'exptime')
	;Apertura tab originale	deconvoluta
	table_ext,'./control.tab','sma,intens,int_err,ellip,ellip_err',sma,intens,int_err,ellip,ellip_err
	table_ext,'./control.tab','pa,pa_err,grad,grad_err,b4,b4_err',pa,pa_err,grad,grad_err,a4,a4_err 

	;Apertura tab best model
	table_ext,'./FITSFILE/'+(strcompress(gal,/remove_all))+'_'+strmid(strcompress(mu,/remove_all),0,6)+'_'+strmid(strcompress(rpix,/remove_all),0,6)+'_'+strmid(strcompress(e,/remove_all),0,6)+'_'+strmid(strcompress(ang,/remove_all),0,2)+'.tab','sma,intens,int_err,ellip,ellip_err',Dsma,Dintens,Dint_err,Dellip,Dellip_err
	table_ext,'./FITSFILE/'+(strcompress(gal,/remove_all))+'_'+strmid(strcompress(mu,/remove_all),0,6)+'_'+strmid(strcompress(rpix,/remove_all),0,6)+'_'+strmid(strcompress(e,/remove_all),0,6)+'_'+strmid(strcompress(ang,/remove_all),0,2)+'.tab','pa,pa_err,grad,grad_err,b4,b4_err',Dpa,Dpa_err,Dgrad,Dgrad_err,Da4,Da4_err
	
;modello
angrot=-angle
Img=readfits('./FITSFILE/'+(strcompress(gal,/remove_all))+'_'+strmid(strcompress(mu,/remove_all),0,6)+'_'+strmid(strcompress(rpix,/remove_all),0,6)+'_'+strmid(strcompress(e,/remove_all),0,6)+'_'+strmid(strcompress(ang,/remove_all),0,2)+'.fits',h,noscale)

Img = rot(Img,angrot,/cubic)

xc = 200
yc = 206
dx = 80
dy = 80

;originale

Imgo=readfits(im_name,h,noscale)

dxo= 80
dyo = 80

; Estraggo l'Immagine di dx x dy pixels e la Centro in xc,yc

img1 = Img(xc-dx:xc+dx,yc-dy:yc+dy)


img1o = Imgo(xco-dxo:xco+dxo,yco-dyo:yco+dyo)


; Definisco i Limiti della Box (in arcsec)
scale=scal
xinf= - dx*scale
xsup= dx*scale
yinf = - dy*scale
ysup = dy*scale                     


xinfo= - dxo*scale
xsupo= dxo*scale
yinfo = - dyo*scale
ysupo = dy*scale     


read, zp_stmag,prompt=('Insert the VEGAPOINT for '+im_name+': ')
filter=string(5)
read, filter,prompt=('Insert the filter for '+im_name+': ')


img5 = 2.5*alog10(img1);/EXPTIME*1d)  + zp_stmag

img5o = 2.5*alog10(img1o);/EXPTIME*1d)  + zp_stmag

set_plot,'ps'
device, Filename='countmap'+gal+'.ps',/encapsul,xsize=15,ysize=8;,$
;xoff=(21.0-15.)/2,yoff=(29.7-13.)/2


valso=[0.7,0.9,1,1.5,1.8,2,2.2,2.5,2.8,3.2,3.5,3.7,3.9]

vals=[0.7,0.9,1,1.5,1.8,2,2.2,2.5,2.8,3.2,3.5,3.7,3.9]
 
x0o=2 & x1o=8
y0o=1.5 & y1o=7

x0=8 & x1=14
y0=1.5 & y1=7


;Display the image with its lower-left corner 
;at the origin of the plot window.

;TVSCL, img5,4,2, XSIZE=6.5 , YSIZE=6.5,/centimeters,xsize=sz(1)*1000,ysize=sz(2)
;Write the contours over the image, being sure to use 
;the exact axis styles so that the contours fill the plot 
;window. Inhibit erasing.

CONTOUR, img5, XSTYLE = 5, YSTYLE =5, $
 position=[x0*1000,y0*1000,x1*1000,y1*1000],$
LEVELS = vals, /NOERASE, /Device

CONTOUR, img5o, XSTYLE = 5, YSTYLE =5,$
 position=[x0o*1000,y0o*1000,x1o*1000,y1o*1000],$
LEVELS = valso,/NOERASE, /Device

Plot,[x0,x1],[y0,y1],$
 position=[x0*1000,y0*1000,x1*1000,y1*1000],$
ytickname=[' ', ' ',' ',' ',' ',' '],$
;xtickname=[' ', ' ',' ',' ',' ',' '],$
Xstyle=1, Xrange=[xinf,xsup], $
Ystyle=1, Yrange=[yinf,ysup], $
;Xtitle='!6a [arcsec]',$
xtitle='!6x [arcsec]',$
/Device, /Nodata, /Noerase

Plot,[x0o,x1o],[y0o,y1o],$
 position=[x0o*1000,y0o*1000,x1o*1000,y1o*1000],$; yticks=1, $
Xstyle=1, Xrange=[xinfo,xsupo],$;
;ytickname=[' ', ' ',' ',' ',' ',' '],$
Ystyle=1, Yrange=[yinfo,ysupo], $
;Xtitle='!6a [arcsec]', 
;ytickname=[' ', ' ',' ',' ',' ',' '],$
xtitle='!6x [arcsec]',$
ytitle='!6y [arcsec]',$ 
/Device, /Nodata, /Noerase
xyouts,!X.CRANGE[0]+(0.3*(2*(!X.CRANGE[1]-!X.CRANGE[0]))),!Y.CRANGE[1]+(-0.02*(!Y.CRANGE[0]-!Y.CRANGE[1])),gal+' '+filter,charsize=1.32,charthick=1
device,/close

end

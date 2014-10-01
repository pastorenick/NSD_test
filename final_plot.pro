pro intensita

;Lettura file con cartelle
;nfilt=file_lines('filters.txt')
;direc=strarr(nfilt)
;openr,1, 'filters.txt'
;readf,1,direc
;close,1
direc=strarr(1)
direc(0)='.'
;Preparazione PLOT
a=findgen(17)*(!pi*2/16)
usersym,cos(a),sin(a), /fill
loadct,12
set_plot,'ps'
device,filename='plot_finale.ps',/color,portrait=0,xsize=16,ysize=26
;read, xrange1,prompt=('Insert the "x" range [arcsec]: ')
;read, xrange2
;xr=(xrange2-xrange1)*0.22d/2.5d
xr=0.22
xrange1=0
xrange2=80
i=0
nfilt=1
;Ogni iterazione corrisponde ad una carella (un filtro)
for i=0,(nfilt-1) do begin

	;Lettura parametri e risultati	
	openr,2,direc(i)+'/parameters.txt'
	spce=' '
	im_name=''
	gal=''
	path=''
	readf,2,spce,spce,im_name,spce,xc,yc,spce,p1,p2,p3,spce,gal,spce,path,spce,lsup,linf,lbord,spce,scal,spce,nm,spce,initialA4
	close,2	
	
	dati=dblarr(file_lines(direc(i)+'/results.txt'))
	openr,3,direc(i)+'/results.txt' ;r,e,i,ang,min rms,numero punti,erre,erri,errr
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

	openr, 4, direc(i)+'/par2.txt'
	readf, 4, angle
	close, 4

	ind=indgen(1000)
	indars=ind*scal

	;Apertura tab originale	deconvoluta
	table_ext,direc(i)+'/control.tab','sma,intens,int_err,ellip,ellip_err',sma,intens,int_err,ellip,ellip_err
	table_ext,direc(i)+'/control.tab','pa,pa_err,grad,grad_err,b4,b4_err',pa,pa_err,grad,grad_err,a4,a4_err 

	;Apertura tab best model
	table_ext,direc(i)+'/FITSFILE/'+(strcompress(gal,/remove_all))+'_'+strmid(strcompress(mu,/remove_all),0,6)+'_'+strmid(strcompress(rpix,/remove_all),0,6)+'_'+strmid(strcompress(e,/remove_all),0,6)+'_'+strmid(strcompress(ang,/remove_all),0,2)+'.tab','sma,intens,int_err,ellip,ellip_err',Dsma,Dintens,Dint_err,Dellip,Dellip_err
	table_ext,direc(i)+'/FITSFILE/'+(strcompress(gal,/remove_all))+'_'+strmid(strcompress(mu,/remove_all),0,6)+'_'+strmid(strcompress(rpix,/remove_all),0,6)+'_'+strmid(strcompress(e,/remove_all),0,6)+'_'+strmid(strcompress(ang,/remove_all),0,2)+'.tab','pa,pa_err,grad,grad_err,b4,b4_err',Dpa,Dpa_err,Dgrad,Dgrad_err,Da4,Da4_err
	;if ((where(dpa le 0)) ne -1) then begin		
	;	dpa(where(dpa le 0))=dpa(where(dpa le 0))+180
	;endif
	head=headfits(direc(i)+'/'+im_name)
	PA_V3=double(sxpar(head, 'PA_v3'))	
	EXPTIME=sxpar(head, 'exptime')

	read, VEGAPOINT,prompt=('Insert the VEGAPOINT for '+direc(i)+': ')
	arso=Dsma*scal
	A4o=a4*100
	A4=Da4*100
	A4o_err=a4_err*100
	A4_err=Da4_err*100
	;Calcolo delle SB per l'originale
	sbo=intens/(scal^2)
	inteno=-2.5*(alog10(sbo*1d));/EXPTIME))+VEGAPOINT
	sb=Dintens/(scal^2)
	inten=-2.5*(alog10(sb*1d));/EXPTIME))+VEGAPOINT

	sbo_errp=(intens+int_err)/(scal^2)
	sbo_errm=(intens-int_err)/(scal^2)
	inteno_errp=-2.5*(alog10(sbo_errp));/EXPTIME))+VEGAPOINT
	inteno_errm=-2.5*(alog10(sbo_errm));/EXPTIME))+VEGAPOINT
	sb_errp=(Dintens+Dint_err)/(scal^2)
	sb_errm=(Dintens-Dint_err)/(scal^2)
	inten_errp=-2.5*(alog10(sb_errp));/EXPTIME))+VEGAPOINT
	inten_errm=-2.5*(alog10(sb_errm));/EXPTIME))+VEGAPOINT


	;Angolo di posizione
		
	read, instrument,prompt=('Select the instrument used for '+direc(i)+' [1)WFPC 3)ACS]: ')
	if (instrument eq 1) then begin
		PAo=pa+180
		PAd=(dpa-(180d)+angle)+360
		PAo_errp=pa+pa_err+180
		PAo_errm=pa-pa_err+180
		PAd_errp=(dpa+Dpa_err-(180d)+angle)+360
		PAd_errm=(dpa-Dpa_err-(180d)+angle)+360

		print, PAd
print,'------------'
print, pao-pad
	endif else begin 
		if (instrument eq 3) then begin
				print, 'ciao'		
		endif
	endelse
	intdisk = mu*(exp(-(indars)/(rpix*scal)))
	intdiskars = intdisk/(scal^2)
	intboars = intens/scal^2
	rap=(intdiskars/intboars)
	sbdisc=-2.5*alog10(intdiskars);/EXPTIME)+VEGAPOINT

	if (instrument eq 3) then begin
;da studiare come va l'angolo su ACS
	endif


	;PLOT
	;Mu
	if (i eq 0) then begin	
		plot,arso,inteno,charsize=1.32,ytitle='!7 l!6 [mag arcsec!S!E-2!N]',pos=[0.15,0.75,0.93,0.93],xrange=[xrange1,xrange2],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],symsize=0.5,psym=6,/noerase,/nodata,ystyle=1,yrange=[0,-7]
		xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[1]+(0.2*(!Y.CRANGE[0]-!Y.CRANGE[1])),'(a)',charsize=1.0,charthick=1
		;xyouts,!X.CRANGE[0]+(0.87*(2*(!X.CRANGE[1]-!X.CRANGE[0]))),!Y.CRANGE[1]+(-0.02*(!Y.CRANGE[0]-!Y.CRANGE[1])),'!6 NGC 4698',charsize=1.32,charthick=1
	endif else begin	
		plot,arso,inteno,charsize=1.32,pos=[0.15,0.75,0.3+(xr*i),0.93],xrange=[xrange1,xrange2],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],yrange=[21,10],symsize=0.5,psym=6,/noerase,/nodata,ystyle=1,ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ']
	endelse	
	oplot,arso,sbdisc,psym=0,thick=2,color=fsc_color('Blue')
	oplot,arso,inteno,symsize=0.5,psym=6,color=fsc_color('Black')
	errplot,arso,inteno_errp,inteno_errm
	xyouts,1.5,13,direc(i),charsize=1,charthick=2

	;D/T
	if (i eq 0) then begin	
		plot,arso,rap,psym=0,symsize=0,charsize=1.32,pos=[0.15,0.62,0.93,0.75],xrange=[xrange1,xrange2],xstyle=1,ytitle='D/T',xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],/noerase,yrange=[0,0.5],/nodata,ystyle=1,ytickinterval=0.2
		xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[0]+(0.8*(!Y.CRANGE[1]-!Y.CRANGE[0])),'(b)',charsize=1.0,charthick=1
	endif else begin
		plot,arso,rap,psym=0,symsize=0,charsize=1.32,pos=[0.15,0.62,0.3+(xr*i),0.75],xrange=[xrange1,xrange2],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],/noerase,yrange=[0,0.7],/nodata,ystyle=1,ytickinterval=0.2,ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ']
	endelse
	oplot,arso,rap,psym=0,symsize=1,thick=2,color=fsc_color('Blue')
	
	;ellipticity
	if (i eq 0) then begin	
		plot,arso,ellip,charsize=1.32,pos=[0.15,0.44,0.93,0.62],xrange=[xrange1,xrange2],xstyle=1,ytitle='!2 e !6',xtickname=[' ',' ',' ',' ',' ',' ',' ',' '],yrange=[0,0.8],symsize=0.5,psym=6,/noerase,ytickname=['0.0','0.2','0.4','0.6',' ']
		xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[0]+(0.8*(!Y.CRANGE[1]-!Y.CRANGE[0])),'(c)',charsize=1.0,charthick=1
	endif else begin
		plot,arso,ellip,charsize=1.32,pos=[0.15,0.44,0.3+(xr*i),0.62],xrange=[xrange1,xrange2],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' '],yrange=[0,0.6],symsize=0.5,psym=6,/noerase,ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ']
	endelse	
	oplot,arso,Dellip,psym=8,symsize=0.5,color=200
	errplot,arso,ellip+ellip_err,ellip-ellip_err
	errplot,arso,Dellip+Dellip_err,Dellip-Dellip_err,color=200
	;oplot,[0.3,0.3],[-100,100],color=fsc_color('green'),linestyle=3,THICK=1

	;PA
	if (i eq 0) then begin		
		plot,arso,PAo,charsize=1.42,ytitle='!6PA [!12_!6]',pos=[0.15,0.26,0.93,0.44],xrange=[xrange1,xrange2],symsize=0.5,psym=6,xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],/noerase,yrange=[50,250],ytickname=[' ','145','150','155',' ']
		xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[0]+(0.8*(!Y.CRANGE[1]-!Y.CRANGE[0])),'(d)',charsize=1.0,charthick=1
	endif else begin
		plot,arso,PAo,charsize=1.42,pos=[0.15,0.26,0.3+(xr*i),0.44],xrange=[xrange1,xrange2],yrange=[-30,180],symsize=0.5,psym=6,xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],/noerase,ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ']
	endelse
	oplot,arso,PAd,psym=8,symsize=0.5,color=200
	errplot,arso,PAo_errp,PAo_errm
	errplot,arso,PAD_errp,PAD_errm,color=200
	;oplot,[0.3,0.3],[-1000,1000],color=fsc_color('green'),linestyle=3,THICK=1

	;a4
	if (i eq 0) then begin	
		plot,arso,A4o,charsize=1.32,xtitle='a [arcsec]',ytitle='A!D4!N*100/a',pos=[0.15,0.08,0.93,0.26],xrange=[xrange1,xrange2],yrange=[-2,7],symsize=0.5,psym=6,xstyle=1,ystyle=1,/noerase;,xtickname=['0',' ','1',' ','2',' ','3',' ']
		xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[0]+(0.8*(!Y.CRANGE[1]-!Y.CRANGE[0])),'(e)',charsize=1.0,charthick=1	
	endif else begin	
	plot,arso,A4o,charsize=1.32,xtitle='a [arcsec]',pos=[0.15,0.08,0.3+(xr*i),0.26],xrange=[xrange1,xrange2],yrange=[-4,9],symsize=0.5,psym=6,xstyle=1,ystyle=1,xtickname=['0',' ','1',' ','2',' ','3',' '],/noerase,ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ']
	endelse
	oplot,arso,A4,psym=8,symsize=0.5,color=200
	errplot,arso,A4o+A4o_err,A4o-A4o_err
	errplot,arso,A4+A4_err,A4-A4_err,color=200
	oplot,[0,1000+10],[initialA4,initialA4],linestyle=1
	oplot,[linf,linf],[-100,100],color=fsc_color('green'),linestyle=3,THICK=1
	oplot,[lsup,lsup],[-100,100],color=fsc_color('green'),linestyle=3,THICK=1
	oplot,[lbord,lbord],[-100,100],color=fsc_color('green'),linestyle=3,THICK=1
endfor
device,/close
!P.Multi=0
end

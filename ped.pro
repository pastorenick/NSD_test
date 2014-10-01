pro plotell

;Parameters
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

openr,3,'parameters.txt'
spce=' '
im_name=''
gal=''
path=''
readf,3,spce,spce,im_name,spce,xc,yc,spce,p1,p2,p3,$
       spce,gal,spce,path,spce,lsup,linf,lbord,spce,scal,spce,nm,spce,initialA4
close,3
galaxy=gal
file=im_name
im_name='control.tab'
scal_pc=scal

head=headfits(file)
	PA_V3=double(sxpar(head, 'PA_v3'))	
	EXPTIME=sxpar(head, 'exptime')

filter='F555W'
read, filter,prompt=('Insert the filter: ')
read, magcos,prompt=('Insert the VEGAPOINT: ')
sky=880.21

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

table_ext,'./'+im_name,'sma,pa,pa_err,x0,x0_err,y0,y0_err,a3,a3_err',prad,pa,pa_err,x0,x0_err,y0,y0_err,b3,b3_err
table_ext,'./'+im_name,'b3,b3_err,a4,a4_err,b4,b4_err,ellip,ellip_err',a3,a3_err,b4,b4_err,a4,a4_err,ell,ell_err
table_ext,'./'+im_name,'intens,int_err',int,int_err
arso=prad*scal_pc
A3=a3*100
A3_err=a3_err*100
A4=a4*100
A4_err=a4_err*100
B3=B3*100
B3_err=b3_err*100
B4=B4*100
B4_err=B4_err*100

sb=int/(exptime*1d*(scal_pc^2))


mag=-2.5*(alog10(sb))+magcos 

a=where(pa ge 0)
if (a(0) gt -1) then begin
pa_pos=pa(a)
endif
b=where(pa le 0)
if (b(0) gt -1) then begin
pa_neg=pa(b)
pa_neg=pa_neg+180
pa(b)=pa_neg
endif
PA=pa+0

N=n_elements(v5)

a=findgen(17)*(!pi*2/16)
usersym,cos(a),sin(a), /fill


set_plot,'ps'

device,filename='phot'+filter+'.ps',/color,xsize=18,ysize=32;,portrait=0

;PLOT DELLA BRILLANZA

xlim1=0
dimarso=n_elements(arso)
xlim2=arso(dimarso-1)
dimmaga=n_elements(mag)
ylim1=mag(0)
ylim2=mag(dimmaga-1)



plot,arso,mag,charsize=1,ytitle='!7 l  !6 [mag arcsec!S!E-2!N]',pos=[0.083,0.56,0.5,0.91],$
  xrange=[xlim1,xlim2],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' '],yrange=[ylim2,ylim1],symsize=0.5,psym=8,/noerase,title=galaxy+'  '+filter
xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[1]+(0.2*(!Y.CRANGE[0]-!Y.CRANGE[1])),'(a)',charsize=1.0,charthick=1
;ELLI
epsiBIN= "145B
epsisym='!4'+string(epsiBIN)+'!X'
ploterror,arso,ell,arso*0,ell_err,charsize=1,pos=[0.5,0.74,0.916,0.91],$
	xrange=[xlim1,xlim2],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],yrange=[0,0.8],ystyle=1,ytickname=[' ',' ',' ',' ',' ',' ',' '],symsize=0.2,psym=8,/noerase
axis,xlim2,0.88,yaxis=1,charsize=1,ytitle=epsisym,/data,ystyle=1
xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[1]+(0.2*(!Y.CRANGE[0]-!Y.CRANGE[1])),'(b)',charsize=1.0,charthick=1

;PA
ploterror,arso,PA,arso*0,PA_err,charsize=1,pos=[0.5,0.56,0.916,0.74],$
  xrange=[xlim1,xlim2],yrange=[0,200],xtickname=[' ',' ',' ',' ',' ',' ',' ',' '],symsize=0.2,psym=8,xstyle=1,ystyle=1,ytickname=[' ',' ',' ',' ',' ',' ',' ',' '],/noerase
axis,xlim2,0.88,yaxis=1,charsize=1,ytitle='PA [!Uo!N]',/data,ystyle=1,ytickname=['0','50','100','150',' ']
oplot,[0,1000+10],[0,0]
xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[1]+(0.2*(!Y.CRANGE[0]-!Y.CRANGE[1])),'(c)',charsize=1.0,charthick=1


;X
x0=x0-x0(0)
x0=x0*scal_pc
x0_err=x0_err*scal_pc
ploterror,arso,x0,arso*0,x0_err,charsize=1,ytitle='x!Dc!N [arcsec]',pos=[0.083,0.38,0.5,0.56],$
     xrange=[xlim1,xlim2],yrange=[-0.25,0.25],symsize=0.2,psym=8,xstyle=1,ystyle=1,/noerase,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ']
oplot,[0,1000+10],[0,0]
xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[1]+(0.2*(!Y.CRANGE[0]-!Y.CRANGE[1])),'(d)',charsize=1.0,charthick=1

;A3
ploterror,arso,A3,arso*0,A3_err,charsize=1,ytitle='A!D3!N*100/a',pos=[0.083,0.21,0.5,0.38],$
     xrange=[xlim1,xlim2],yrange=[-5,5],symsize=0.2,psym=8,xstyle=1,ystyle=1,/noerase,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ']
oplot,[0,1000+10],[0,0],linestyle=1
xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[1]+(0.2*(!Y.CRANGE[0]-!Y.CRANGE[1])),'(f)',charsize=1.0,charthick=1

;A4
ploterror,arso,A4,arso*0,A4_err,charsize=1,ytitle='A!D4!N*100/a',xtitle='a [arcsec]',pos=[0.083,0.035,0.5,0.21],$
     xrange=[xlim1,xlim2],yrange=[-6,6],symsize=0.2,psym=8,xstyle=1,ystyle=1,/noerase
oplot,[0,1000+10],[0,0],linestyle=1
xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[1]+(0.2*(!Y.CRANGE[0]-!Y.CRANGE[1])),'(h)',charsize=1.0,charthick=1

;Y

y0=y0-y0(0)
y0=y0*scal_pc
y0_err=y0_err*scal_pc
ploterror,arso,y0,arso*0,y0_err,charsize=1,pos=[0.5,0.38,0.916,0.56],$
     xrange=[xlim1,xlim2],yrange=[-0.25,0.25],symsize=0.2,psym=8,xstyle=1,ystyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' '],ytickname=[' ',' ',' ',' ',' ',' ',' ',' '],/noerase
oplot,[0,1000+10],[0,0]
axis,xlim2,0.88,yaxis=1,charsize=1,ytitle='y!Dc!N [arcsec]',/data,ystyle=1
xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[1]+(0.2*(!Y.CRANGE[0]-!Y.CRANGE[1])),'(e)',charsize=1.0,charthick=1

;B3
ploterror,arso,B3,arso*0,b3_err,charsize=1,pos=[0.5,0.21,0.916,0.38],$
     xrange=[xlim1,xlim2],yrange=[-5,5],symsize=0.2,psym=8,xstyle=1,ystyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' '],ytickname=[' ',' ',' ',' ',' ',' ',' ',' '],/noerase
oplot,[0,1000+10],[0,0],linestyle=1
axis,xlim2,0.88,yaxis=1,charsize=1,ytitle='B!D3!N*100/a',/data,ystyle=1
xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[1]+(0.2*(!Y.CRANGE[0]-!Y.CRANGE[1])),'(g)',charsize=1.0,charthick=1

;B4
ploterror,arso,B4,arso*0,b4_err,charsize=1,xtitle='a [arcsec]',pos=[0.5,0.035,0.916,0.21],$
     xrange=[xlim1,xlim2],yrange=[-6,6],symsize=0.2,psym=8,xstyle=1,ystyle=1,ytickname=[' ',' ',' ',' ',' ',' ',' ',' '],/noerase
oplot,[0,1000+10],[0,0],linestyle=1
axis,xlim2,0.88,yaxis=1,charsize=0.8,ytitle='B!D4!N*100/a',/data,ystyle=1
xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[1]+(0.2*(!Y.CRANGE[0]-!Y.CRANGE[1])),'(i)',charsize=1.0,charthick=1

device,/close

end

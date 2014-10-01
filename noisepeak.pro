pro noisepeak

;Lettura parametri e risultati	
	openr,2,'./parameters.txt'
	spce=' '
	im_name=''
	gal=''
	path=''
	readf,2,spce,spce,im_name,spce,xc,yc,spce,p1,p2,p3,spce,gal,spce,path,spce,lsup,linf,lbord,spce,scal,spce,nm,spce,initialA4
	close,2	
	filter=string(1)
	read, filter,prompt=('Insert the filter for '+im_name+': ')
numgal=strmid( strcompress(string(im_name),/remove_all) ,0,4 )

openw,1,'listagal.txt'
for i=1,9 do begin
	printf,1,numgal+'dec_'+strcompress(string(i*2),/remove_all)+'.fits'
endfor
printf, 1, im_name
close,1



readcol, 'listagal.txt',gal,format='A'

scale=scal
magn=1
scale_real=scale/magn

;3sigma (pixel) = (((0.06/2.35)/scale_real)*3) 
d=round(((0.06/2.35)/scale_real)*3)
;5 sigma
d2=round(((0.06/2.35)/scale_real)*5)
;10 sigma
d3=round(((0.06/2.35)/scale_real)*10)

;xc=430
;yc=450
dxy_noise=20

img=readfits(gal(0),h,/noscale)
sz=size(img)
fract=0.5
img=congrid(img,sz(1)*fract,sz(2)*fract)
dxy_noisef=dxy_noise*fract

tv,bytscl(img,min=0,max=2000),0,0
CURSOR,xc,yc, /DEVICE,/DOWN
   ic=img(xc-dxy_noisef:xc+dxy_noisef,yc-dxy_noisef:yc+dxy_noisef)
   cb=bytscl(ic,min=-10,max=1)
   cbz=cb*0-1
;   tvscl,[[[cbz]],[[cb]],[[cbz]]],true=3,xc-dxy_noisef,yc-dxy_noisef
tv,bytscl(img,min=0,max=20),0,0
tvscl,[[[cbz]],[[cbz]],[[cb]]],true=3,xc-dxy_noisef,yc-dxy_noisef
CURSOR,a,b, /DEVICE,/DOWN
   ic=img(a-dxy_noisef:a+dxy_noisef,b-dxy_noisef:b+dxy_noisef)
   cb=bytscl(ic,min=-10,max=1)
   cbz=cb*0-1
   tvscl,[[[cbz]],[[cb]],[[cbz]]],true=3,a-dxy_noisef,b-dxy_noisef
   
CURSOR,c, dd, /DEVICE,/DOWN
ic=img(c-dxy_noisef:c+dxy_noisef,dd-dxy_noisef:dd+dxy_noisef)
   cb=bytscl(ic,min=-10,max=1)
   cbz=cb*0-1
   tvscl,[[[cbz]],[[cb]],[[cbz]]],true=3,c-dxy_noisef,dd-dxy_noisef
CURSOR,e,f, /DEVICE,/DOWN
ic=img(e-dxy_noisef:e+dxy_noisef,f-dxy_noisef:f+dxy_noisef)
   cb=bytscl(ic,min=-10,max=1)
   cbz=cb*0-1
   tvscl,[[[cbz]],[[cb]],[[cbz]]],true=3,e-dxy_noisef,f-dxy_noisef
CURSOR,g,h, /DEVICE,/DOWN
ic=img(g-dxy_noisef:g+dxy_noisef,h-dxy_noisef:h+dxy_noisef)
   cb=bytscl(ic,min=-10,max=1)
   cbz=cb*0-1
   tvscl,[[[cbz]],[[cb]],[[cbz]]],true=3,g-dxy_noisef,h-dxy_noisef


n1=[floor(a/fract),floor(b/fract)]
n2=[floor(c/fract),floor(dd/fract)]
n3=[floor(e/fract),floor(f/fract)]
n4=[floor(g/fract),floor(h/fract)]
xc=floor(xc/fract)
yc=floor(yc/fract)

massimi=dblarr(n_elements(gal))
massimi2=dblarr(n_elements(gal))
massimi3=dblarr(n_elements(gal))

rms1=dblarr(n_elements(gal))
rms2=dblarr(n_elements(gal))
rms3=dblarr(n_elements(gal))
rms4=dblarr(n_elements(gal))
delta=dblarr(n_elements(gal))
delta2=dblarr(n_elements(gal))
delta3=dblarr(n_elements(gal))
rms3p=dblarr(n_elements(gal))

for i=0,n_elements(gal)-1 do begin 

    conv = READFITS(gal(i), h, /NOSCALE)

;seleziono regione picco 1
    pic=conv(xc-dxy_noise:xc+dxy_noise,yc-dxy_noise:yc+dxy_noise) ;436.28  431.89
    pic=rebin(pic,magn*(2*dxy_noise+1),magn*(2*dxy_noise+1))
    sz=size(pic)
    max=max(pic,cen)
    xcc =cen MOD sz(1)
    ycc = cen/sz(2)
    rx=(double(lindgen(sz(4)) mod sz(1))-xcc) 
    ry=(double(lindgen(sz(4)) / sz(2))-ycc) 
    r=sqrt(rx^2+ry^2)   
    r_matr=reform(r,sz(1),sz(2))
    
    area_ok=where2d(r_matr le d)
    pic_avg=(pic(area_ok(0,*),area_ok(1,*)))
    peak=moment(pic_avg)
    massimi(i)=peak(0)

;seleziono regione picco 2
;    pic_avg=pic((dxy_noise/2)-d:(dxy_noise/2)+d,(dxy_noise/2)-d:(dxy_noise/2)+d)


    area_ok2=where2d(r_matr le d2)
    pic_avg2=(pic(area_ok2(0,*),area_ok2(1,*)))
    peak2=moment(pic_avg2)
    massimi2(i)=peak2(0)

;seleziono regione picco 3
    area_ok3=where2d(r_matr le d3)
    pic_avg3=(pic(area_ok3(0,*),area_ok3(1,*)))
    peak3=moment(pic_avg3)
    massimi3(i)=peak3(0)

;seleziono regione1 rumore
    noi1=conv(n1(0)-dxy_noise:n1(0)+dxy_noise,n1(1)-dxy_noise:n1(1)+dxy_noise)
    rum1=stddev(noi1)
    rms1(i)=rum1

;seleziono regione3 rumore
    noi3=conv(n3(0)-dxy_noise:n3(0)+dxy_noise,n3(1)-dxy_noise:n3(1)+dxy_noise)
    rum3=stddev(noi3)
    rms3(i)=rum3

x1=1.5
x2=16

endfor


delta(0)=0
rms3p(0)=0

  for i=1, n_elements(gal)-1 do begin
      delta(i)=(massimi(i)-massimi(i-1))/massimi(i)
      delta2(i)=(massimi2(i)-massimi2(i-1))/massimi2(i)
      delta3(i)=(massimi3(i)-massimi3(i-1))/massimi3(i)    
       rms3p(i)=(rms3(i)-rms3(1))/rms3(i)
  endfor

set_plot,'ps'
device,filename='lucy_iteraz_circ.ps',/color,xsize=12,ysize=15;,portrait=0;xsize=18,ysize=26


x=indgen(n_elements(gal))*2
PLOTSYM, 8,0.9;,/fill
plot,x,massimi,charsize=1.00,pos=[0.2,0.68,0.99,0.94],$
  xrange=[x1,x2],xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],yrange=[min(massimi)-0.8*min(massimi),max(massimi)+0.3*min(massimi)],$
  psym=8,xstyle=1,ystyle=1,ytitle='!6I [ADU/pixel]',/noerase,color=fsc_color('Black'),/nodata
oplot,x,massimi,color=fsc_color('Green'),psym=8
PLOTSYM, 4,0.9;,/fill
oplot,x,massimi2,color=fsc_color('red'),psym=8
PLOTSYM, 0,0.9;,/fill
oplot,x,massimi3,color=fsc_color('blue'),psym=8
;oplot,[-0.5,1000+10],[2600,2600]
xyouts,!X.CRANGE[0]+(0.05*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[0]+(0.85*(!Y.CRANGE[1]-!Y.CRANGE[0])),'(a)',charsize=1.0,charthick=1

xyouts,!X.CRANGE[0]+(0.15*(2*(!X.CRANGE[1]-!X.CRANGE[0]))),!Y.CRANGE[1]+(-0.02*(!Y.CRANGE[0]-!Y.CRANGE[1])),'NGC'+numgal+' '+filter,charsize=1.32,charthick=1



PLOTSYM, 8,0.9;,/fill
;legend,['!6 1 PSF FWHM'],color=[FSC_Color('Green')],psym=[8],box=0,/top ,/left,charsize = 0.8,CHARTHICK=1.0,position=[0,5700] 
PLOTSYM, 4,0.9;,/fill
;legend,['!63 PSF FWHM'],color=[FSC_Color('Red')],psym=[8],box=0,/top ,/left,charsize = 0.8,CHARTHICK=1.0,position=[7,5700] 
PLOTSYM, 0,0.9;,/fill
;legend,['!65 PSF FWHM'],color=[FSC_Color('Blue')],psym=[8],box=0,/top ,/left,charsize = 0.8,CHARTHICK=1.0,position=[14,5700] 



PLOTSYM, 8,0.9;,/fill
plot,x,delta,charsize=1.00,pos=[0.2,0.38,0.99,0.68],ytickname=['0.0','0.1','0.2',' '],$
  xrange=[x1,x2],xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],yrange=[-0.09,0.3],$
  symsize=0.5,psym=2,xstyle=1,ystyle=1,ytitle='!4D!6I/I',/noerase ,/nodata
oplot,x,delta,color=fsc_color('Green'),psym=8
PLOTSYM, 4,0.9;,/fill
oplot,x,delta2,color=fsc_color('red'),psym=8
PLOTSYM, 0,0.9;,/fill
oplot,x,delta3,color=fsc_color('Blue'),psym=8
oplot,[-0.5,1000+10],[0,0],linestyle=2
xyouts,!X.CRANGE[0]+(0.05*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[0]+(0.85*(!Y.CRANGE[1]-!Y.CRANGE[0])),'!6(b)',charsize=1.0,charthick=1


maxrms=max(rms1)
minrms=min(rms1)
if (minrms lt 0.5) then begin
minrms=0.5
endif

plot,x,rms1,charsize=1.00,pos=[0.2,0.08,0.99,0.38],xtickname=['2','4','6','8','10','12','14',' '],$
  xrange=[x1,x2],xtitle='!6N [iterazioni] ',ytitle='!6 rms [ADU/pixel]',$
  symsize=0.5,psym=5,xstyle=1,ystyle=1,/noerase,/nodata ,yrange=[minrms-0.5,maxrms+0.5] 
;oplot,[-0.5,1000+10],[0,0]

PLOTSYM,/fill, 0,0.9;,/fill
oplot,x,rms3,psym=8,symsize=0.5,color=fsc_color('black')
;oplot,x,rms3p,psym=8,symsize=0.7,color=fsc_color('orange')
xyouts,!X.CRANGE[0]+(0.05*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[0]+(0.85*(!Y.CRANGE[1]-!Y.CRANGE[0])),'(c)',charsize=1.0,charthick=1

device ,/close


stop
end


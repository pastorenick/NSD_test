pro confronti
;ngc=['4621','4623','4698']

;F450W
mu450=[18.09,-9999,17.35]
errp_mu450=[0.08,-9999,0.09]
errm_mu450=[0.15,-9999,0.08]
rh450=[94.3,-9999,61.6]
errp_rh450=[5.6,-9999,5.5]
errm_rh450=[7.8,-9999,0.9]
in450=[80.4,-9999,81.6]
errp_in450=[1.9,-9999,0.6]
errm_in450=[1.8,-9999,1.8]

;F475W
mu475=[-9999,16.94,-9999]
errp_mu475=[-9999,0.26,-9999]
errm_mu475=[-9999,0.03,-9999]
rh475=[-9999,55.6,-9999]
errp_rh475=[-9999,2.3,-9999]
errm_rh475=[-9999,1.4,-9999]
in475=[-9999,79.2,-9999]
errp_in475=[-9999,0.3,-9999]
errm_in475=[-9999,1.6,-9999]


;F555W
mu555=[16.55,-9999,-9999]
errp_mu555=[0.01,-9999,-9999]
errm_mu555=[0.1,-9999,-9999]
rh555=[75.8,-9999,-9999]
errp_rh555=[4.7,-9999,-9999]
errm_rh555=[1.2,-9999,-9999]
in555=[74.8,-9999,-9999]
errp_in555=[1.9,-9999,-9999]
errm_in555=[1.8,-9999,-9999]

;F606W
mu606=[-9999,16.34,17.10]
errp_mu606=[-9999,0.06,0.39]
errm_mu606=[-9999,0.17,0.1]
rh606=[-9999,56.7,81.2]
errp_rh606=[-9999,4,12.5]
errm_rh606=[-9999,2.3,19.4]
in606=[-9999,77.7,81.1]
errp_in606=[-9999,2.6,3.7]
errm_in606=[-9999,1.6,2.2]

;F702W
mu702=[15.93,-9999,-9999]
errp_mu702=[0.03,-9999,-9999]
errm_mu702=[0.08,-9999,-9999]
rh702=[78,-9999,-9999]
errp_rh702=[1,-9999,-9999]
errm_rh702=[0.4,-9999,-9999]
in702=[81.8,-9999,-9999]
errp_in702=[4.8,-9999,-9999]
errm_in702=[0.8,-9999,-9999]

;F814W
mu814=[14.93,-9999,15.26]
errp_mu814=[0.03,-9999,0.15]
errm_mu814=[0.05,-9999,0.09]
rh814=[75.5,-9999,59.1]
errp_rh814=[3,-9999,2.8]
errm_rh814=[1.2,-9999,4.3]
in814=[74.3,-9999,80.4]
errp_in814=[0.5,-9999,1.4]
errm_in814=[0.4,-9999,0.8]

;F850LP
mu850=[-9999,15.21,-9999]
errp_mu850=[-9999,0.12,-9999]
errm_mu850=[-9999,0.22,-9999]
rh850=[-9999,55.6,-9999]
errp_rh850=[-9999,3.9,-9999]
errm_rh850=[-9999,2.6,-9999]
in850=[-9999,79.2,-9999]
errp_in850=[-9999,0.1,-9999]
errm_in850=[-9999,4,-9999]


asse=indgen(4)

;mu
mu4621=[mu450(0),mu475(0),mu555(0),mu606(0),mu702(0),mu814(0),mu850(0)]
errp_mu4621=[errp_mu450(0),errp_mu475(0),errp_mu555(0),errp_mu606(0),errp_mu702(0),errp_mu814(0),errp_mu850(0)]
errm_mu4621=[errm_mu450(0),errm_mu475(0),errm_mu555(0),errm_mu606(0),errm_mu702(0),errm_mu814(0),errm_mu850(0)]

mu4623=[mu450(1),mu475(1),mu555(1),mu606(1),mu702(1),mu814(1),mu850(1)]
errp_mu4623=[errp_mu450(1),errp_mu475(1),errp_mu555(1),errp_mu606(1),errp_mu702(1),errp_mu814(1),errp_mu850(0)]
errm_mu4623=[errm_mu450(1),errm_mu475(1),errm_mu555(1),errm_mu606(1),errm_mu702(1),errm_mu814(1),errm_mu850(0)]

mu4698=[mu450(2),mu475(2),mu555(2),mu606(2),mu702(2),mu814(2),mu850(2)]
errp_mu4698=[errp_mu450(2),errp_mu475(2),errp_mu555(2),errp_mu606(2),errp_mu702(2),errp_mu814(2),errp_mu850(2)]
errm_mu4698=[errm_mu450(2),errm_mu475(2),errm_mu555(2),errm_mu606(2),errm_mu702(2),errm_mu814(2),errm_mu850(2)]


;mu4623=[m,mu475(1),mu555(1),mu814(1)]
;errp_mu4623=[errp_mu336(1),errp_mu475(1),errp_mu555(1),errp_mu814(1)]
;errm_mu4623=[errm_mu336(1),errm_mu475(1),errm_mu555(1),errm_mu814(1)]
;mu4698=[mu336(2),mu475(2),mu555(2),mu814(2)]
;errp_mu4698=[errp_mu336(2),errp_mu475(2),errp_mu555(2),errp_mu814(2)]
;errm_mu4698=[errm_mu336(2),errm_mu475(2),errm_mu555(2),errm_mu814(2)]

;rh

rh4621=[rh450(0),rh475(0),rh555(0),rh606(0),rh702(0),rh814(0),rh850(0)]
errp_rh4621=[errp_rh450(0),errp_rh475(0),errp_rh555(0),errp_rh606(0),errp_rh702(0),errp_rh814(0),errp_rh850(0)]
errm_rh4621=[errm_rh450(0),errm_rh475(0),errm_rh555(0),errm_rh606(0),errm_rh702(0),errm_rh814(0),errm_rh850(0)]

rh4623=[rh450(1),rh475(1),rh555(1),rh606(1),rh702(1),rh814(1),rh850(1)]
errp_rh4623=[errp_rh450(1),errp_rh475(1),errp_rh555(1),errp_rh606(1),errp_rh702(1),errp_rh814(1),errp_rh850(0)]
errm_rh4623=[errm_rh450(1),errm_rh475(1),errm_rh555(1),errm_rh606(1),errm_rh702(1),errm_rh814(1),errm_rh850(0)]

rh4698=[rh450(2),rh475(2),rh555(2),rh606(2),rh702(2),rh814(2),rh850(2)]
errp_rh4698=[errp_rh450(2),errp_rh475(2),errp_rh555(2),errp_rh606(2),errp_rh702(2),errp_rh814(2),errp_rh850(2)]
errm_rh4698=[errm_rh450(2),errm_rh475(2),errm_rh555(2),errm_rh606(2),errm_rh702(2),errm_rh814(2),errm_rh850(2)]

;rh4621=[rh336(0),rh475(0),rh555(0),rh814(0)]
;errp_rh4621=[errp_rh336(0),errp_rh475(0),errp_rh555(0),errp_rh814(0)]
;errm_rh4621=[errm_rh336(0),errm_rh475(0),errm_rh555(0),errm_rh814(0)]
;rh4623=[rh336(1),rh475(1),rh555(1),rh814(1)]
;errp_rh4623=[errp_rh336(1),errp_rh475(1),errp_rh555(1),errp_rh814(1)]
;errm_rh4623=[errm_rh336(1),errm_rh475(1),errm_rh555(1),errm_rh814(1)]
;rh4698=[rh336(2),rh475(2),rh555(2),rh814(2)]
;errp_rh4698=[errp_rh336(2),errp_rh475(2),errp_rh555(2),errp_rh814(2)]
;errm_rh4698=[errm_rh336(2),errm_rh475(2),errm_rh555(2),errm_rh814(2)]

;inc

in4621=[in450(0),in475(0),in555(0),in606(0),in702(0),in814(0),in850(0)]
errp_in4621=[errp_in450(0),errp_in475(0),errp_in555(0),errp_in606(0),errp_in702(0),errp_in814(0),errp_in850(0)]
errm_in4621=[errm_in450(0),errm_in475(0),errm_in555(0),errm_in606(0),errm_in702(0),errm_in814(0),errm_in850(0)]

in4623=[in450(1),in475(1),in555(1),in606(1),in702(1),in814(1),in850(1)]
errp_in4623=[errp_in450(1),errp_in475(1),errp_in555(1),errp_in606(1),errp_in702(1),errp_in814(1),errp_in850(0)]
errm_in4623=[errm_in450(1),errm_in475(1),errm_in555(1),errm_in606(1),errm_in702(1),errm_in814(1),errm_in850(0)]

in4698=[in450(2),in475(2),in555(2),in606(2),in702(2),in814(2),in850(2)]
errp_in4698=[errp_in450(2),errp_in475(2),errp_in555(2),errp_in606(2),errp_in702(2),errp_in814(2),errp_in850(2)]
errm_in4698=[errm_in450(2),errm_in475(2),errm_in555(2),errm_in606(2),errm_in702(2),errm_in814(2),errm_in850(2)]




;in4621=[in336(0),in475(0),in555(0),in814(0)]
;errp_in4621=[errp_in336(0),errp_in475(0),errp_in555(0),errp_in814(0)]
;errm_in4621=[errm_in336(0),errm_in475(0),errm_in555(0),errm_in814(0)]
;in4623=[in336(1),in475(1),in555(1),in814(1)]
;errp_in4623=[errp_in336(1),errp_in475(1),errp_in555(1),errp_in814(1)]
;errm_in4623=[errm_in336(1),errm_in475(1),errm_in555(1),errm_in814(1)]
;in4698=[in336(2),in475(2),in555(2),in814(2)]
;errp_in4698=[errp_in336(2),errp_in475(2),errp_in555(2),errp_in814(2)]
;errm_in4698=[errm_in336(2),errm_in475(2),errm_in555(2),errm_in814(2)]


ftutti=[-6.5,22,22,-6.5]
f330=[0.8,0.8,1.2,1.2];U
f336=[1.8,1.8,2.2,2.2];U
f450=[2.8,2.8,3.2,3.2];B
f475=[3.8,3.8,4.2,4.2];B
f555=[4.8,4.8,5.2,5.2];V
f606=[5.8,5.8,6.2,6.2];V
f702=[6.8,6.8,7.2,7.2];R
f814=[7.8,7.8,8.2,8.2];I
f850=[8.8,8.8,9.2,9.2];I

mu='!7 l!6 [mag arcsec!S!E-2!N]'
rd='h [pc]'

set_plot,'ps'
!p.multi=[3,1,3,0,0]
device,filename='./mu_rad_inc.ps',portrait=0,/color,xsize=18,ysize=26
;a=findgen(17)*(!pi*2/16)
;usersym,cos(a),sin(a), /fill


;plot,asse+1,mu4698,psym=8,xrange=[0,5],yrange=[0,50],color=fsc_color('Blue')
;errplot,asse+1,mu4698+errp_mu4698,mu4698-errm_mu4698,color=fsc_color('Blue')


PLOTSYM, 0,1.31,/fill
;ploterror_lore,asse+0.9,mu4621,asse*0,errp_mu4621,errm_mu4621,psym=8,xrange=[0,5],yrange=[12,22],ERRCOLOR =fsc_color('Blue'),color=fsc_color('Blue'),/noerase,charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.66,0.98,0.99],xtickname=[' ',' ',' ',' ',' ',' '],xticks=5

xtickname=[' ',' ',' ',' ',' ',' ']

POLYFILL,f330,ftutti,color=fsc_color('Cyan'),/LINE_FILL,THICK=2.0,ORIENTATION=45
POLYFILL,f336,ftutti,color=fsc_color('Cyan'),/LINE_FILL,THICK=2.0,ORIENTATION=45

POLYFILL,f450,ftutti,color=fsc_color('Green'),/LINE_FILL,THICK=2.0,ORIENTATION=45
POLYFILL,f475,ftutti,color=fsc_color('Green'),/LINE_FILL,THICK=2.0,ORIENTATION=45

POLYFILL,f555,ftutti,color=fsc_color('Yellow'),/LINE_FILL,THICK=2.0,ORIENTATION=45
POLYFILL,f606,ftutti,color=fsc_color('Yellow'),/LINE_FILL,THICK=2.0,ORIENTATION=45

POLYFILL,f702,ftutti,color=fsc_color('Red'),/LINE_FILL,THICK=2.0,ORIENTATION=45

POLYFILL,f814,ftutti,color=fsc_color('Orange'),/LINE_FILL,THICK=2.0,ORIENTATION=45
POLYFILL,f850,ftutti,color=fsc_color('Orange'),/LINE_FILL,THICK=2.0,ORIENTATION=45

PLOTSYM, 0,1.31,/fill
ploterror_lore,asse+0.9,mu4621,asse*0,errp_mu4621,errm_mu4621,psym=8,xrange=[0,5],yrange=[12,22],ERRCOLOR =fsc_color('Blue'),color=fsc_color('Blue'),/noerase,charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.66,0.98,0.99],xtickname=[' ',' ',' ',' ',' ',' '],xticks=5

PLOTSYM, 8,1.31,/fill
ploterror_lore,asse+1.0,mu4623,asse*0,errp_mu4623,errm_mu4623,psym=8,xrange=[0,5],yrange=[12,22],ERRCOLOR =fsc_color('Green'),color=fsc_color('Green'),/noerase,xtickname=[' ',' ',' ',' ',' ',' '],charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.66,0.98,0.99],xticks=5
PLOTSYM, 4,1.31,/fill
ploterror_lore,asse+1.1,mu4698,asse*0,errp_mu4698,errm_mu4698,psym=8,xrange=[0,5],yrange=[12,22],ERRCOLOR =fsc_color('Red'),color=fsc_color('Red'),/noerase,xtickname=[' ',' ',' ',' ',' ',' '],charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.66,0.98,0.99],xticks=5

PLOTSYM, 0,1.31,/fill
plot,asse+1,mu4621,psym=3,xrange=[0,5],yrange=[12,22],color=fsc_color('Black'),/nodata,xtickname=[' ',' ',' ',' ',' ',' '],charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.66,0.98,0.99] ,ytitle=mu,xticks=5

;legend,['!6NGC 4621','NGC 4623','NGC 4698'],color=[FSC_Color('Blue'),FSC_Color('Green'),FSC_Color('Red')],psym=[8,8,8],box=0,/top ,/left,charsize = 1.0,CHARTHICK=0.5
PLOTSYM, 0,1.1,/fill
legend,['!6NGC 4621'],color=[FSC_Color('Blue')],psym=[8],box=0,/top ,/left,charsize = 1.0,CHARTHICK=1.0,position=[-0.02,21] 
PLOTSYM, 8,1.1,/fill
legend,['!6NGC 4623'],color=[FSC_Color('Green')],psym=[8],box=0,/top ,/left,charsize = 1.0,CHARTHICK=1.0,position=[-0.02,20.5] 
PLOTSYM, 4,1.1,/fill
legend,['!6NGC 4698'],color=[FSC_Color('Red')],psym=[8],box=0,/top ,/left,charsize = 1.0,CHARTHICK=1.0,position=[-0.02,20.02] 



ploterror_lore,asse+0.9,rh4621,asse*0,errp_rh4621,errm_rh4621,psym=8,xrange=[0,5],yrange=[0,99],ERRCOLOR =fsc_color('Blue'),/noerase,color=fsc_color('Blue'),xtickname=[' ',' ',' ',' ',' ',' '],charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.33,0.98,0.66],xticks=5

PLOTSYM, 8,1.31,/fill
ploterror_lore,asse+1.0,rh4623,asse*0,errp_rh4623,errm_rh4623,psym=8,xrange=[0,5],yrange=[0,99],ERRCOLOR =fsc_color('Green'),/noerase,color=fsc_color('Green'),xtickname=[' ',' ',' ',' ',' ',' '],charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.33,0.98,0.66],xticks=5
PLOTSYM, 4,1.31,/fill
ploterror_lore,asse+1.1,rh4698,asse*0,errp_rh4698,errm_rh4698,psym=8,xrange=[0,5],yrange=[0,99],ERRCOLOR =fsc_color('Red'),/noerase,color=fsc_color('Red'),xtickname=[' ',' ',' ',' ',' ',' '],charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.33,0.98,0.66],xticks=5

plot,asse+1,rh4621,psym=3,xrange=[0,5],yrange=[0,99],color=fsc_color('Black'),/nodata,xtickname=[' ',' ',' ',' ',' ',' '],charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.33,0.98,0.66],ytitle=rd,xticks=5


PLOTSYM, 0,1.31,/fill
ploterror_lore,asse+0.9,in4621,asse*0,errp_in4621,errm_in4621,psym=8,xrange=[0,5],yrange=[70,93],ERRCOLOR =fsc_color('Blue'),/noerase,color=fsc_color('Blue'),xtickname=[' ',' ',' ',' ',' ',' '],charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.05,0.98,0.33],xticks=5
PLOTSYM, 8,1.31,/fill
ploterror_lore,asse+1.0,in4623,asse*0,errp_in4623,errm_in4623,psym=8,xrange=[0,5],yrange=[70,93],ERRCOLOR =fsc_color('Green'),/noerase,color=fsc_color('Green'),xtickname=[' ',' ',' ',' ',' ',' '],charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.05,0.98,0.33],xticks=5
PLOTSYM, 4,1.31,/fill
ploterror_lore,asse+1.1,in4698,asse*0,errp_in4698,errm_in4698,psym=8,xrange=[0,5],yrange=[70,93],ERRCOLOR =fsc_color('Red'),/noerase,color=fsc_color('Red'),xtickname=[' ',' ',' ',' ',' ',' '],charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.05,0.98,0.33],xticks=5
plot,asse+1,in4698,psym=8,xrange=[0,5],yrange=[70,93],/noerase,color=fsc_color('Black'),/nodata,xtickname=[' ','!6 F336W ','!6 F475W ','!6 F555W ','F814W ',' '],CHARTHICK=1.3,charsize=2.3,xstyle=1,ystyle=1,position=[0.1,0.05,0.98,0.33] ,xtitle=['!6 Banda fotometrica HST'],ytitle=['!6i [!12_!6]'],xticks=5





;ploterror_lore,[asse(3)*0.1+1,asse(3)*0.1+1],[mu336,mu336],asse*0,errp_rh814,errm_mu814,psym=8,xrange=[0,5],yrange=[0,50],/noerase,color=fsc_color('Blue')



;ploterror_lore,asse*0.1+2,mu475,asse*0,errp_rh814,errm_mu814,psym=8,xrange=[0,5],yrange=[0,50],/noerase,color=fsc_color('Green')
;ploterror_lore,asse*0.1+3,mu555,asse*0,errp_rh814,errm_mu814,psym=8,xrange=[0,5],yrange=[0,50],/noerase,color=fsc_color('yellow')
;ploterror_lore,asse*0.1+4,mu814,asse*0,errp_rh814,errm_mu814,psym=8,xrange=[0,5],yrange=[0,50],/noerase,color=fsc_color('Red')
;ploterror_lore,[asse(3)*0.1+1,asse(3)*0.1+1],[mu336,mu336],asse*0,errp_rh814,errm_mu814,psym=8,xrange=[0,5],yrange=[0,50],/noerase,color=fsc_color('Black'),/nodata,xtitle='!6 FILTER',ytitle='!2 Mu0',xstyle=1,ystyle=1
;,xtitle='!6 N',ytitle='!2 [a/ !6Fe]',xstyle=1,ystyle=1




device, /close
stop
end


pro color


;ngc=['4621','4623','4698']

;F336W
mu336=[16.50]
rh336=[0.31]
in336=[83*(!pi/180)]
mu336c=mu336-2.5*alog10(cos(in336))
Mag336=mu336c-5*alog10(rh336)-1.9954


;F475W
mu475=[15.91,17.40,15.14]
rh475=[0.24,0.55,0.27]
in475=[84*(!pi/180),78*(!pi/180),78*(!pi/180)]
mu475c=mu475-2.5*alog10(cos(in475))
Mag475=mu475c-5*alog10(rh475)-1.9954



;F555W
mu555=[15.69,16.97,14.71]
rh555=[0.24,0.63,0.32]
in555=[82*(!pi/180),78*(!pi/180),83*(!pi/180)]
mu555c=mu555-2.5*alog10(cos(in555))
Mag555=mu555c-5*alog10(rh555)-1.9954


;F814W
mu814=[13.35,15.21,13.18]
rh814=[0.18,0.66,0.28]
in814=[83.1*(!pi/180),77.9*(!pi/180),81*(!pi/180)]
mu814c=mu814-2.5*alog10(cos(in814))
Mag814=mu814c-5*alog10(rh814)-1.9954


;COLOR

;U-B or F336W-F465W only 4698
F336W_F475W=Mag336-Mag475(2)
;B-V or F475W-F555W alll galaxies
F475W_F555W=Mag475-Mag555
;V-I or F555W-F*14W alll galaxies
F555W_F814W=Mag555-Mag814
;U-V or F336W-F555W only 4698
F336W_F555W=Mag336-Mag555(2)


print, 'NGC 4621 NGC 4623  NGC 4698' 
print, 'B-V='+string(strcompress(F475W_F555W))
print, 'V-I='+string(strcompress(F555W_F814W))
print, 'U-B='+string(strcompress(F336W_F475W))+'  only for NGC 4698
print, 'U-V='+string(strcompress(F336W_F555W))+'  only for NGC 4698
stop
end

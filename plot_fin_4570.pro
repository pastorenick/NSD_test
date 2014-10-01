pro plot_intensita

scal_pc=0.0455
scal_acs=0.05
ba=0.102
ind=indgen(100)
indars=ind*0.045

; U (F336W) #  D (Decomposed) #

table_ext,'Figures/NGC4570/F336Wdeconv_4.tab','sma,intens,int_err,ellip,ellip_err',Usma,Uintens,Uint_err,Uellip,Uellip_err
table_ext,'Figures/NGC4570/F336Wdeconv_4.tab','pa,pa_err,grad,grad_err,b4,b4_err',Upa,Upa_err,Ugrad,Ugrad_err,Ua4,Ua4_err  

table_ext,'Figures/NGC4570/NGC4570_80.500_6.9470_0.1284.tab','sma,intens,int_err,ellip,ellip_err',UDsma,UDintens,UDint_err,UDellip,UDellip_err
table_ext,'Figures/NGC4570/NGC4570_80.500_6.9470_0.1284.tab','pa,pa_err,grad,grad_err,b4,b4_err',UDpa,UDpa_err,UDgrad,UDgrad_err,UDa4,UDa4_err

PA_V3_U=315.3404
EXPTIME_U=3100.0
VEGAPOINT_U=19.429
A_U=0

arso_U=UDsma*scal_pc
A4o_U=Ua4*100
A4_U=UDa4*100
A4o_err_U=Ua4_err*100
A4_err_U=UDa4_err*100

sbUo=Uintens/(scal_pc^2)
intenUo=-2.5*(alog10(sbUo/EXPTIME_U))+VEGAPOINT_U-A_U
sbU=UDintens/(scal_pc^2)
intenU=-2.5*(alog10(sbU/EXPTIME_U))+VEGAPOINT_U-A_U

sbUo_errp=(Uintens+Uint_err)/(scal_pc^2)
sbUo_errm=(Uintens-Uint_err)/(scal_pc^2)
intenUo_errp=-2.5*(alog10(sbUo_errp/EXPTIME_U))+VEGAPOINT_U-A_U
intenUo_errm=-2.5*(alog10(sbUo_errm/EXPTIME_U))+VEGAPOINT_U-A_U
sbU_errp=(UDintens+UDint_err)/(scal_pc^2)
sbU_errm=(UDintens-UDint_err)/(scal_pc^2)
intenU_errp=-2.5*(alog10(sbU_errp/EXPTIME_U))+VEGAPOINT_U-A_U
intenU_errm=-2.5*(alog10(sbU_errm/EXPTIME_U))+VEGAPOINT_U-A_U

PAo_U=(PA_V3_U-225)+Upa+90
PA_U=(PA_V3_U-225)+UDpa+90+67.6
N=n_elements(UDpa)
for k=0,N-1 do begin
IF (PA_U(k) GT 300) THEN PA_U(k) = (PA_U(k)-180) ELSE PA_U(k) = PA_U(k)
endfor

PAo_U_errp=(PA_V3_U-225)+(Upa+Upa_err)+90
PAo_U_errm=(PA_V3_U-225)+(Upa-Upa_err)+90
PA_U_errp=(PA_V3_U-225)+(UDpa+UDpa_err)+90+67.6
PA_U_errm=(PA_V3_U-225)+(UDpa-UDpa_err)+90+67.6
E=n_elements(UDpa_err)
for l=0,E-1 do begin
IF (PA_U_errp(l) GT 300) THEN PA_U_errp(l) = (PA_U_errp(l)-180) ELSE PA_U_errp(l) = PA_U_errp(l)
IF (PA_U_errm(l) GT 300) THEN PA_U_errm(l) = (PA_U_errm(l)-180) ELSE PA_U_errm(l) = PA_U_errm(l)
endfor

intdiskU = 80.5*(exp((ind*0.045)/(-6.947*0.045)))
intdiskUars = intdiskU/(0.045^2)
intboars = Uintens/0.045^2
rapu=(intdiskUars/intboars)
sbdiscU = -2.5*alog10(intdiskUars/3100)+VEGAPOINT_U-A_U

; LM *******************************************************

intdiskU_max = 203.7*(exp((ind*0.045)/(-14.00*0.045)))
intdiskUars_max = intdiskU_max/(0.045^2)
rapu_max=(intdiskUars_max/intboars)
sbdiscU_max = -2.5*alog10(intdiskUars_max/3100)+VEGAPOINT_U-A_U

intdiskU_min = 42.5*(exp((ind*0.045)/(-6.00*0.045)))
intdiskUars_min = intdiskU_min/(0.045^2)
rapu_min=(intdiskUars_min/intboars)
sbdiscU_min = -2.5*alog10(intdiskUars_min/3100)+VEGAPOINT_U-A_U

; LM *******************************************************


; B (F475W) #  D (Decomposed) #

table_ext,'Figures/NGC4570/F475Wdeconv_4.tab','sma,intens,int_err,ellip,ellip_err',Bsma,Bintens,Bint_err,Bellip,Bellip_err
table_ext,'Figures/NGC4570/F475Wdeconv_4.tab','pa,pa_err,grad,grad_err,b4,b4_err',Bpa,Bpa_err,Bgrad,Bgrad_err,Ba4,Ba4_err  

table_ext,'Figures/NGC4570/NGC4570_58.000_5.4000_0.2080.tab','sma,intens,int_err,ellip,ellip_err',BDsma,BDintens,BDint_err,BDellip,BDellip_err
table_ext,'Figures/NGC4570/NGC4570_58.000_5.4000_0.2080.tab','pa,pa_err,grad,grad_err,b4,b4_err',BDpa,BDpa_err,BDgrad,BDgrad_err,BDa4,BDa4_err

PA_V3_B=289.804688
EXPTIME_B=750.0 
VEGAPOINT_B=26.168
A_B=0

arso_B=BDsma*scal_acs
A4o_B=Ba4*100
A4_B=BDa4*100
A4o_err_B=Ba4_err*100
A4_err_B=BDa4_err*100

sbBo=Bintens/(scal_acs^2)
intenBo=-2.5*(alog10(sbBo))+VEGAPOINT_B-A_B
sbB=BDintens/(scal_acs^2)
intenB=-2.5*(alog10(sbB))+VEGAPOINT_B-A_B

sbBo_errp=(Bintens+Bint_err)/(scal_acs^2)
sbBo_errm=(Bintens-Bint_err)/(scal_acs^2)
intenBo_errp=-2.5*(alog10(sbBo_errp))+VEGAPOINT_B-A_B
intenBo_errm=-2.5*(alog10(sbBo_errm))+VEGAPOINT_B-A_B
sbB_errp=(BDintens+BDint_err)/(scal_acs^2)
sbB_errm=(BDintens-BDint_err)/(scal_acs^2)
intenB_errp=-2.5*(alog10(sbB_errp))+VEGAPOINT_B-A_B
intenB_errm=-2.5*(alog10(sbB_errm))+VEGAPOINT_B-A_B

PAo_B=(PA_V3_B-225)+Bpa+45+70
PA_B=(PA_V3_B-225)+BDpa+45+70+68
N=n_elements(BDpa)
for k=0,N-1 do begin
IF (PA_B(k) GT 300) THEN PA_B(k) = (PA_B(k)-180) ELSE PA_B(k) = PA_B(k)
endfor

PAo_B_errp=(PA_V3_B-225)+(Bpa+Bpa_err)+45+70
PAo_B_errm=(PA_V3_B-225)+(Bpa-Bpa_err)+45+70
PA_B_errp=(PA_V3_B-225)+(BDpa+BDpa_err)+45+70+68
PA_B_errm=(PA_V3_B-225)+(BDpa-BDpa_err)+45+70+68
E=n_elements(BDpa_err)
for l=0,E-1 do begin
IF (PA_B_errp(l) GT 300) THEN PA_B_errp(l) = (PA_B_errp(l)-180) ELSE PA_B_errp(l) = PA_B_errp(l)
IF (PA_B_errm(l) GT 300) THEN PA_B_errm(l) = (PA_B_errm(l)-180) ELSE PA_B_errm(l) = PA_B_errm(l)
endfor

intdiskB = 58*(exp((ind*0.05)/(-5.4*0.05)))
intdiskBarsog = intdiskB/(0.05^2)
intdiskBars = interpol(intdiskBarsog,(ind*0.05),(ind*0.045))
intboars = Bintens/0.05^2
rapb=(intdiskBars/intboars)
sbdiscB = -2.5*alog10(intdiskBars/1)+VEGAPOINT_B-A_B

; LM *******************************************************

intdiskB_max = 131*(exp((ind*0.05)/(-11.8*0.05)))
intdiskBarsog_max = intdiskB_max/(0.05^2)
intdiskBars_max = interpol(intdiskBarsog_max,(ind*0.05),(ind*0.045))
rapb_max=(intdiskBars_max/intboars)
sbdiscB_max = -2.5*alog10(intdiskBars_max/1)+VEGAPOINT_B-A_B

intdiskB_min =43.5*(exp((ind*0.05)/(-4.00*0.05)))
intdiskBarsog_min = intdiskB_min/(0.05^2)
intdiskBars_min = interpol(intdiskBarsog_min,(ind*0.05),(ind*0.045))
rapb_min=(intdiskBars_min/intboars)
sbdiscB_min = -2.5*alog10(intdiskBars_min/1)+VEGAPOINT_B-A_B

; LM *********************************************************


; V (F555W) #  D (Decomposed) #
table_ext,'Figures/NGC4570/F555Wdeconv_4.tab','sma,intens,int_err,ellip,ellip_err',Vsma,Vintens,Vint_err,Vellip,Vellip_err
table_ext,'Figures/NGC4570/F555Wdeconv_4.tab','pa,pa_err,grad,grad_err,b4,b4_err',Vpa,Vpa_err,Vgrad,Vgrad_err,Va4,Va4_err 

table_ext,'Figures/NGC4570/NGC4570_1000.0_7.1500_0.1200.tab','sma,intens,int_err,ellip,ellip_err',VDsma,VDintens,VDint_err,VDellip,VDellip_err
table_ext,'Figures/NGC4570/NGC4570_1000.0_7.1500_0.1200.tab','pa,pa_err,grad,grad_err,b4,b4_err',VDpa,VDpa_err,VDgrad,VDgrad_err,VDa4,VDa4_err
PA_V3_V=315.3404
EXPTIME_V=400
VEGAPOINT_V=22.545
A_V=0

arso_V=VDsma*scal_pc
A4o_V=Va4*100
A4_V=VDa4*100
A4o_err_V=Va4_err*100
A4_err_V=VDa4_err*100

sbVo=Vintens/(scal_pc^2)
intenVo=-2.5*(alog10((sbVo/EXPTIME_V)))+VEGAPOINT_V-A_V
sbV=VDintens/(scal_pc^2)
intenV=-2.5*(alog10((sbV/EXPTIME_V)))+VEGAPOINT_V-A_V

sbVo_errp=(Vintens+Vint_err)/(scal_pc^2)
sbVo_errm=(Vintens-Vint_err)/(scal_pc^2)
intenVo_errp=-2.5*(alog10(sbVo_errp/EXPTIME_V))+VEGAPOINT_V-A_V
intenVo_errm=-2.5*(alog10(sbVo_errm/EXPTIME_V))+VEGAPOINT_V-A_V
sbV_errp=(VDintens+VDint_err)/(scal_pc^2)
sbV_errm=(VDintens-VDint_err)/(scal_pc^2)
intenV_errp=-2.5*(alog10(sbV_errp/EXPTIME_V))+VEGAPOINT_V-A_V
intenV_errm=-2.5*(alog10(sbV_errm/EXPTIME_V))+VEGAPOINT_V-A_V

PAo_V=(PA_V3_V-225)+Vpa+90
PA_V=(PA_V3_V-225)+VDpa+90+67.8
N=n_elements(VDpa)
for k=0,N-1 do begin
IF (PA_V(k) GT 300) THEN PA_V(k) = (PA_V(k)-180) ELSE PA_V(k) = PA_V(k)
endfor
PAo_V_err=(PA_V3_V-225)+Vpa_err+90
PA_V_err=(PA_V3_V-225)+VDpa_err+90+67.8
E=n_elements(VDpa_err)
for l=0,E-1 do begin
IF (PA_V_err(l) GT 300) THEN PA_V_err(l) = (PA_V_err(l)-180) ELSE PA_V_err(l) = PA_V_err(l)
endfor

PAo_V_errp=(PA_V3_V-225)+(Vpa+Vpa_err)+90
PAo_V_errm=(PA_V3_V-225)+(Vpa-Vpa_err)+90
PA_V_errp=(PA_V3_V-225)+(VDpa+VDpa_err)+90+67.8
PA_V_errm=(PA_V3_V-225)+(VDpa-VDpa_err)+90+67.8
E=n_elements(VDpa_err)
for l=0,E-1 do begin
IF (PA_V_errp(l) GT 300) THEN PA_V_errp(l) = (PA_V_errp(l)-180) ELSE PA_V_errp(l) = PA_V_errp(l)
IF (PA_V_errm(l) GT 300) THEN PA_V_errm(l) = (PA_V_errm(l)-180) ELSE PA_V_errm(l) = PA_V_errm(l)
endfor

intdiskV = 1000*(exp((ind*0.045)/(-7.15*0.045)))
intdiskVars = intdiskV/(0.045^2)
intvoars = Vintens/0.045^2
rapv=(intdiskVars/intvoars)
sbdiscV = -2.5*alog10(intdiskVars/EXPTIME_V)+VEGAPOINT_V-A_V

; LM *******************************************************
intdiskV_max = 2500*(exp((ind*0.045)/(-16*0.045)))
intdiskVars_max = intdiskV_max/(0.045^2)
rapv_max=(intdiskVars_max/intvoars)
sbdiscV_max = -2.5*alog10(intdiskVars_max/EXPTIME_V)+VEGAPOINT_V-A_V

intdiskV_min = 520*(exp((ind*0.045)/(-6.00*0.045)))
intdiskVars_min = intdiskV_min/(0.045^2)
rapv_min=(intdiskVars_min/intvoars)
sbdiscV_min = -2.5*alog10(intdiskVars_min/EXPTIME_V)+VEGAPOINT_V-A_V

; LM *********************************************************


; I (F814W) #  D (Decomposed) #
table_ext,'Figures/NGC4570/F814Wdeconv_6.tab','sma,intens,int_err,ellip,ellip_err',Isma,Iintens,Iint_err,Iellip,Iellip_err
table_ext,'Figures/NGC4570/F814Wdeconv_6.tab','pa,pa_err,grad,grad_err,b4,b4_err',Ipa,Ipa_err,Igrad,Igrad_err,Ia4,Ia4_err 

table_ext,'Figures/NGC4570/NGC4570_2116.6_6.2370_0.1520.tab','sma,intens,int_err,ellip,ellip_err',IDsma,IDintens,IDint_err,IDellip,IDellip_err
table_ext,'Figures/NGC4570/NGC4570_2116.6_6.2370_0.1520.tab','pa,pa_err,grad,grad_err,b4,b4_err',IDpa,IDpa_err,IDgrad,IDgrad_err,IDa4,IDa4_err

PA_V3_I=315.34039
EXPTIME_I=460
VEGAPOINT_I=21.639
A_I=0

arso_I=IDsma*scal_pc
A4o_I=Ia4*100
A4_I=IDa4*100
A4o_err_I=Ia4_err*100
A4_err_I=IDa4_err*100

sbIo=Iintens/(scal_pc^2)
intenIo=-2.5*(alog10((sbIo/EXPTIME_I)))+VEGAPOINT_I-A_I
sbI=IDintens/(scal_pc^2)
intenI=-2.5*(alog10((sbI/EXPTIME_I)))+VEGAPOINT_I-A_I

sbIo_errp=(Iintens+Iint_err)/(scal_pc^2)
sbIo_errm=(Iintens-Iint_err)/(scal_pc^2)
intenIo_errp=-2.5*(alog10(sbIo_errp/EXPTIME_I))+VEGAPOINT_I-A_I
intenIo_errm=-2.5*(alog10(sbIo_errm/EXPTIME_I))+VEGAPOINT_I-A_I
sbI_errp=(IDintens+IDint_err)/(scal_pc^2)
sbI_errm=(IDintens-IDint_err)/(scal_pc^2)
intenI_errp=-2.5*(alog10(sbI_errp/EXPTIME_I))+VEGAPOINT_I-A_I
intenI_errm=-2.5*(alog10(sbI_errm/EXPTIME_I))+VEGAPOINT_I-A_I

PAo_I=(PA_V3_I-225)+Ipa+90
PA_I=(PA_V3_I-225)+IDpa+90+68.8
N=n_elements(IDpa)
for k=0,N-1 do begin
IF (PA_I(k) GT 300) THEN PA_I(k) = (PA_I(k)-180) ELSE PA_I(k) = PA_I(k)
endfor
PAo_I_err=(PA_V3_I-225)+Ipa_err+90
PA_I_err=(PA_V3_I-225)+IDpa_err+90+67.8
E=n_elements(IDpa_err)
for l=0,E-1 do begin
IF (PA_I_err(l) GT 300) THEN PA_I_err(l) = (PA_I_err(l)-180) ELSE PA_I_err(l) = PA_I_err(l)
endfor

PAo_I_errp=(PA_V3_I-225)+(Ipa+Ipa_err)+90
PAo_I_errm=(PA_V3_I-225)+(Ipa-Ipa_err)+90
PA_I_errp=(PA_V3_I-225)+(IDpa+IDpa_err)+90+68.8
PA_I_errm=(PA_V3_I-225)+(IDpa-IDpa_err)+90+67.8
E=n_elements(IDpa_err)
for l=0,E-1 do begin
IF (PA_I_errp(l) GT 300) THEN PA_I_errp(l) = (PA_I_errp(l)-180) ELSE PA_I_errp(l) = PA_I_errp(l)
IF (PA_I_errm(l) GT 300) THEN PA_I_errm(l) = (PA_I_errm(l)-180) ELSE PA_I_errm(l) = PA_I_errm(l)
endfor

intdiskI = 2116*(exp((ind*0.045)/(-6.237*0.045)))
intdiskIars = intdiskI/(0.045^2)
intioars = Iintens/0.045^2
rapi=(intdiskIars/intioars)
sbdiscI = -2.5*alog10(intdiskIars/EXPTIME_I)+VEGAPOINT_I-A_I

; LM *********************************************************

intdiskI_max = 4816*(exp((ind*0.045)/(-14.00*0.045)))
intdiskIars_max = intdiskI_max/(0.045^2)
rapi_max=(intdiskIars_max/intioars)
sbdiscI_max = -2.5*alog10(intdiskIars_max/EXPTIME_I)+VEGAPOINT_I-A_I

intdiskI_min = 916*(exp((ind*0.045)/(-4.44*0.045)))
intdiskIars_min = intdiskI_min/(0.045^2)
rapi_min=(intdiskIars_min/intioars)
sbdiscI_min = -2.5*alog10(intdiskIars_min/EXPTIME_I)+VEGAPOINT_I-A_I



; LM *********************************************************



a=findgen(17)*(!pi*2/16)
usersym,cos(a),sin(a), /fill

loadct,12
set_plot,'ps'


;device,filename='plot_fin_4570.ps',/color;,portrait=0;xsize=18,ysize=26
;device,filename='plot_fin_4570_1.ps',/color;,portrait=0;xsize=18,ysize=26
device,filename='/home/lorenzo/PAPER_NSD_AA/WORKINGPLACE/plot_fin_4570_v2.ps',/color,portrait=0,xsize=36,ysize=26

;PLOT DELLA BRILLANZA IN BANDA U

;pos=[0.08,0.75,0.38,0.93]
plot,arso_U,intenUo,charsize=1.32,ytitle='!7 l!6 [mag/arcsec!S!E2!N]',pos=[0.08,0.75,0.3,0.93],$
  xrange=[0,3.5],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],yrange=[20,10],symsize=0.5,psym=6,/noerase,/nodata,ystyle=1

oplot,arso_U,sbdiscU,psym=0,thick=2,color=fsc_color('Blue')
;oplot,arso_U,sbdiscU_max,psym=3,symsize=4,color=fsc_color('Blue')
;oplot,arso_U,sbdiscU_min,psym=3,symsize=4,color=fsc_color('Blue')

MINVAL = !Y.CRANGE[0]  
sbdiscU_min(where (sbdiscU_min gt MINVAL))= MINVAL
sbdiscU_max(where (sbdiscU_max gt MINVAL))= MINVAL

q=where(sbdiscU_max lt MINVAL )
for o=0,n_elements(q) do begin

Au=[arso_U(o),arso_U(o),arso_U(o+1),arso_U(o+1)]
Bu=[sbdiscU_min(o),sbdiscU_max(o),sbdiscU_max(o+1),sbdiscU_min(o+1)]
;POLYFILL,Au,Bu,/line_fill,color=fsc_color('Blue'),orientation=45

endfor


;oplot,arso_U,intenU,psym=8,symsize=0.5,color=200
oplot,arso_U,intenUo,symsize=0.5,psym=6,color=fsc_color('Black')
errplot,arso_U,intenUo_errp,intenUo_errm
;errplot,arso_U,intenU_errp,intenU_errm,color=200
xyouts,1.5,13,'F336W',charsize=1,charthick=2

xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[1]+(0.2*(!Y.CRANGE[0]-!Y.CRANGE[1])),'(a)',charsize=1.0,charthick=1

xyouts,!X.CRANGE[0]+(0.87*(2*(!X.CRANGE[1]-!X.CRANGE[0]))),!Y.CRANGE[1]+(-0.02*(!Y.CRANGE[0]-!Y.CRANGE[1])),'!6 NGC 4570',charsize=1.32,charthick=1


plot,arso_U,rapu,psym=0,symsize=0,charsize=1.32,pos=[0.08,0.62,0.3,0.75],$
	xrange=[0,3.5],xstyle=1,ytitle='D/T',xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],/noerase,yrange=[0,0.7],/nodata,ystyle=1,ytickinterval=0.2 ;ytickname=['0.0','0.2','0.4',' '],

MINVALX = 3.45
q=where(arso_U lt MINVALX )
for o=0,n_elements(q) do begin

A=[arso_U(o),arso_U(o),arso_U(o+1),arso_U(o+1)]
B=[rapu_min(o),rapu_max(o),rapu_max(o+1),rapu_min(o+1)]
;POLYFILL,A,B,/line_fill,color=fsc_color('Blue'),orientation=45

endfor

oplot,arso_U,rapu,psym=0,symsize=1,thick=2,color=fsc_color('Blue')
;oplot,arso_U,rapu_min,color=fsc_color('Blue'),psym=3,symsize=1
;oplot,arso_U,rapu_max,color=fsc_color('Blue'),psym=3,symsize=1

xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[0]+(0.8*(!Y.CRANGE[1]-!Y.CRANGE[0])),'(b)',charsize=1.0,charthick=1

;pos=[0.08,0.44,0.38,0.62]
plot,arso_U,Uellip,charsize=1.32,pos=[0.08,0.44,0.3,0.62],xrange=[0,3.5],xstyle=1,ytitle='!2 e !6',$
	xtickname=[' ',' ',' ',' ',' ',' ',' ',' '],yrange=[0,0.6],ytickname=['0.0','0.2','0.4',' '],symsize=0.5,psym=6,/noerase
oplot,arso_U,UDellip,psym=8,symsize=0.5,color=200
errplot,arso_U,Uellip+Uellip_err,Uellip-Uellip_err
errplot,arso_U,UDellip+UDellip_err,UDellip-UDellip_err,color=200
oplot,[0.3,0.3],[-100,100],color=fsc_color('green'),linestyle=3,THICK=1

xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[0]+(0.8*(!Y.CRANGE[1]-!Y.CRANGE[0])),'(c)',charsize=1.0,charthick=1

;pos=[0.08,0.26,0.38,0.44]
plot,arso_U,PAo_U,charsize=1.42,ytitle='!6PA [!12_!6]',pos=[0.08,0.26,0.3,0.44],ytickname=['150','155','160','165',' '],$
     xrange=[0,3.5],yrange=[150,170],symsize=0.5,psym=6,xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],/noerase
oplot,arso_U,PA_U,psym=8,symsize=0.5,color=200
errplot,arso_U,PAo_U_errp,PAo_U_errm
errplot,arso_U,PA_U_errp,PA_U_errm,color=200
oplot,[0.3,0.3],[-1000,1000],color=fsc_color('green'),linestyle=3,THICK=1

xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[0]+(0.8*(!Y.CRANGE[1]-!Y.CRANGE[0])),'(d)',charsize=1.0,charthick=1

;pos=[0.08,0.08,0.38,0.26]
plot,arso_U,A4o_U,charsize=1.32,xtitle='a [arcsec]',ytitle='a4/a*100',pos=[0.08,0.08,0.3,0.26],$
	xrange=[0,3.5],yrange=[-4,9],symsize=0.5,psym=6,xstyle=1,ystyle=1,xtickname=['0',' ','1',' ','2',' ','3',' '],/noerase
oplot,arso_U,A4_U,psym=8,symsize=0.5,color=200
errplot,arso_U,A4o_U+A4o_err_U,A4o_U-A4o_err_U
errplot,arso_U,A4_U+A4_err_U,A4_U-A4_err_U,color=200
oplot,[0,1000+10],[0,0]
oplot,[0.3,0.3],[-100,100],color=fsc_color('green'),linestyle=3,THICK=1

xyouts,!X.CRANGE[0]+(0.8*(!X.CRANGE[1]-!X.CRANGE[0])),!Y.CRANGE[0]+(0.8*(!Y.CRANGE[1]-!Y.CRANGE[0])),'(e)',charsize=1.0,charthick=1


;PLOT DELLA BRILLANZA IN BANDA B
;pos=[0.38,0.75,0.68,0.93]
plot,arso_B,intenBo,charsize=1.32,pos=[0.3,0.75,0.52,0.93],xrange=[0,3.5],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ']$
	,ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],yrange=[20,10],symsize=0.5,psym=6,/noerase,/nodata,ystyle=1

oplot,arso_B,sbdiscB,psym=0,thick=2,color=fsc_color('Blue')
;oplot,arso_B,sbdiscB_max,psym=3,symsize=4,color=fsc_color('Blue')
;oplot,arso_B,sbdiscB_min,psym=3,symsize=4,color=fsc_color('Blue')

MINVAL = !Y.CRANGE[0]  
sbdiscB_min(where (sbdiscB_min gt MINVAL))= MINVAL
sbdiscB_max(where (sbdiscB_max gt MINVAL))= MINVAL

q=where(sbdiscB_max lt MINVAL )
for o=0,n_elements(q) do begin

A=[arso_B(o),arso_B(o),arso_B(o+1),arso_B(o+1)]
B=[sbdiscB_min(o),sbdiscB_max(o),sbdiscB_max(o+1),sbdiscB_min(o+1)]
;POLYFILL,A,B,/line_fill,color=fsc_color('Blue'),orientation=45

endfor

;oplot,arso_B,intenB,symsize=0.5,psym=8,color=fsc_color('Red')
oplot,arso_B,intenBo,symsize=0.5,psym=6,color=fsc_color('Black')
errplot,arso_B,intenBo_errp,intenBo_errm
;errplot,arso_B,intenB_errp,intenB_errm,color=200
xyouts,1.5,13,'F475W',charsize=1,charthick=2

;pos=[0.38,0.62,0.68,0.75]
plot,arso_B,rapb,psym=0,symsize=0,charsize=1.32,pos=[0.3,0.62,0.52,0.75],$
	xrange=[0,3.5],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ']$
	,yrange=[0,0.7],/noerase,/nodata,ystyle=1,ytickinterval=0.2

MINVALX = 3.45
q=where(arso_B lt MINVALX )
for o=0,n_elements(q) do begin

Ar=[arso_B(o),arso_B(o),arso_B(o+1),arso_B(o+1)]
Br=[rapb_min(o),rapb_max(o),rapb_max(o+1),rapb_min(o+1)]
;POLYFILL,Ar,Br,/line_fill,color=fsc_color('Blue'),orientation=45

endfor

oplot,arso_B,rapb,psym=0,symsize=1,thick=2,color=fsc_color('Blue')
;oplot,arso_B,rapb_min,color=fsc_color('Blue'),psym=3,symsize=1
;oplot,arso_B,rapb_max,color=fsc_color('Blue'),psym=3,symsize=1



;pos=[0.38,0.44,0.68,0.62]
plot,arso_B,Bellip,charsize=1.32,pos=[0.3,0.44,0.52,0.62],$
	xrange=[0,3.5],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' '],ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],$
	yrange=[0,0.6],symsize=0.5,psym=6,/noerase
oplot,arso_B,BDellip,psym=8,symsize=0.5,color=200
errplot,arso_B,Bellip+Bellip_err,Bellip-Bellip_err
errplot,arso_B,BDellip+BDellip_err,BDellip-BDellip_err,color=200
oplot,[0.3,0.3],[-100,100],color=fsc_color('green'),linestyle=3,THICK=1

;pos=[0.38,0.26,0.68,0.44]
plot,arso_B,PAo_B,charsize=1.32,pos=[0.3,0.26,0.52,0.44],$
     xrange=[0,3.5],yrange=[150,170],symsize=0.5,psym=6,xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],$
	ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],/noerase
oplot,arso_B,PA_B,psym=8,symsize=0.5,color=200
errplot,arso_B,PAo_B_errp,PAo_B_errm
errplot,arso_B,PA_B_errp,PA_B_errm,color=200
oplot,[0.3,0.3],[-1000,1000],color=fsc_color('green'),linestyle=3,THICK=1

;pos=[0.38,0.08,0.68,0.26]
plot,arso_B,A4o_B,charsize=1.32,xtitle='a [arcsec]',pos=[0.3,0.08,0.52,0.26],$
	xrange=[0,3.5],yrange=[-4,9],symsize=0.5,psym=6,xstyle=1,ystyle=1,xtickname=['0',' ','1',' ','2',' ','3',' '],$
	ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],/noerase
oplot,arso_B,A4_B,psym=8,symsize=0.5,color=200
errplot,arso_B,A4o_B+A4o_err_B,A4o_B-A4o_err_B
errplot,arso_B,A4_B+A4_err_B,A4_B-A4_err_B,color=200
oplot,[0,1000+10],[0,0]
oplot,[0.3,0.3],[-100,100],color=fsc_color('green'),linestyle=3,THICK=1


;PLOT DELLA BRILLANZA IN BANDA V

plot,arso_V,intenVo,charsize=1.32,pos=[0.52,0.75,0.74,0.93],xrange=[0,3.5],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],$
	ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],yrange=[20,10],symsize=0.5,psym=6,/noerase,ystyle=1,/nodata

oplot,arso_V,sbdiscV,psym=0,thick=2,color=fsc_color('Blue')
;oplot,arso_V,sbdiscV_max,psym=3,symsize=4,color=fsc_color('Blue')
;oplot,arso_V,sbdiscV_min,psym=3,symsize=4,color=fsc_color('Blue')

MINVAL = !Y.CRANGE[0]  
sbdiscV_min(where (sbdiscV_min gt MINVAL))= MINVAL
sbdiscV_max(where (sbdiscV_max gt MINVAL))= MINVAL

q=where(sbdiscV_max lt MINVAL )
for o=0,n_elements(q) do begin

Av=[arso_V(o),arso_V(o),arso_V(o+1),arso_V(o+1)]
Bv=[sbdiscV_min(o),sbdiscV_max(o),sbdiscV_max(o+1),sbdiscV_min(o+1)]
;POLYFILL,Av,Bv,/line_fill,color=fsc_color('Blue'),orientation=45

endfor

;oplot,arso_V,intenV,psym=8,symsize=0.5,color=200
oplot,arso_V,intenVo,symsize=0.5,psym=6,color=fsc_color('Black')
errplot,arso_V,intenVo_errp,intenVo_errm
;errplot,arso_V,intenV_errp,intenV_errm,color=200

xyouts,1.5,13,'F555W',charsize=1,charthick=2

plot,arso_V,rapv,psym=0,symsize=0,charsize=1.32,pos=[0.52,0.62,0.74,0.75],$
	xrange=[0,3.5],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],$
	yrange=[0,0.7],/noerase,/nodata,ystyle=1,ytickinterval=0.2

MINVALX = 3.45

q=where(arso_V lt MINVALX )
for o=0,n_elements(q) do begin

Arv=[arso_V(o),arso_V(o),arso_V(o+1),arso_V(o+1)]
Brv=[rapv_min(o),rapv_max(o),rapv_max(o+1),rapv_min(o+1)]
;POLYFILL,Arv,Brv,/line_fill,color=fsc_color('Blue'),orientation=45

endfor


oplot,arso_V,rapv,psym=0,symsize=1,color=fsc_color('Blue'),thick=2
;oplot,arso_V,rapv_min,psym=3,symsize=1,color=fsc_color('Blue')
;oplot,arso_V,rapv_max,psym=3,symsize=1,color=fsc_color('Blue')

plot,arso_V,Vellip,charsize=1.32,pos=[0.52,0.44,0.74,0.62],$
	xrange=[0,3.5],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],yrange=[0,0.6],$
	ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],symsize=0.5,psym=6,/noerase
oplot,arso_V,VDellip,psym=8,symsize=0.5,color=200
errplot,arso_V,Vellip+Vellip_err,Vellip-Vellip_err
errplot,arso_V,VDellip+VDellip_err,VDellip-VDellip_err,color=200
oplot,[0.3,0.3],[-100,100],color=fsc_color('green'),linestyle=3,THICK=1

plot,arso_V,PAo_V,charsize=1.32,pos=[0.52,0.26,0.74,0.44],$
     xrange=[0,3.5],yrange=[150,170],symsize=0.5,psym=6,xstyle=1,ystyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],$
	ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],/noerase
oplot,arso_V,PA_V,psym=8,symsize=0.5,color=200
errplot,arso_V,PAo_V_errp,PAo_V_errm
errplot,arso_V,PA_V_errp,PA_V_errm,color=200
oplot,[0.3,0.3],[-1000,1000],color=fsc_color('green'),linestyle=3,THICK=1

plot,arso_V,A4o_V,charsize=1.32,xtitle='a [arcsec]',pos=[0.52,0.08,0.74,0.26],$
	xrange=[0,3.5],yrange=[-4,9],symsize=0.5,psym=6,xstyle=1,ystyle=1,xtickname=['0',' ','1',' ','2',' ','3',' '],$
	ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],/noerase
oplot,arso_V,A4_V,psym=8,symsize=0.5,color=200
errplot,arso_V,A4o_V+A4o_err_V,A4o_V-A4o_err_V
errplot,arso_V,A4_V+A4_err_V,A4_V-A4_err_V,color=200
oplot,[0,1000+10],[0,0]
oplot,[0.3,0.3],[-100,100],color=fsc_color('green'),linestyle=3,THICK=1



;PLOT DELLA BRILLANZA IN BANDA I
;pos=[0.68,0.75,0.98,0.93]
plot,arso_I,intenIo,charsize=1.32,pos=[0.74,0.75,0.96,0.93],$
  xrange=[0,3.5],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],yrange=[20,10],$
	ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],symsize=0.5,psym=6,/noerase,ystyle=1,/nodata

oplot,arso_I,sbdiscI,psym=0,thick=2,color=fsc_color('Blue')
;oplot,arso_I,sbdiscI_max,psym=3,symsize=4,color=fsc_color('Blue')
;oplot,arso_I,sbdiscI_min,psym=3,symsize=4,color=fsc_color('Blue')

MINVAL = !Y.CRANGE[0]  
sbdiscI_min(where (sbdiscI_min gt MINVAL))= MINVAL
sbdiscI_max(where (sbdiscI_max gt MINVAL))= MINVAL

q=where(arso_I lt 3.45 )
for o=0,n_elements(q) do begin

Ai=[arso_I(o),arso_I(o),arso_I(o+1),arso_I(o+1)]
Bi=[sbdiscI_min(o),sbdiscI_max(o),sbdiscI_max(o+1),sbdiscI_min(o+1)]
;POLYFILL,Ai,Bi,/line_fill,color=fsc_color('Blue'),orientation=45

endfor

;oplot,arso_I,intenI,psym=8,symsize=0.5,color=200
oplot,arso_I,intenIo,symsize=0.5,psym=6,color=fsc_color('Black')
errplot,arso_I,intenIo_errp,intenIo_errm
;errplot,arso_I,intenI_errp,intenI_errm,color=200

xyouts,1.5,13,'F814W',charsize=1,charthick=2

;pos=[0.68,0.62,0.98,0.75]
plot,arso_I,rapi,psym=0,symsize=0,charsize=1.32,pos=[0.74,0.62,0.96,0.75],$
	xrange=[0,3.5],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],$
	yrange=[0,0.7],/noerase,/nodata,ystyle=1,ytickinterval=0.2

MINVALX = 3.45

q=where(arso_I lt MINVALX )
for o=0,n_elements(q) do begin

A=[arso_I(o),arso_I(o),arso_I(o+1),arso_I(o+1)]
B=[rapi_min(o),rapi_max(o),rapi_max(o+1),rapi_min(o+1)]
;POLYFILL,A,B,/line_fill,color=fsc_color('Blue'),orientation=45

endfor


oplot,arso_I,rapi,psym=0,symsize=1,color=fsc_color('Blue'),thick=2
;oplot,arso_I,rapi_min,psym=3,symsize=1,color=fsc_color('Blue')
;oplot,arso_I,rapi_max,psym=3,symsize=1,color=fsc_color('Blue')



oplot,arso_I,rapi,color=100,psym=0,symsize=0.5

;pos=[0.68,0.44,0.98,0.62]
plot,arso_I,Iellip,charsize=1.32,pos=[0.74,0.44,0.96,0.62],$
	xrange=[0,3.5],xstyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],yrange=[0,0.6],$
	ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],symsize=0.5,psym=6,/noerase
oplot,arso_I,IDellip,psym=8,symsize=0.5,color=200
errplot,arso_I,Iellip+Iellip_err,Iellip-Iellip_err
errplot,arso_I,IDellip+IDellip_err,IDellip-IDellip_err,color=200
oplot,[0.3,0.3],[-100,100],color=fsc_color('green'),linestyle=3,THICK=1


;pos=[0.68,0.26,0.98,0.44]
plot,arso_I,PAo_I,charsize=1.32,pos=[0.74,0.26,0.96,0.44],$
     xrange=[0,3.5],yrange=[150,170],symsize=0.5,psym=6,xstyle=1,ystyle=1,xtickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],$
ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],/noerase
oplot,arso_I,PA_I,psym=8,symsize=0.5,color=200
errplot,arso_I,PAo_I_errp,PAo_I_errm
errplot,arso_I,PA_I_errp,PA_i_errm,color=200
oplot,[0.3,0.3],[-1000,1000],color=fsc_color('green'),linestyle=3,THICK=1


;pos=[0.68,0.08,0.98,0.26]
plot,arso_I,A4o_I,charsize=1.32,xtitle='a [arcsec]',pos=[0.74,0.08,0.96,0.26],$
	xrange=[0,3.5],yrange=[-4,9],symsize=0.5,psym=6,xstyle=1,ystyle=1,xtickname=['0',' ','1',' ','2',' ','3',' '],$
ytickname=[' ',' ',' ',' ',' ',' ',' ',' ',' '],/noerase
oplot,arso_I,A4_I,psym=8,symsize=0.5,color=200
errplot,arso_I,A4o_I+A4o_err_I,A4o_I-A4o_err_I
errplot,arso_I,A4_I+A4_err_I,A4_I-A4_err_I,color=200
oplot,[0,1000+10],[0,0]
oplot,[0.3,0.3],[-100,100],color=fsc_color('green'),linestyle=3,THICK=1



device,/close

end

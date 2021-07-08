/*Note: T is nominal Transformation, DT is variation in Transfromation and $T is varied tranformation*/
//Nominal Tranformations
//ABWG Housing to Cross Roller Bearing Transformations
Ta_f2a=[1 0 0 72;
        0 1 0 54;
        0 0 1 -9;
        0 0 0 1]
Tf2a_f1b=[1 0 0 0; 
          0 1 0 0; 
          0 0 1 0; 
          0 0 0 1]
Tf1b_b=[1 0 0 0;
        0 1 0 0;
        0 0 1 0; 
        0 0 0 1]
//Cross Roller Bearing To Wheel Flange Transformations
Tb_f2b=[1 0 0 0;
        0 1 0 0;
        0 0 1 -10;
        0 0 0 1]
Tf2b_f1e=[1 0 0 0; 
          0 0 -1 0; 
          0 1 0 0; 
          0 0 0 1]
Tf1e_e=[1 0 0 0;
        0 1 0 -11;
        0 0 1 0; 
        0 0 0 1]
//Wheel Flange to Worm Wheel Tranformations
Te_h=[0 1 0 0;
     -1 0 0 0;
      0 0 1 0; 
      0 0 0 1]
//
Ta_h=[0 1 0 72;
      0 0 -1 54;
     -1 0 0 -30; 
      0 0 0 1]
Tb_h=Tb_f2b*Tf2b_f1e*Tf1e_e*Te_h
//Variationvalues
//A-F2A
a_f2a_t=1.25*10^-3
a_f2a_dx=0.010
a_f2a_dy=0.020
a_f2a_dz=0.005
//F2A-F1B
f2a_f1b_t=0.62*10^-3
f2a_f1b_dx=0.005
f2a_f1b_dy=0.005
//B-F2B
b_f2b_t=5*10^-4
b_f2b_dx=0.002
b_f2b_dy=0.002
b_f2b_dz=-0.075
//F2B-F1E
f2b_f1e_t=2.1*10^-3
f2b_f1e_dx=0.010
f2b_f1e_dz=0.010
//F1E-E
f1e_e_t=1.04*10^-3
f1e_e_dy=0.005
//E-H
e_h_dy=0.006
e_h_dz=0.006
//
//Definitions
y=0;
ymax=0;
ytmax=0;
t=0;
tmax=0;
z=0;
zmin=0;
err_max=0;
q=0;
count=0;
combo=[0 0 0 0 0];
//Functions
//Deviation Functions
function[DTab,r]=varied1(dtx,dty,dtz,dx,dy,dz,k)
    r=1;
        if k==1 then
            if dtx==0 then
               r=0;
             end 
            DTab=[1 0 0 0;
                  0 1 -dtx 0;
                  0 dtx 1 0;
                  0 0 0 1]
                  
         end
         if k==2 then
            if dtx==0 then
               r=0;
             end 
            DTab=[1 0 0 0;
                  0 1 dtx 0;
                  0 -dtx 1 0;
                  0 0 0 1]
         end
        if k==3 then
            if dty==0 then
               r=0;
             end 
            DTab=[1 0 dty 0;
                  0 1 0 0;
                  -dty 0 1 0;
                  0 0 0 1]
          end
         if k==4 then
            if dty==0 then
               r=0;
             end 
            DTab=[1 0 -dty 0;
                  0 1 0 0;
                  dty 0 1 0;
                  0 0 0 1]
         end
          if k==5 then
            if dtz==0 then
               r=0;
             end 
            DTab=[1 -dtz 0 0;
                  dtz 1 0 0;
                  0 0 1 0;
                  0 0 0 1]
          end
          if k==6 then
            if dtz==0 then
               r=0;
             end 
            DTab=[1 dtz 0 0;
                  -dtz 1 0 0;
                  0 0 1 0;
                  0 0 0 1]
           end
        if k==7 then
            if dx==0 then
               r=0;
             end 
            DTab=[1 0 0 dx;
                  0 1 0 0;
                  0 0 1 0;
                  0 0 0 1]
        end
        if k==8 then
            if dx==0 then
               r=0;
             end 
            DTab=[1 0 0 -dx;
                  0 1 0 0;
                  0 0 1 0;
                  0 0 0 1]
        end
        if k==9 then
            if dy==0 then
               r=0;
             end 
            DTab=[1 0 0 0;
                  0 1 0 dy;
                  0 0 1 0;
                  0 0 0 1]
         end
         if k==10 then
            if dy==0 then
               r=0;
             end 
            DTab=[1 0 0 0;
                  0 1 0 -dy;
                  0 0 1 0;
                  0 0 0 1]
          end
          if k==11 then
            if dz==0 then
                r=0;
               continue
             end 
            DTab=[1 0 0 0;
                  0 1 0 0;
                  0 0 1 dz;
                  0 0 0 1]
          end
          if k==12 then
            if dz==0 then
                r=0;
               continue
             end 
            DTab=[1 0 0 0;
                  0 1 0 0;
                  0 0 1 -dz;
                  0 0 0 1]
           end
           if dtx==dty==dtz==dx==dy==dz==0 then
               DTab=[1 0 0 0;
                     0 1 0 0;
                     0 0 1 0;
                     0 0 0 1]
           end
endfunction
disp("Started")
dr1=getdate()
//(dtx,dty,dtz,dx,dy,dz,k)
for a_f2a1=0:1
  for a_f2a2=0:1
     for a_f2a3=0:1
        for a_f2a4=1:12
          for f2a_f1b=1:12
            for b_f2b=1:12
               for f2b_f1e=1:12
                 for f1e_e=1:12
                   for f1e_e_1=0:1
                      for e_h=1:12
       count=count+1;
       perc=(count/47775744)*100
       [DTa_f2a,r1]=varied1(a_f2a_t,a_f2a_t,0,0,0,0,a_f2a4)
       if r1==0 then
           continue;
       end
        DTa_f2a=DTa_f2a+ [0 0 0 (((-1)^(a_f2a1))*a_f2a_dx);
                          0 0 0 (((-1)^(a_f2a2))*a_f2a_dy);
                          0 0 0 (((-1)^(a_f2a3))*a_f2a_dz);
                          0 0 0  0]
       [DTf2a_f1b,r2]=varied1(f2a_f1b_t,f2a_f1b_t,0,f2a_f1b_dx,f2a_f1b_dy,0,f2a_f1b)
        if r2==0 then
           continue;
        end
        [DTb_f2b,r3]=varied1(b_f2b_t,b_f2b_t,0,b_f2b_dx,b_f2b_dy,0,b_f2b)
        if r3==0 then
           continue;
         end
        DTb_f2b=DTb_f2b+[0 0 0 0;
                         0 0 0 0;
                         0 0 0 b_f2b_dz;
                         0 0 0 0]
         [DTf2b_f1e,r4]=varied1(f2b_f1e_t,0,f2b_f1e_t,f2b_f1e_dx,0,f2b_f1e_dz,f2b_f1e)
        if r4==0 then
           continue;
         end
         [DTf1e_e,r5]=varied1(f1e_e_t,0,f1e_e_t,0,0,0,f1e_e)
        if r5==0 then
           continue;
         end
         DTf1e_e=DTf1e_e+[0 0 0 0;
                         0 0 0 (((-1)^(f1e_e_1))*f1e_e_dy);
                         0 0 0 0;
                         0 0 0 0]
         [DTe_h,r6]=varied1(0,0,0,0,e_h_dy,e_h_dz,e_h)
        if r6==0 then
           continue;
         end
       $Ta_h=Ta_f2a*DTa_f2a*DTf2a_f1b*Tb_f2b*DTb_f2b*Tf2b_f1e*DTf2b_f1e*Tf1e_e*DTf1e_e*Te_h*DTe_h
       $Tb_h=Tb_f2b*DTb_f2b*Tf2b_f1e*DTf2b_f1e*Tf1e_e*DTf1e_e*Te_h*DTe_h
       
       disp($Tb_h)
       disp('In Progress')
       q=q+1;
       y=($Ta_h(2,4)-Ta_h(2,4));
       yt=($Tb_h(2,4)-Tb_h(2,4));
       //t=($Ta_e(3,2)-Ta_e(3,2));
       //z=($Ta_e(3,4)-Ta_e(3,4));
       disp("Current Center Offset(mm)=") 
       disp(yt)
       disp("Maximum Center Offset(mm)=") 
       disp(ytmax)
       disp("Percentage(%)")
       disp(perc)
       if abs(yt)>abs(ytmax) then
       ytmax=($Tb_h(2,4)-Tb_h(2,4));
       disp(ytmax)
       DTa_f2a_ro=DTa_f2a
       DTf2a_f1b_ro=DTf2a_f1b
       DTb_f2b_ro=DTb_f2b
       DTf2b_f1e_ro=DTf2b_f1e
       DTf1e_e_ro=DTf1e_e
       DTe_h_ro=DTe_h
       $Tb_h_ro=$Tb_h
       $Ta_h_ro=$Ta_h
   end
   /*
       if t>tmax then
       tmax=($Ta_e(3,2)-Ta_f2a(3,2));
       disp(tmax)
       DTa_f2a_fo=DTa_f2a
       DTf2a_f1b_fo=DTf2a_f1b
       DTb_f2b_fo=DTb_f2b
       DTf2b_f1e_fo=DTf2b_f1e
       DTf1e_e_fo=DTf1e_e
       DTe_h_fo=DTe_h
       $Ta_e_fo=$Ta_e
   end
   */
/*
       if z<zmin then
       zmin=($Ta_e(3,4)-Ta_f2a(3,4));
       disp(zmin)
       DTa_f2a_ao=DTa_f2a
       DTf2a_f1b_ao=DTf2a_f1b
       DTb_f2b_ao=DTb_f2b
       DTf2b_f1e_ao=DTf2b_f1e
       DTf1e_e_ao=DTf1e_e
       DTe_h_ao=DTe_h
       $Ta_e_ao=$Ta_e
   end
   */
                   end
                 end
               end
            end
          end
        end
      end
    end
  end
end
disp('Done')
disp(q)
dr2=getdate()
disp(etime(dr2,dr1))


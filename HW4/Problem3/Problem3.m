syms theta a l


R_inv =  [ cos(theta), -sin(theta), 0;...
                sin(theta) , cos(theta) ,0;...
                0 , 0, 1];
            
            
 J_1 = [1 0 -l;...
        1 0  l;...
        0  1 0];

 J_2 = [ a/2 0; 0 a/2; a/2 a/2];
 
 
 J = R_inv*J_1^-1*J_2
 
 
 J_2 = [ J(1,1),J(1,2);...
         J(2,1),J(2,2);...
         0  ,0;
          0,0;
          0,0;
          J(3,1),J(3,2)]
      
      
 transpose(J_2)
 
 
 
 
 
clear all;
clc;

disp ('Fixed point method')
disp ('persamaan : (2*x1^3)-(5*x1^2)-(9*x1)-10 = 0 \n');
disp ('---------------------------------------------------')
x1=input('masukkan nilai x1 = ');
toleransi=input('masukkan nilai toleransi = ');
ite=0;
x = (2*x1^3)/9-(5*x1^2)/9-10/9;

fprintf ('=============================================================\n');
fprintf ('iterasi akar \n');
fprintf ('=============================================================\n');

while abs(x-x1)>toleransi
  x = x1;
  x1 = (2*x1^3)/9-(5*x1^2)/9-10/9;
  fprintf(' %3f %10.7f\n',ite, x);
  ite=ite+1;
end

akar = x;
fprintf('Akarnya adalah = %8.7f\n', akar);
fprintf('Jumlah Iterasi = %3f\n', ite);
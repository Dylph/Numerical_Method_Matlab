clear all;
clc; syms x

fprintf ('metode newton rapshon\n');
fprintf ('---------------------------------------------------\n');
f=input('masukkan persamaan f = ');
x=input('masukkan nilai x = ');
toleransi=input('masukkan nilai toleransi = ');
e=1;
ite=0;
f2= diff(f);

fprintf ('=============================================================\n');
fprintf ('iterasi f    f2         x    selisih \n');
fprintf ('=============================================================\n');

while e>=toleransi
    f = subs(f);
    f2 = subs(f2);
    x = double(x);
    f = double(f);
    f2 = double(f2);
    ite= ite+1;
    x1= x-(f/f2);
    e= abs((x1-x)/x);
    x= x1;
    
    fprintf (' %3d %8.5f %8.5f %8.5f %8.5f\n', ite, f, f2, x1, e);
end

fprintf ('=============================================================\n');
fprintf ('Pada iterasi ke %d, selisih < %5.3f.\n',ite,toleransi);
fprintf('Jadi persamaannya adalah %7.5f.\n',x);
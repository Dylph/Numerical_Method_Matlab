x=input('Masukkan X awal: ') ;
f=inline('exp(x)-4*x');
E=0.1;
f1=inline ('exp(x)-4');
i=1;
disp('_______________________________');
disp(' i         xi         f(xi)    ');
disp('_______________________________');
while abs(f(x))>=E
    x=x-(f(x)/f1(x));
    disp(sprintf('%3.0f %12.6f %12.6f %12.6f\n',i,x,f(x)));
    i=i+1;
end
disp('_______________________________');
disp(sprintf('Akarnya adalah = %10.8f\n', x))
xg=linspace(-7,7);
yg=f(xg);
plot(xg,yg)
grid on
x=0.27
f=1500.*((x+1).^20-1)-750000*x
plot(x,f)

diff(f)

x = 0.27;
Tol = 0.0000001;
count = 0;
dx=1;   %this is a fake value so that the while loop will execute
f=-2.5283;   
fprintf('step      x           dx           f(x)\n')
fprintf('----  -----------  ---------    ----------\n')
fprintf('%3i %12.8f %12.8f %12.8f\n',count,x,dx,f)
xVec=x;fVec=f;
while (dx > Tol || abs(f)>Tol)  %note that dx and f need to be defined for this statement to proceed
    count = count + 1;
    fprime = 30000.*(x+1).^19-750000;
    xnew = x - (f/fprime);   % compute the new value of x
    dx=abs(x-xnew);          % compute how much x has changed since last step
    x = xnew;
    f = 1500.*((x+1).^20-1)-750000*x;       % compute the new value of f(x)
    fprintf('%3i %12.8f %12.8f %12.8f\n',count,x,dx,f)
end


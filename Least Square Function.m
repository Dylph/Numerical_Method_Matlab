clc;

function least_squares(x, y, m)

n = size(x,1);
if n == 1
   n = size(x,2);
end

b = zeros(m+1,1);
for i = 1:n
   for j = 1:m+1
      %right-hand side column vector consisting of sums of
      %powers of x multiplied by y's
      b(j) = b(j) + y(i)*x(i)^(j-1);
   end
end


p = zeros(2*m+1,1);
for i = 1:n
   for j = 1:2*m+1
      %sums of powers of x
      p(j) = p(j) + x(i)^(j-1);
   end
end


for i = 1:m+1
   for j = 1:m+1
      %distributing the sums of powers of x in a matrix A
      A(i,j) = p(i+j-1);
   end
end

c = A\b

%creating an x-axis and evaluating the least-ssquare polynomial
%this is only needed for data visualization
t = min(x):0.05:max(x);
n = size(t,2);
for i = 1:n
   f(i) = c(m+1);
   for j = m:-1:1
      f(i) = c(j) + f(i)*t(i);
   end
end

%data visualization
figure
plot(t,f)	%the least_squares polynomial
hold on
plot(x, y, 'r*')	%the data points
grid on
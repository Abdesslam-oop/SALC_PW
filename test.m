num=10;
den=[1 2 10];
printsys(num,den)
t = 0:0.1:10;
y=step(num,den, t);
num1 = 15;
den1 = [1 1 15]
y1 = step(num1, den1, t)
num2 = [9 2];
den2 = [1 0.8 5 1];
y2 = step(num2, den2, t)
num3 = [1 1];
den3 = [1 2 2 7];
y3 = step(num3, den3, t)
figure
plot(t,y)
hold on
plot(t,y1,'r')
hold on
plot(t,y2, 'g')
hold on
plot(t,y3, 'y')
xlabel('t')


roots(den)
roots(den1)
roots(den2)
roots(den3)


num4 = 1;
den4 = [1 4 3];
y4 = impulse(num4, den4, t);
y5 = impulse(num, den, t);
figure
plot(t, y4)
hold on
plot(t, y5, 'r')

num5 = [2 1];
den5 = [1 6 5];
y6 = step(num5, den5, t);
step = step(1, 1, t);
figure
plot(t, y6);
hold on 
plot(t, step)
 

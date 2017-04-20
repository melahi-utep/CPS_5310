function error = lv_E(p)
years = 0:2:48; %years 1900-1920
H = [.3 .85 14.8 .6 .9 2.5 5 9 7 1 1.1 4.2 13 5 1.8 4 7.8 3.5 .5 1 .5 5.8 3.6 2.3 3]; %H for population of Hare
L = [.3 1.8 4.3 6.2 1 .8 3 4.7 4.2 1.2 1.3 3.5 7.2 3 2.2 1.5 4 3.6 2.3 .8 1 2 5.8 4 1]; %L for population of Lynx

[t,y] = ode45(@(t,y) lv_rhs(t,y,p),years,[H(1);L(1)]);
value = (y(:,1)-H').^2+(y(:,2)-L').^2;
error = sum(value);

end
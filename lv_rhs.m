function value = lv_rhs(t,y,p)
%lv_rhs.m
%This function provides the RHS vector valued function
%for the lotka volterra system of ODEs
value = [p(1)*y(1)-p(2)*y(1)*y(2); -p(4)*y(2)+p(3)*y(1)*y(2)];

end


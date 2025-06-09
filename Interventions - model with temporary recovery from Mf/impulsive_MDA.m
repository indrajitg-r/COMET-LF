function output = impulsive_MDA(time)
    % Specify values at different times
   impulse = zeros(20*52, 1);
   A=0.45*ones(20);
   B=tril(A);
   r = B(7,:);%
%    r = [repelem(0.9276,5) repelem(0,5)];
    for year = 1:20
        startWeek = (year - 1) * 52 + 5;   %MDA conducted over 4 weeks
        endWeek = startWeek + 3;  
        impulse(startWeek:endWeek) = r(year)/4;
    end
    for i = 1:1:time
        output = impulse(i);
    end
end


%    a = 60;
%    b = 80;
%    r = (b-a).*rand(1,16) + a;
%    [44.3469299445377,43.3349458709113,44.4246511207569,68.9234074643381,54.7213063706308,58.9057893194536,51.8448561727261,63.7382513022820,60.6831637358448,61.3065537909817,43.4820950639273,68.0745250863835,49.6750917075003,69.3012844136005,55.4396169459773,55.3665988942472]
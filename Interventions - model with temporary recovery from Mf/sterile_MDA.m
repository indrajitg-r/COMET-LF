function output = sterile_MDA(time)
    % Specify values at different times
   yrs=0;
   sterile_mda=[ones(4,1);zeros(4+yrs*52,1); ones(((10-yrs)*52-4), 1)];
    for i = 1:1:time
        output = sterile_mda(i);
    end
end
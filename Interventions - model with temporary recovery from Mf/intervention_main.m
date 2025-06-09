% intervention
clear all
clc
parameters;
load initial_conditions_accepted_prev_10_without_immunity.mat
options = odeset('AbsTol',1e-8,'RelTol',1e-11);
prev_MDA = [];
disease_MDA = [];
% infected_vectors =[];
parfor j=1:length(j2)
    j
k00=J(j2(j),:);
param = k00;
% y30 = zeros(10,1);
% y30(1:5,1)=y20(1:5,j);
% y30(7:10,1)=y20(6:9,j);
y30 = y20(:,j);
[t4,y4]=ode45(@LF_ode_new,[1:1:20*52], y30, options, param);
prev_MDA(j,:) = (y4(:, 4)*100)./(pi_h/mu_h);
disease_MDA(j,:) = (y4(:, 5)*100)./(pi_h/mu_h);
% infected_vectors(j) = y4(1, 9);
end

%%% probability of MF prev < 1%
    count = 0; % count number of curves that rise back to 1%
    id1 = []; % curves that rise back to 1%
    id2 = []; % curves that stay below 1%
for j = 1:length(j2)
    if (prev_MDA(j,8*52+9)>1)
        id1 = [id1,j];
        count = count + 1;
    else
        id2 = [id2,j];
    end
end

% id3 = []; % curves that rise back to 1%
% id4= []; % curves that stay below 1%
prob_mf_less_1_percent = 1-length(id1)/length([id1,id2])

% for j = 1:length(j2)
%     if (prev_MDA(j,16*52+9)>1)
%         id3 = [id3,j];
%         count = count + 1;
%     else
%         id4 = [id4,j];
%     end
% end

% save('baseline_10_DA_45_5_years_disease_rates.mat','disease_MDA','prev_MDA')
% save('baseline_5_45_DA_MDA_mf_disease.mat','disease_MDA','prev_MDA')
% prob_mf_resurge = length(id3)/length([id3,id4])
plot(prev_MDA')

% xlabel('Time (weeks)')
% ylabel('Mf rate')
% title('IDA-MDA coverage = 65%')
% %xlim([0 12*14])
% x1=3*52+9;
% y1=get(gca,'ylim');
% hold on
% plot([x1 x1],y1, 'k--','LineWidth',1)
% hold on
% % x2=13*52+9;
% % hold on
% % plot([x2 x2],y1, 'b--','LineWidth',1)
hold on
y2=1;
x3=get(gca,'xlim');
plot(x3,[y2 y2], 'r--','LineWidth',1)
% %save('initial_conditions_UP_2003.mat', 'y30')
% hold on
% y1=get(gca,'ylim');
% x2=[5, 52+5, 2*52+5, 3*52+5, 4*52+5, 5*52+5, 6*52+5];
% for i=1:7
%     plot([x2(i) x2(i)],y1,'k--','LineWidth',2)
%     hold on
% end
% hold off
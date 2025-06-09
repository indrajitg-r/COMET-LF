load baseline_2_DA_85_5_years_disease_rates.mat
symptomatic_LF_violin = [ disease_MDA(:,1) disease_MDA(:,4*52+1) disease_MDA(:,8*52+1) disease_MDA(:,12*52+1) disease_MDA(:,16*52+1) disease_MDA(:,20*52)];

violinplot(symptomatic_LF_violin)
xlabel('Years after starting MDA')
ylabel('Aggregated lymphoedema and hydrocele (%)')

Percent_reduction = (mean(disease_MDA(:,1))-mean(disease_MDA(:,20*52)))/mean(disease_MDA(:,1))
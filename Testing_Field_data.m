clear all; close all; clc;

%% Load the trained network
load('.\Denoising_Spaker_BILSTM_FrFT.mat');

%%
load('Sparker_seismic_data.mat');
Fractional_power=-0.25:0.01:0.25; % -22.5 ~ 22.5 (0.9)

[nt_p,N_sample]=size(Sparker_seismic_data); 
Predicted_data=zeros(nt_p,N_sample);

for kk=1:N_sample
    disp([num2str(kk) '//' num2str(N_sample)]);
    FrFT_data=complex(zeros(nt_p,length(Fractional_power)),0);
    for ii=1:length(Fractional_power)
        f_power=Fractional_power(ii);
        c=frft(Sparker_seismic_data(:,kk),f_power);
        FrFT_data(:,ii)=c;
    end
    Predicted_data(:,kk)=predict(Net_Deep_BiLSTM,real(FrFT_data)');  
end

save('Predicted_data.mat','Predicted_data','D')

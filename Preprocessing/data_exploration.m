%% data_exploration
% Make nicely formatted data 
clear

pat_list = []; %(pat,chan, time, freq)

% data_folder = '/Users/macbookpro/Documents/Network_Science_Data/data_preprocessed_matlab';
% cd(data_folder)

% file_path path to the folder where you have the data
file_path = '/Users/macbookpro/Dropbox/College/6th Semester/Network Science/Project/TRFDOut_high';

cd(file_path)

for pat = 1:32 % For each participants %TODO: fix pat with more data
    filename = sprintf('TRFDOut_Sel_ppt%02d.mat',pat);
    field = sprintf('trfOut');
    data  = load(filename);
    data = data.(field);
    chan_list = []; % (chan, time, freq)
    for chan = 1:32 % For each channel
        bins = data(chan).AllTrialsTFPowerBins;
        freq_list = []; % (time, freq);
        for f = 1:5
            freq_list(:,f) =  mean(bins(f,2:end,:),3);
            disp(size(freq_list))
        end
        chan_list(chan,:,:) = freq_list;
    end
    pat_list(pat,:,:,:) = chan_list; %TODO: fix here wth more data... pat_list(pat,:,:,:) = chan_list;
end


%% Plot participant variance
% --> Do we need to normalize??
% 
figure(1)
plot(mean(mean(mean(pat_list,2),3),4))
disp(mean(mean(mean(pat_list,2),3),4))
title('participants')

%% Plot channel Variance
% 
figure(2)
values = mean(mean(mean(pat_list,1),3),4);
values = reshape(values,[1,size(values,2)]);
plot(values)
title('channels')

%% Plot Frequency Variance
figure(3)
values = mean(mean(mean(pat_list,1),2),3);
values = reshape(values,[1,size(values,4)]);
plot(values)
title('frequencies')
%% Plot time variance
figure(4)
values = mean(mean(mean(pat_list,1),2),4);
values = reshape(values,[1,size(values,3)]);
plot(values)
title('Times')


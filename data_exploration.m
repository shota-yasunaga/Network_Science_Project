
%% Make nicely formatted data 
%% 
pat_list = []; %(pat,chan, time, freq)

% data_folder = '/Users/macbookpro/Documents/Network_Science_Data/data_preprocessed_matlab';
% cd(data_folder)


for pat = 32 % For each participants %TODO: fix pat with more data
    filename = sprintf('TRFDOut_AllPowerBins_ppt%02d.mat',pat);
    load(filename,'data')
    chan_list = []; % (chan, time, freq)
    for chan = 1:32 % For each channel
        bins = data.data; %TODO: change according to the structure
        freq_list = []; % (time, freq);
        for f = 1:5
            freq_list(:,f) =  mean(bins(f,:,:),2);
            disp(size(freq_list))
        end
        chan_list(chan,:,:) = freq_list;
    end
    pat_list(1,:,:,:) = chan_list; %TODO: fix here wth more data
end

% pat_list = reshape(pat_list, (1,32,5,12)
disp(size(pat_list))


%% Do plottng work with pat _list
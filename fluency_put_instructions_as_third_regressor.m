clear
clc

pth = '/network/lustre/iss02/cenir/analyse/irm/users/benoit.beranger/MEMOBRAIN/onsets';

subj = gdir(pth, 'MEMOBRAIN_Sujet\d_grp');
fluencymat = gfile(subj, 'MRI_Fluency_run\d{2}_SPM.mat$');

for iFile = 1 : length(fluencymat)
    
    fname = fluencymat{iFile};
    
    clear names onsets durations
    load(fname)
    
    idx_instruction = find(strcmp(names,'instruction'));
    if idx_instruction == 1
        
        fprintf('permutation on : %s \n', fname)
        
        names     = circshift(names    , [-1 0] );
        onsets    = circshift(onsets   , [-1 0] );
        durations = circshift(durations, [-1 0] );
        
        save(fname, 'names', 'onsets', 'durations')
        
    else
        
        fprintf('pass on : %s \n', fname)
        % pass
        
    end
    
    
    
end
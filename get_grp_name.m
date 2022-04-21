function grp_name = get_grp_name( e )

subj_name = {e.name}';
grp_name  = cellfun(@(x) x{end}, regexp(subj_name, '_' , 'split'), 'UniformOutput', 0);

end

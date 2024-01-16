function reload-functions
    for func in $__fish_config_dir/functions/*.fish
        source $func
    end
end

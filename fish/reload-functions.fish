function reload-functions
    for func in $__fish_config_dir/functions/*.fish
        if string match -q $func $__fish_config_dir/functions/_*.fish
            # Skip autoload functions
            continue
        end
        source $func
    end
end

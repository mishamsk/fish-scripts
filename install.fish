find . -name "*.fish" -not -depth 1 -exec cp {} $__fish_config_dir/functions/ \;

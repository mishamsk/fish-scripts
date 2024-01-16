function py_create_package --description 'Create an empty Python package folder with empty __init__.py'

    if string match -q /* $argv
        echo "Error: Path must be relative"
        return 1
    end

    set -l dirs (string split / $argv)

    if test (count $dirs) -lt 1
        echo "Error: Path must contain at least one folder"
        return 1
    end

    set -l dir ''

    for cmp in $dirs
        set -l dir $dir$cmp
        echo "Checking & creating package at $dir"

        if test ! -e $dir
            mkdir $dir
            touch $dir/__init__.py
        end

        set -l dir $dir/
    end
end

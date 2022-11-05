function py_create_package --description 'Create an empty Python package folder with empty __init__.py'
    if test ! -e $argv
        mkdir $argv
        touch $argv/__init__.py
    else
        if test -d $argv -a ! -e $argv/__init__.py
            touch $argv/__init__.py
        end
    end
end

function py_init --argument python_version --description "Initialize a python virtual env & direnv if available. Takes an optional argument 'python_version' to specify the Python version to be used (only available with asdf)."
    if test -d .venv
        echo Found existing virutal env at .venv. Removing...
        rm -fR .venv
    else
        echo No venv exist. Creating anew...
    end

    if command -v asdf >/dev/null
        # This will read the current python version used by asdf
        # Either the global one, of if a local one is set it will use that
        if test -z "$python_version"
            set python_version (asdf current python | awk '{print $2}')
        end

        echo Found asdf - will set the local python version to $python_version

        # This will initialize the local python version (or just do nothing if it is already set)
        asdf local python $python_version
    else
        echo Did not find asdf - will use the system python
    end

    python -m venv .venv
    if command -v direnv >/dev/null; and test ! -e .envrc
        echo Creating .envrc file...
        echo source .venv/bin/activate >.envrc
        echo dotenv_if_exists >>.envrc
        direnv allow .
    end
end

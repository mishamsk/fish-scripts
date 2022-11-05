function create_venv
    if test -d .venv
        echo Found existing virutal env at .venv. Removing...
        rm -fR .venv
    else
        echo No venv exist. Creating anew...
    end
    python -m venv .venv
    if test ! -e .envrc
        echo Creating .envrc file...
        echo source .venv/bin/activate >.envrc
        echo dotenv_if_exists >>.envrc
    end
    direnv allow .
end

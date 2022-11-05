function count_lines
    tokei --sort code --exclude .venv/ $argv .
end

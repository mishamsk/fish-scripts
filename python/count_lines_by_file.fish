function count_lines_by_file
    tokei --sort code --files --exclude .venv/ $argv .
end

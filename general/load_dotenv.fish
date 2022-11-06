function load_dotenv
    if test (count $argv) -eq 0
        set dotenv_path .env
    else
        set dotenv_path $argv[1]
    end

    if test -f $dotenv_path
        echo "Loading $dotenv_path"

        while read -l line
            if test (string sub -l 1 $line) = "#"
                continue
            end
            set -l pair (string split -m1 '=' $line)
            if test (count $pair) -eq 2
                set -gx $pair[1] $pair[2]
            end
        end <$dotenv_path
    else
        echo "No $dotenv_path file found"
    end
end

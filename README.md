# fish-scripts
My collection of fish scripts

## Installation
* Clone this repository
* run `source install.fish` to install the scripts (will be copied to `$__fish_config_dir/functions/`)
* reload shell, or run `source fish/reload-functions.fish` to reload the scripts

## python
* **py_create_package.fish** - use `py_create_package path/to/package` to create a python package folder with an empty `__init__.py` file in it. Will not create parent folders if they don't exist.
* **create_venv.fish** - use `create_venv` to create or re-create a python virtual environment in `.venv` folder and create a .envrc file to use direnv to activate it.
* **count_lines_by_file.fish** - count code lines by file in the current directory. Uses `tokei`, so it must be installed (e.g. with brew)
* **count_lines.fish** - count code lines in the current directory. Uses `tokei`, so it must be installed (e.g. with brew)

## docker
* **docker_mounts.fish** - use `docker_mounts` to list all docker mounts in a convenient table.

## general
* **load_dotenv.fish** - load environment variables from a .env file. Use `load_dotenv` to load the .env file in the current directory, or `load_dotenv path/to/dotenv_file` to load a specific file.
* **bup.fish** - brew update && brew upgrade

## fish
* **reload-functions.fish** - reload all user defined fish functions in the current shell. Useful when you're developing a function and want to test it without restarting the shell.
# .bashrc

export UV_CACHE_DIR="/placeholder/.uv/uv_cache"
export UV_ENV_DIR="/placeholder/.uv/uv_venvs"

declare -A dir_vars=(
  ["$UV_CACHE_DIR"]="UV_CACHE_DIR"
  ["$UV_ENV_DIR"]="UV_ENV_DIR"
)

for dir in "$UV_CACHE_DIR" "$UV_ENV_DIR"; do
  if [[ "$dir" == *"placeholder"* ]]; then
    var_name="${dir_vars[$dir]}"
    echo "Error: Global variable '$var_name' is set to '$dir' which contains placeholder values. Please choose a different directory."
  fi
done

luv() {
    # Set the predetermined location for your virtual environments
    if [[ "$1" == "list" ]]; then
        # List the available environments
        echo "Available virtual environments in $UV_ENV_DIR:"
        ls -1 "$UV_ENV_DIR"
    else
        # Activate the specified environment
        local ENV_PATH="$UV_ENV_DIR/$1"
        if [[ -d "$ENV_PATH" && -f "$ENV_PATH/bin/activate" ]]; then
            echo "Activating virtual environment: $1"
            source "$ENV_PATH/bin/activate"
        else
            echo "Error: Virtual environment '$1' not found in $UV_ENV_DIR"
            return 1
        fi
    fi
}

cuv() {
    if [ $# -eq 0 ]; then
        echo "Usage: cuv <venv_name> [additional uv venv arguments...]"
        echo "Example: cuv myproject --python 3.11"
        return 1
    fi

    local venv_name="$1"
    shift  # Remove the first argument (venv_name) from $@

    # Create the virtual environment
    uv venv "$UV_ENV_DIR/$venv_name" "$@"
}

# Optional: Add completion for common uv venv flags
_cuv_completion() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Common uv venv options
    local opts="--python --seed --verbose --quiet --help"

    if [[ ${cur} == -* ]]; then
        COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    fi
}

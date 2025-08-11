# .bashrc

export UV_CACHE_DIR="~/placeholder"
export UV_ENV_DIR="~/placeholder/env"

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

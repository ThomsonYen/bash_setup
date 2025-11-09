export HF_HOME="/placeholder/.hf_cache"

export XDG_CACHE_HOME=$HF_HOME
export TRANSFORMERS_CACHE=$HF_HOME
export HF_DATASETS_CACHE=$HF_HOME

# Check initialization
if [[ "$HF_HOME" == *"placeholder"* ]]; then
    echo "Error: Global variable 'HF_HOME' is set to '$HF_HOME' which
    contains placeholder values. Please choose a different directory."

    # Prompt user for new directory
    read -p "Enter a new path for HF cache directory: " new_path
    if [ -n "$new_path" ]; then
        HF_HOME="$new_path"

        echo "Updated HF_HOME to '$HF_HOME'"
        export HF_HOME
        export XDG_CACHE_HOME=$HF_HOME
        export TRANSFORMERS_CACHE=$HF_HOME
        export HF_DATASETS_CACHE=$HF_HOME
    else
        echo "No input provided. Exiting setup."
        return 1
    fi
fi

# Create directory if it doesn't exist
for dir in "$HF_HOME" "$XDG_CACHE_HOME" "$TRANSFORMERS_CACHE" "$HF_DATASETS_CACHE"; do
  if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
  fi
done

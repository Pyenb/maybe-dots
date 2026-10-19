export DIR_NAME="$PWD:t"

function update_dir_name() {
  export DIR_NAME="${PWD:t}"
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd update_dir_name

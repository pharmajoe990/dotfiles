#export PATH="$PATH:$(yarn global bin)"

# JAVA_HOME is openJDK 11 managed by asdf (version manager)
export JAVA_HOME="/Users/ropes/.asdf/installs/java/adopt-openjdk-11.0.4+11_openj9-0.15.1"

# Set the bat theme
export BAT_THEME="base16-256"

#FZF
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

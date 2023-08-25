chmod -R go-w '/usr/local/share'

# Load dotfiles:
for file in ~/.{.zprompt,aliases,private}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#Git auto-complete
if type brew &>/dev/null; then
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

autoload -Uz compinit
compinit
fi

# Setting PATH for Python 3.7
# PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
# export PATH

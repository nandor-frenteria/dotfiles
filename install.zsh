#!/usr/bin/env zsh
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
# And also installs Homebrew Packages
# And sets Sublime preferences
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.zsh <home_directory>"
    exit 1
fi

homedir=$1

# dotfiles directory
dotfiledir=${homedir}/repos/Personal/dotfiles

# list of files/folders to symlink in ${homedir}
files="zprofile zshrc zprompt aliases private"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in "${=files}"; do 
    echo "Creating symlink to ${file} in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Download Git Auto-Completion
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh" > ${homedir}/.git-completion.zsh

# Run the Homebrew Script
# ./brew.zsh

# Run the Sublime Script
# ./sublime.zsh

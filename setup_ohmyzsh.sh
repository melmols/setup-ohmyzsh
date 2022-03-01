#! /bin/bash

echo "Checking for OS type..."
if [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        echo "you are using Mac OSX"
        brew install zsh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux<3
        echo "Linux user <£"
        distro=(`cat /etc/issue`)

        #checking which distro
        if [[ $distro == "Ubuntu" ]]; then
          apt install zsh
          echo "zsh is installed, changing the default shell of the root user to zsh... "
          chsh -s /usr/bin/zsh root

        elif [[ $distro == "CentOS" ]]; then
          dnf install zsh
          echo "zsh is installed, changing the default shell of the root user to zsh... "
          chsh -s /usr/bin/zsh root
        else
          echo "couldn't pick up your distro, try installing zsh and re running script"
          exit

        fi

elif [[ "$OSTYPE" == "cygwin"* || "$OSTYPE" == "winsys"*  ]] ; then

        echo "you have a windows machine... you'll need to install zsh the windows way..."
        echo "after installation, re run script hehe"
        exit
else
        echo "unknown os.. try to figure out how to isntall zsh and re run script hehe"
        exit

fi

echo "downloading installer script.."

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O -

echo "running zsh..."

zsh

echo "Copying the template .zshrc.zsh-template configuration file to the home directory .zshrc..."

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "applying changes..."

source ~/.zshrc

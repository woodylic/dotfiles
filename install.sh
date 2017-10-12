#!/bin/sh

BASE_DIR=`pwd`
TODAY=`date +%Y%m%d%H%M%S`


install_mac_os() {
    # 安装 Homebrew
    if [ ! `which brew` ]
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    # GNU coreutils
    brew install coreutils
    # iterm2 上传/下载文件 see https://github.com/mmastrac/iterm2-zmodem
    brew install lrzsz
    # Google Chrome Start script
    ln -sf $BASE_DIR/scripts/chrome_osx.sh /usr/local/bin/chrome
}


install_dependence() {
    install_mac_os
}

# 配置Zsh
setup_zsh() {
    echo "\033[034m* 配置zsh...\033[0m"
    for i in $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.dir_colors
    do [ -L $i ] && unlink $i
    done
    for i in $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.dir_colors
    do [ -e $i ] && mv $i $i.$TODAY
    done
    ln -s $BASE_DIR/terminal/zsh/zshrc $HOME/.zshrc
    ln -s $BASE_DIR/terminal/zsh/oh-my-zsh $HOME/.oh-my-zsh
    ln -s $BASE_DIR/terminal/zsh/dircolors.ansi-dark $HOME/.dir_colors
}

# 配置git
setup_git() {
    echo "\033[034m* 配置Git...\033[0m"
    if [ -L $HOME/.gitconfig ];then
        unlink $HOME/.gitconfig
    elif [ -f $HOME/.gitconfig ];then
        mv $HOME/.gitconfig $HOME/.gitconfig.$TODAY
    fi
    ln -s $BASE_DIR/terminal/gitconfig $HOME/.gitconfig
}

# 配置vim
setup_vim() {
    cd vim
    sh install.sh
}

# 基本的终端环境配置
setup_terminal() {
    setup_zsh
    setup_git
    setup_vim
}

link_others() {
    # jshintrc
    if [ -L $HOME/.jshintrc ];then
        unlink $HOME/.jshintrc
    elif [ -f $HOME/.jshintrc ];then
        mv $HOME/.jshintrc $HOME/.jshintrc.$TODAY
    fi
    ln -s $BASE_DIR/dotrc/jshintrc $HOME/.jshintrc

    for i in $HOME/.jshintrc $HOME/.npmrc
    do [ -L $i ] && unlink $i || [ -f $i ] && mv $i $i.$TODAY
    done

    ln -s $BASE_DIR/dotrc/jshintrc $HOME/.jshintrc
    ln -s $BASE_DIR/dotrc/npmrc $HOME/.npmrc

}

############################## Setup Start ######################################

install_dependence
link_others
setup_terminal

echo "\033[034m* Last Step : Change your login shell to zsh.\033[0m"
chsh -s "/bin/zsh"

echo "\033[034m* Configure completed, just enjoy!\033[0m"

################################ Setup End ######################################

# My dotfiles

---

### 关于

参考https://github.com/fangwentong/dotfiles.git

此仓库存放的是一些linux常用的配置文件，
通过软链接建立与系统配置文件的联系（系统的相关配置文件通过软链接指向该仓库中的文件).
如 `~/.vimrc` ->  `repo_path/vim/vimrc`.

通过一个仓库管理这些配置文件的优势主要有：

- 借助编写的shell脚本，可实现系统配置的快速部署.
- 修改系统配置文件后，这些更改能直接反应到git工作目录中，借助git，可以高效地管理这些更改.
- 依托GitHub等平台，实现配置备份与共享.


### 配置列表

1. 个人常用脚本

```bash
cd ~
ln -s dotfiles/bin bin
```

1. `zsh`配置

```bash
cd ~
rm .zshrc
ln -s dotfiles/.zshrc .zshrc
```

1. `git`配置

```bash
cd ~
rm .gitconfig
ln -s dotfiles/.gitconfig .gitconfig
```

### 更多

获取`dotfiles`的更多信息，可以访问[http://dotfiles.github.io/](http://dotfiles.github.io/)

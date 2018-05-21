
# 简介
通过git管理emacs配置，实现快速定制安装。

# 功能列表
- 设定默认打开文件目录
- 字体中文英文等宽，解决表格样式错乱问题
- 转为html文件支持
- org-clock添加add-hook，`clock-in`当前任务内容输出成文件, `clock-out`时移除文件
- 支持鼠标点击伸缩项
- TODO List 子项目未完成时，父项目不能关闭功能
- org代码块及样式
- TODO参数个性化定制
- 蕃茄工作法支持
- 主题设置
- org-clock-table中的\emsp字符串展示优化
- TBC...


# 安装(ubuntu)
- 删除当前用户的 `.emacs` 文件和 `.emacs.d` 文件夹

```
$ rm ~/.emacs*

```

- 下载配置

```
$ cd ~
$ git clone git@github.com:cangyan/.emacs.d.git
```

## 修改默认打开目录
```README
$ vi ~/.emacs.d/config/default-directory.el
(setq default-directory "~/OneDrive")   //OneDrive 替换成自己想要的文件夹
(setq command-line-default-directory "~/OneDrive") //OneDrive 替换成自己想要的文件夹
```

## 定制TODO参数
```
$ vi ~/.emacs.d/config/org-summary-todo.el

## 替换人名即可
```
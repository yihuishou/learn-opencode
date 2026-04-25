---
title: 备用安装方式
subtitle: 官方脚本之外的其他选择
course: OpenCode 中文实战课
stage: 第一阶段
lesson: "1.2a"
duration: 5 分钟
level: 新手
description: OpenCode 的多种安装方式：npm、Homebrew、Chocolatey、Scoop、Docker、手动下载等。
tags:
  - 安装
  - npm
  - Homebrew
  - Docker
prerequisite:
  - 1.2 安装
---

# 备用安装方式

> 官方脚本 `curl ... | bash` 不适合你？这里有其他选择。

---

## 什么时候用这一页

- 官方安装脚本网络超时
- 你更习惯用包管理器（npm、Homebrew、Scoop 等）
- 公司电脑有安装限制
- 你想用 Docker 试用，不想装在系统里

---

## macOS / Linux

### Homebrew（推荐）

```bash
brew install anomalyco/tap/opencode
```

::: warning 注意
官方 Homebrew 公式是 `anomalyco/tap/opencode`。社区维护的 `brew install opencode` 更新较慢，不推荐。
:::

### npm / pnpm / bun / yarn

需要 Node.js 18+（推荐 22+）。

::: code-group

```bash [npm]
npm install -g opencode-ai
```

```bash [pnpm]
pnpm install -g opencode-ai
```

```bash [bun]
bun install -g opencode-ai
```

```bash [yarn]
yarn global add opencode-ai
```

:::

### Arch Linux

```bash
sudo pacman -S opencode    # 稳定版（推荐）
paru -S opencode-bin       # AUR 最新版
```

---

## Windows
<AdInArticle />

### Chocolatey

需要管理员权限运行 PowerShell：

```powershell
choco install opencode
```

### Scoop（推荐）

推荐用普通用户权限运行：

```powershell
scoop bucket add extras
scoop install extras/opencode
```

::: details 没装过 Scoop？
**按顺序逐条运行**以下命令：

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

```powershell
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

```powershell
scoop install git
```

如果你的 PowerShell 是以**管理员身份**运行的，安装 Scoop 时需要改用：

```powershell
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
```
:::

### npm

需要 Node.js 18+：

```powershell
npm install -g opencode-ai
```

### Mise

```powershell
mise use -g github:anomalyco/opencode
```

---

## Docker（适合尝鲜）

不想装在系统里？用 Docker 试试：

```bash
docker run -it --rm ghcr.io/anomalyco/opencode
```

::: warning 限制
Docker 里运行的 OpenCode 默认只能访问容器内的文件。如果你想让它读写你电脑上的文件，需要挂载目录：

```bash
docker run -it --rm -v $(pwd):/workspace -w /workspace ghcr.io/anomalyco/opencode
```

对新手不太友好，建议先用一键脚本或包管理器。
:::

---

## 手动下载

从 [GitHub Releases](https://github.com/anomalyco/opencode/releases) 下载对应平台的二进制文件，解压后放到 PATH 目录即可。

---

## 安装脚本高级参数

官方安装脚本 `curl -fsSL https://opencode.ai/install | bash` 支持以下参数：

```bash
# 安装指定版本
curl -fsSL https://opencode.ai/install | bash -s -- --version 1.1.6

# 不修改 shell 配置（不自动添加到 PATH）
curl -fsSL https://opencode.ai/install | bash -s -- --no-modify-path

# 从本地二进制安装
./install --binary /path/to/opencode
```

### 安装位置

官方脚本默认安装到 `$HOME/.opencode/bin`。如果你想装到其他位置，安装完成后手动移动二进制文件即可：

```bash
# 安装后移动到 /usr/local/bin
sudo mv ~/.opencode/bin/opencode /usr/local/bin/opencode
```

---

## 安装位置

| 安装方式 | 二进制位置 | 配置文件位置 |
|---------|-----------|-------------|
| 官方脚本 | `~/.opencode/bin/opencode` | `~/.config/opencode/opencode.json` |
| npm/pnpm/bun/yarn | 全局 node_modules | 同上 |
| Homebrew | `/opt/homebrew/bin/opencode` 或 `/usr/local/bin/opencode` | 同上 |
| Scoop | `~/scoop/apps/opencode/current/opencode.exe` | 同上 |
| Chocolatey | `C:\ProgramData\chocolatey\bin\opencode.exe` | 同上 |

---

## 没有 PATH 怎么启动？

如果 `opencode` 命令提示"找不到"，说明安装目录不在 PATH 里。可以用绝对路径直接启动：

### Windows

```powershell
# PowerShell（官方脚本安装）
C:\Users\<用户名>\.opencode\bin\opencode.exe

# 简写（用环境变量）
$env:USERPROFILE\.opencode\bin\opencode.exe

# Scoop 安装
C:\Users\<用户名>\scoop\apps\opencode\current\opencode.exe

# Chocolatey 安装
C:\ProgramData\chocolatey\bin\opencode.exe
```

```cmd
:: CMD（官方脚本安装）
%USERPROFILE%\.opencode\bin\opencode.exe
```

### macOS / Linux

```bash
# 官方脚本安装
~/.opencode/bin/opencode

# 或者展开写
/Users/<用户名>/.opencode/bin/opencode    # macOS
/home/<用户名>/.opencode/bin/opencode      # Linux
```

::: tip 建议
长期使用建议把安装目录加到 PATH，不用每次敲完整路径。参考 [1.2b 装不上怎么办？](./02b-install-troubleshoot) 的"手动添加到 PATH"部分。
:::

---

## 下一步

安装完成后，回到 [1.2 安装](./02-install) 的"验证安装"步骤，确认 `opencode --version` 能正常输出。

如果遇到问题，请看 [1.2b 装不上怎么办？](./02b-install-troubleshoot)

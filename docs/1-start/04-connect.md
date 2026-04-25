---
title: 连接模型：第一次对话
subtitle: 发送你的第一句话
course: OpenCode 中文实战课
stage: 第一阶段
lesson: "1.4"
duration: 15 分钟
practice: 10 分钟
level: 新手
description: 连接 MiniMax M2.7（国产模型第一梯队），完成 OpenCode 的第一次对话。
tags:
  - 模型
  - API Key
  - 智谱
  - GLM
prerequisite:
  - 1.2 安装
---

# 连接模型：第一次对话

## 📝 课程笔记

本课核心知识点整理：

<img src="/images/1-start/connect-notes.mini.jpeg" 
     alt="连接模型：第一次对话学霸笔记" 
     data-zoom-src="/images/1-start/connect-notes.jpeg" />

---

## 这是第一阶段的终点

学完这一课，你就能和 AI 对话了。

前面三课是准备工作。这一课是见证成果的时刻。

---

## 学完你能做什么

- 理解什么是 API Key（不只是"知道"，是真的理解）
- 成功配置至少一个模型提供商
- 发送第一句话，看到 AI 回复
- 知道怎么选适合自己的模型路线

---

## 🎒 开始前的准备

> 确保你已经完成：

- [ ] 完成了 [1.2 安装](./02-install)，`opencode --version` 能看到版本号
- [ ] 如果你要用国际模型或境外中转，完成了 [1.3 网络配置](./03-network)

---

## 先帮你做个决策：选哪条路线？

::: tip 🎯 国内用户首选：MiniMax M2.7

**为什么推荐 MiniMax M2.7？**
- **国产第一梯队**：Artificial Analysis 全球排名 Top 5，开源模型第一
- **自进化能力**：支持构建 Agent Harness，参与模型迭代
- **代码能力强**：SWE-Pro 56.22%，接近 Opus 水平
- **价格实惠**：Token Plan 29 元/月起步，Max/Pro 套餐性价比最高

👉 **直接前往 [1.4d 连接 MiniMax](./04d-minimax)**

---

- **只想先体验**：[OpenCode Zen 免费模型](./04a-free-models) 0 成本跑通流程
:::

如果你有特殊需求，也可以选择其它路线：

| 路线 | 费用/门槛 | 网络要求 | 适合场景 | 去哪里 |
|---|---|---|---|---|
| **MiniMax M2.7（推荐）** | 29元/月起 | 国内直连 | 国产首选、日常开发 | [1.4d 连接 MiniMax](./04d-minimax) |
| OpenCode Zen 免费模型 | 限时免费 | 通常可直连 | 0 成本先跑通流程 | [1.4a 免费模型](./04a-free-models) |
| 智谱 GLM-5 | 20元/月起 | 国内直连 | 日常开发 | [1.4c 连接智谱](./04c-zhipu) |
| DeepSeek | 极便宜 | 国内直连 | 日常开发 | [1.4b 连接 DeepSeek](./04b-deepseek) |
| Claude（Anthropic 官方） | 较贵 | 常需代理 | 复杂任务、英文项目 | [1.4e 连接 Claude](./04e-claude) |
| 第三方中转 | 取决于中转 | 取决于中转 | 有 `baseURL + key` | [1.4f 第三方中转](./04f-claudecode-relay) |
| Ollama 本地模型 | 免费 | 离线 | 隐私敏感、离线场景 | [1.4g 连接 Ollama](./04g-ollama) |
| OpenAI（GPT / Codex） | 较贵 | 常需代理 | 通用场景 | [1.4h 连接 OpenAI](./04h-openai) |
| 通义千问（阿里云） | 中等 | 国内直连 | 阿里生态 | [1.4i 连接通义千问](./04i-alibaba) |
| GitHub Copilot | 需已有订阅 | 可直连 | 复用 Copilot 订阅 | [1.4j GitHub Copilot](./04j-github-copilot) |

---

## 核心概念：什么是 API Key？

在配置之前，先理解一个概念。

### API Key 是什么

简单说：**API Key 是你访问 AI 服务的"身份凭证"。**

更准确地说：
- AI 公司（DeepSeek、智谱、MiniMax 等）提供 AI 服务
- 你想用这个服务，需要有个身份标识
- API Key 就是这个身份标识
- 它还用于计费（用多少，扣多少钱）

### API Key 的注意事项

::: danger 重要：保护好你的 Key
- **不要分享给别人**：有了 Key 就能用你的账户消费
- **不要提交到 GitHub**：有人专门扫描 GitHub 盗用 Key
- **不要截图发社交媒体**：你懂的

万一泄露了，立刻去官网删掉旧 Key，创建新的。
:::

---

## 两种配置方式

OpenCode 提供两种配置模型提供商的方式：

| 方式 | 场景 | 命令 |
|------|------|------|
| **TUI 内** | 启动 OpenCode 后在界面里配置 | `/connect` |
| **终端 CLI** | 启动前在命令行配置 | `opencode auth login` |

两种方式效果一样，选你顺手的用。

### 方式一：TUI 内用 /connect

在 OpenCode 界面输入：

```
/connect
```

会弹出提供商选择界面，按提示操作即可。

### 方式二：终端用 opencode auth login

在启动 OpenCode **之前**，在终端运行：

```bash
opencode auth login
```

你会看到提供商列表：

```
? Select provider
❯ OpenCode (recommended)
  Anthropic (Claude Max or API key)
  GitHub Copilot (ChatGPT Plus/Pro or API key)
  OpenAI (ChatGPT Plus/Pro or API key)
  Google
  ...
```

选择后按提示输入 API Key 或完成 OAuth。

### 查看已配置的提供商

```bash
opencode auth list
# 或简写
opencode auth ls
```

你会看到：

```
Credentials ~/.local/share/opencode/auth.json
√ OpenCode api

Environment
√ OpenCode OPENCODE_API_KEY
```

### 认证优先级

OpenCode 按以下顺序查找认证：

1. **环境变量**（如 `ANTHROPIC_API_KEY`、`OPENAI_API_KEY`）
2. **auth.json 文件**（`~/.local/share/opencode/auth.json`）
3. **配置文件**中的认证信息

::: tip 环境变量自动检测
OpenCode **启动时会自动扫描系统环境变量**，发现可用的 API Key 后自动启用对应的模型提供商。也就是说，只要你在系统里设了环境变量，不用在配置文件里写任何东西，OpenCode 就能识别。

**各提供商对应的环境变量名**：

| 提供商 | 环境变量名 |
|--------|-----------|
| Anthropic (Claude) | `ANTHROPIC_API_KEY` |
| OpenAI (GPT) | `OPENAI_API_KEY` |
| DeepSeek | `DEEPSEEK_API_KEY` |
| Google (Gemini) | `GOOGLE_GENERATIVE_AI_API_KEY` 或 `GEMINI_API_KEY` |

**设置方法**（以 Anthropic 为例）：

```bash
# macOS / Linux（临时，当前终端有效）
export ANTHROPIC_API_KEY=sk-ant-api03-xxxxx

# macOS / Linux（永久，写入 ~/.zshrc 或 ~/.bashrc）
echo 'export ANTHROPIC_API_KEY=sk-ant-api03-xxxxx' >> ~/.zshrc
source ~/.zshrc

# Windows PowerShell（永久）
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", "sk-ant-api03-xxxxx", "User")
```

设置后重启 OpenCode，输入 `/models` 就能看到对应提供商的模型了。
:::

::: info 凭证存储位置
`~/.local/share/opencode/auth.json`（所有平台统一，遵循 XDG 规范）
:::

---

## 切换模型

配置完多个模型后，在 TUI 内用 `/models` 命令随时切换：

```
/models
```

用 <kbd>↑</kbd> <kbd>↓</kbd> 选择，按 <kbd>Enter</kbd> 确认。

::: tip 设置默认模型
在 `opencode.json` 中配置 `model` 字段，可以设置默认使用的模型。模型 ID 必须和 `/models` 列表中的**完全一致**，手打容易出错，建议整行复制。

```bash
# 先在终端查看可用的模型 ID
opencode models
```

```json
{
  "model": "deepseek/deepseek-chat"  // ← 从 opencode models 列表里整行复制，别手打
}
```
:::

---

## 检查点 ✅

完成任意一个子章节后，你应该能做到：

- [ ] 输入 `/models` 能看到已配置的模型
- [ ] 发送消息后能收到 AI 回复
- [ ] 没有报错（如 `API key invalid` 或 `connection error`）

---

## 下一步该学什么？

当你已经成功完成第一次对话，就可以进入第二阶段：

- [2.1 界面与基础操作](../2-daily/01-interface)
- [2.2 管理对话](../2-daily/02-sessions)
- [3.1 Plan vs Build](../3-workflow/01-plan-build)

::: tip 遇到问题？
连接模型时卡住了？[加入社群](/community)，和 2000+ 同路人一起交流，实时答疑。
:::

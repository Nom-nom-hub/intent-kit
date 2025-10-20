# Intent Kit - Intent-Driven Development Toolkit

<div align="center">
    <h1>🌱 Intent Kit</h1>
    <h3><em>Build outcome-focused software faster.</em></h3>
</div>

<p align="center">
    <strong>An open source toolkit that allows you to focus on user intent and predictable outcomes instead of implementation-first development.</strong>
</p>

<p align="center">
    <a href="#"><img src="https://img.shields.io/badge/license-MIT-blue" alt="License"/></a>
</p>

---

## Table of Contents

- [🤔 What is Intent-Driven Development?](#-what-is-intent-driven-development)
- [⚡ Get Started](#-get-started)
- [🤖 Supported AI Agents](#-supported-ai-agents)
- [🔧 Intent CLI Reference](#-intent-cli-reference)
- [📚 Core Philosophy](#-core-philosophy)
- [🎯 Experimental Goals](#-experimental-goals)
- [🔧 Prerequisites](#-prerequisites)
- [📖 Learn More](#-learn-more)

## 🤔 What is Intent-Driven Development?

Intent-Driven Development **flips the script** on traditional software development. For decades, implementation has been king — user intents were just scaffolding we built and discarded once the "real work" of coding began. Intent-Driven Development changes this: **user intents become executable**, directly generating working implementations rather than just guiding them.

The gap between user intent and implementation has plagued software development since its inception. Intent-Driven Development eliminates this gap by making user intents and their concrete implementation plans executable. When user intents and implementation plans generate code, there is no gap—only transformation.

## ⚡ Get Started

### 1. Install Intent CLI

Choose your preferred installation method:

#### Option 1: Persistent Installation (Recommended)

Install once and use everywhere:

```bash
uv tool install intent-kit --from git+https://github.com/nom-nom-hub/intent-kit.git
```

Then use the tool directly:

```bash
intent init <PROJECT_NAME>
intent check
```

To upgrade intent run:

```bash
uv tool install intent-kit --force --from git+https://github.com/nom-nom-hub/intent-kit.git
```

#### Option 2: One-time Usage

Run directly without installing:

```bash
uvx --from git+https://github.com/nom-nom-hub/intent-kit.git intent init <PROJECT_NAME>
```

**Benefits of persistent installation:**

- Tool stays installed and available in PATH
- No need to create shell aliases
- Better tool management with `uv tool list`, `uv tool upgrade`, `uv tool uninstall`
- Cleaner shell configuration

### 2. Establish project vision

Launch your AI assistant in the project directory. The `/intentk.*` commands are available in the assistant.

Use the **`/intentk.vision`** command to create your project's foundational vision and guiding principles.

```bash
/intentk.vision Create vision focused on user outcomes, success metrics, adaptive execution, and alignment with original intent
```

### 3. Define measurable goals

Use the **`/intentk.goal`** command to define clear, measurable goals that align with your vision.

```bash
/intentk.goal Define measurable goals for user engagement, system performance, and business impact with specific success metrics
```

### 4. Explore implementation strategies

Use the **`/intentk.strategies`** command to explore multiple approaches to achieve your goals.

```bash
/intentk.strategies Explore implementation strategies that align with our technology stack, performance requirements, and user needs
```

### 5. Create milestones

Use **`/intentk.milestones`** to break your strategy into measurable checkpoints.

```bash
/intentk.milestones
```

### 6. Execute with learning loops

Use **`/intentk.execute`** to execute your plan with built-in adaptation mechanisms.

```bash
/intentk.execute
```

## 🤖 Supported AI Agents

| Agent                                                     | Support | Notes                                             |
|-----------------------------------------------------------|---------|---------------------------------------------------|
| [Claude Code](https://www.anthropic.com/claude-code)      | ✅ |                                                   |
| [GitHub Copilot](https://code.visualstudio.com/)          | ✅ |                                                   |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | ✅ |                                                   |
| [Cursor](https://cursor.sh/)                              | ✅ |                                                   |
| [Qwen Code](https://github.com/QwenLM/qwen-code)          | ✅ |                                                   |
| [opencode](https://opencode.ai/)                          | ✅ |                                                   |
| [Windsurf](https://windsurf.com/)                         | ✅ |                                                   |
| [Kilo Code](https://github.com/Kilo-Org/kilocode)         | ✅ |                                                   |
| [Auggie CLI](https://docs.augmentcode.com/cli/overview)   | ✅ |                                                   |
| [CodeBuddy CLI](https://www.codebuddy.ai/cli)             | ✅ |                                                   |
| [Roo Code](https://roocode.com/)                          | ✅ |                                                   |
| [Codex CLI](https://github.com/openai/codex)              | ✅ |                                                   |
| [Amazon Q Developer CLI](https://aws.amazon.com/developer/learning/q-developer-cli/) | ⚠️ | Amazon Q Developer CLI [does not support](https://github.com/aws/amazon-q-developer-cli/issues/3064) custom arguments for slash commands. |

## 🔧 Intent CLI Reference

The `intent` command supports the following options:

### Commands

| Command     | Description                                                    |
|-------------|----------------------------------------------------------------|
| `init`      | Initialize a new Intent project from the latest template      |
| `check`     | Check for installed tools (`git`, `claude`, `gemini`, `code`/`code-insiders`, `cursor-agent`, `windsurf`, `qwen`, `opencode`, `codex`, `auggie`, `roo`, `codebuddy`, `q`) |

### `intent init` Arguments & Options

| Argument/Option        | Type     | Description                                                                  |
|------------------------|----------|------------------------------------------------------------------------------|
| `<project-name>`       | Argument | Name for your new project directory (optional if using `--here`, or use `.` for current directory) |
| `--ai`                 | Option   | AI assistant to use: `claude`, `gemini`, `copilot`, `cursor-agent`, `qwen`, `opencode`, `codex`, `windsurf`, `kilocode`, `auggie`, `roo`, `codebuddy`, or `q` |
| `--script`             | Option   | Script variant to use: `sh` (bash/zsh) or `ps` (PowerShell)                 |
| `--ignore-agent-tools` | Flag     | Skip checks for AI agent tools like Claude Code                             |
| `--no-git`             | Flag     | Skip git repository initialization                                          |
| `--here`               | Flag     | Initialize project in the current directory instead of creating a new one   |
| `--force`              | Flag     | Force merge/overwrite when initializing in current directory (skip confirmation) |
| `--skip-tls`           | Flag     | Skip SSL/TLS verification (not recommended)                                 |
| `--debug`              | Flag     | Enable detailed debug output for troubleshooting                            |
| `--github-token`       | Option   | GitHub token for API requests (or set GH_TOKEN/GITHUB_TOKEN env variable)  |

### Examples

```bash
# Basic project initialization
intent init my-project

# Initialize with specific AI assistant
intent init my-project --ai claude

# Initialize with Cursor support
intent init my-project --ai cursor-agent

# Initialize with Windsurf support
intent init my-project --ai windsurf

# Initialize with PowerShell scripts (Windows/cross-platform)
intent init my-project --ai copilot --script ps

# Initialize in current directory
intent init . --ai copilot
# or use the --here flag
intent init --here --ai copilot

# Force merge into current (non-empty) directory without confirmation
intent init . --force --ai copilot
# or 
intent init --here --force --ai copilot

# Skip git initialization
intent init my-project --ai gemini --no-git

# Enable debug output for troubleshooting
intent init my-project --ai claude --debug

# Use GitHub token for API requests (helpful for corporate environments)
intent init my-project --ai claude --github-token ghp_your_token_here

# Check system requirements
intent check
```

### Available Slash Commands

After running `intent init`, your AI coding agent will have access to these slash commands for structured development:

#### Core Commands

Essential commands for the Intent-Driven Development workflow:

| Command                  | Description                                                           |
|--------------------------|-----------------------------------------------------------------------|
| `/intentk.vision`        | Create or update project vision and guiding principles                |
| `/intentk.goal`          | Define measurable goals with specific success metrics                 |
| `/intentk.strategies`    | Explore multiple implementation strategies and approaches             |
| `/intentk.milestones`    | Create measurable progress checkpoints with success criteria          |
| `/intentk.execute`       | Execute with learning loops and adaptation mechanisms                 |

#### Optional Commands

Additional commands for enhanced quality and validation:

| Command              | Description                                                           |
|----------------------|-----------------------------------------------------------------------|
| `/intentk.clarify`   | Clarify underspecified areas (recommended before `/intentk.goal`)     |
| `/intentk.analyze`   | Intent alignment & risk assessment (run after `/intentk.goal`, before `/intentk.strategies`) |
| `/intentk.checklist` | Generate custom quality checklists that validate intent clarity and strategy feasibility |

### Environment Variables

| Variable         | Description                                                                                    |
|------------------|------------------------------------------------------------------------------------------------|
| `INTENT_FEATURE` | Override feature detection for non-Git repositories. Set to the feature directory name (e.g., `001-user-auth`) to work on a specific feature when not using Git branches.<br/>**Must be set in the context of the agent you're working with prior to using `/intentk.goal` or follow-up commands. |

## 📚 Core Philosophy

Intent-Driven Development is a structured process that emphasizes:

- **Intent-driven development** where user intents define the "what" before the "how"
- **Outcome-focused specifications** using guardrails and organizational principles
- **Multi-step refinement** rather than one-shot code generation from prompts
- **Heavy reliance** on advanced AI model capabilities for intent interpretation
- **Adaptive execution** based on evidence and learning

## 🎯 Experimental Goals

Our research and experimentation focus on:

### Technology independence

- Create applications using diverse technology stacks
- Validate the hypothesis that Intent-Driven Development is a process not tied to specific technologies, programming languages, or frameworks

### User-centric development

- Build applications for different user cohorts and preferences
- Support various development approaches (from intent-focused to AI-native development)
- Ensure user outcomes remain the primary driver of development decisions

### Adaptive processes

- Demonstrate iterative feature development with built-in learning loops
- Enable adaptation based on evidence and changing requirements
- Support parallel exploration of different outcome achievement strategies

### Measurable outcomes

- Focus on quantifiable success metrics
- Validate that implementations achieve the originally intended user outcomes
- Create feedback loops to improve outcome achievement over time

## 🔧 Prerequisites

- **Linux/macOS/Windows**
- [Supported](#-supported-ai-agents) AI coding agent.
- [uv](https://docs.astral.sh/uv/) for package management
- [Python 3.11+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)

If you encounter issues with an agent, please open an issue so we can refine the integration.

## 📖 Learn More

- **[Complete Intent-Driven Development Methodology](./intent-driven.md)** - Deep dive into the full process
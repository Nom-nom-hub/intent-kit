# Quick Start Guide

This guide will help you get started with the Intent Kit CLI and begin using Intent-Driven Development methodology.

## Prerequisites

- Python 3.11 or higher
- Git installed on your system
- An AI coding assistant (optional but recommended)

## Installation

To install the Intent Kit CLI globally, run:

```bash
uv tool install intent-kit
```

Or if you prefer to run directly without installation:

```bash
uvx intent-kit
```

## Creating Your First Intent-Driven Project

1. Create a new project directory:

```bash
intent init my-project
```

2. The CLI will prompt you to select an AI assistant. If you don't have one installed, you can use `--ignore-agent-tools`.

3. Navigate to your new project:

```bash
cd my-project
```

## Step-by-Step Process

### 1. Define Your Vision

Start by defining your project's vision:

```bash
/intentk.vision
```

This command will help you create a comprehensive vision document that captures the core purpose, desired outcomes, and guiding principles.

### 2. Set Measurable Goals

Define clear, measurable goals based on your vision:

```bash
/intentk.goal
```

This will create goals with specific success criteria and validation approaches.

### 3. Explore Strategies

Explore multiple implementation strategies:

```bash
/intentk.strategies
```

This will generate and compare different approaches to achieve your goals.

### 4. Create Milestones

Break your strategy into measurable milestones:

```bash
/intentk.milestones
```

This creates checkpoints with specific success criteria and timelines.

### 5. Execute with Learning Loops

Begin implementation with built-in feedback mechanisms:

```bash
/intentk.execute
```

This guides execution while maintaining alignment with your original intent.

## Additional Commands

- `/intentk.clarify` - Clarify requirements and intent
- `/intentk.analyze` - Analyze intent alignment and risks
- `/intentk.checklist` - Generate quality checklists
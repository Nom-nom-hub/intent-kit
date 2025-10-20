# Command Reference

This document provides a complete reference for all Intent Kit CLI commands.

## Main Commands

### intent init
Initializes a new Intent-Driven Development project from templates.

```bash
intent init <project-name>
intent init .                # Initialize in current directory
intent init --here           # Alternative syntax for current directory
intent init --ai claude      # Specify AI assistant
intent init --ignore-agent-tools  # Skip AI tool checks
```

### intent check
Checks that all required tools are installed.

```bash
intent check
```

## AI Agent Commands

These commands are designed to work with AI coding assistants through slash commands.

### /intentk.vision
Transforms a simple user intent into a complete, structured vision with automatic repository management.

- **Purpose**: Create foundational vision documents
- **Output**: vision.md in visions/[id]-[name]/ directory
- **Follows**: vision-template.md structure

### /intentk.goal
Creates a comprehensive goal definition based on an established vision.

- **Purpose**: Define measurable goals with validation approaches
- **Output**: goal.md, research.md, validation.md in vision directory
- **Follows**: goal-template.md structure

### /intentk.strategies
Analyzes goals to generate multiple implementation strategies.

- **Purpose**: Explore multiple approaches to achieve goals
- **Output**: strategies.md, milestones.md, execution.md in vision directory
- **Follows**: strategy-template.md structure

### /intentk.milestones
Creates measurable progress checkpoints after strategies are defined.

- **Purpose**: Break strategy into measurable phases
- **Output**: plan.md, execute.md, milestones.md in vision directory
- **Follows**: milestone-template.md structure

### /intentk.execute
Guides implementation with learning loops and adaptation mechanisms.

- **Purpose**: Execute with built-in feedback and adaptation
- **Output**: execute.md, tasks.md, implementation.md in vision directory
- **Follows**: execute-template.md structure

## Enhancement Commands

### /intentk.clarify
Asks structured questions to understand the true intent before planning.

- **Purpose**: Clarify ambiguous requirements
- **Output**: clarify.md with specific questions
- **Follows**: constitutional principles for clarity

### /intentk.analyze
Performs intent alignment and risk assessment.

- **Purpose**: Validate alignment and identify risks
- **Output**: analysis.md with comprehensive review
- **Follows**: constitutional compliance checking

### /intentk.checklist
Generates quality checklists to validate intent clarity and strategy feasibility.

- **Purpose**: Validate document quality
- **Output**: checklist files with validation items
- **Follows**: constitutional compliance validation
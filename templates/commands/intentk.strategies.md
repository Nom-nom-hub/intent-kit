---
description: Create or update the strategy exploration document from a goal document, with validation and evidence focus.
scripts:
  sh: scripts/bash/create-new-strategy.sh --json "{ARGS}"
  ps: scripts/powershell/create-new-strategy.ps1 -Json "{ARGS}"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

The text the user typed after `/intentk.strategies` in the triggering message **is** the strategy exploration context or reference to goal. Assume you always have it available in this conversation even if `{ARGS}` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

Given that strategy context, do this:

1. **Load the goal document**:
   - If user provided goal name/ID, locate `visions/[goal-id]/goal.md`
   - If user provided strategy summary or description, search for matching goal
   - If user provided empty input, look for the most recent uncompleted goal in current context
   - Load the full goal content to understand objectives and validation needs
   - Also load related research.md and validation.md if they exist

2. Run the script `{SCRIPT}` from repo root **with the goal identifier as argument** and parse its JSON output for BRANCH_NAME, STRATEGY_FILE and related paths. All file paths must be absolute.

   **IMPORTANT**:
   
   - Append the goal identifier as argument to the `{SCRIPT}` command
   - Bash: `--goal-id "[goal-identifier]"`
   - PowerShell: `-GoalId "[goal-identifier]"`
   - You must only ever run this script once
   - The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for

3. Load `templates/strategy-template.md` to understand required sections.

4. Follow this execution flow:

    1. Parse strategy context from Input and goal document
       If no goal found: ERROR "Cannot find relevant goal document"
    2. Extract strategy concepts from goal
       Identify: objectives, success criteria, validation needs, constraints, resources
    3. Generate 3-4 different strategies that could achieve the goals:
       - Start with fundamentally different approaches (e.g., process vs. technology, central vs. distributed)
       - Ensure each strategy addresses all goal objectives
       - Consider different resource utilization approaches
       - Include at least one innovative approach and one conventional approach
    4. For each strategy:
       - Define specific approach to achieve goals
       - Identify validation methods that align with goal validation requirements
       - List advantages and disadvantages
       - Estimate required effort and resources
       - Assess risk level for goal achievement
       - Map to goal objectives to show alignment
    5. Create comparison matrix evaluating strategies against key criteria
    6. Perform deep analysis of top 2 strategies
    7. Recommend optimal strategy with detailed rationale
    8. Define implementation phases aligned with goal objectives
    9. Return: SUCCESS (strategies ready for milestone planning)

5. Write the strategies to STRATEGY_FILE using the template structure, replacing placeholders with concrete strategy details derived from the goal and strategy context while preserving section order and headings.

6. **Strategy Quality Validation**: After writing the initial strategies, validate them against quality criteria:

   a. **Create Strategy Quality Checklist**: Generate a checklist file at `STRATEGY_DIR/checklists/approaches.md` using the checklist template structure with these validation items:
   
      ```markdown
      # Strategy Quality Checklist: [STRATEGY NAME]
      
      **Purpose**: Validate strategy completeness and quality before proceeding to milestone planning
      **Created**: [DATE]
      **Strategy**: [Link to strategies.md]
      **Goal**: [Link to related goal.md]
      
      ## Content Quality
      
      - [ ] Each strategy addresses all goal objectives
      - [ ] Strategies are meaningfully different from each other
      - [ ] Validation methods align with goal validation requirements
      - [ ] All mandatory sections completed
      
      ## Strategy Quality
      
      - [ ] Each strategy has clear approach definition
      - [ ] Advantages and disadvantages are specific and relevant
      - [ ] Resource and effort estimates are realistic
      - [ ] Risk assessments are specific and actionable
      - [ ] Alignment with goals is clearly mapped
      - [ ] Evidence collection approaches are defined
      
      ## Comparison Quality
      
      - [ ] Comparison matrix is comprehensive and fair
      - [ ] Deep analysis highlights key differences
      - [ ] Recommended strategy rationale is compelling
      - [ ] Implementation phases align with goal objectives
      
      ## Notes
      
      - Items marked incomplete require strategy updates before `/intentk.milestones` or `/intentk.analyze`
      ```
   
   b. **Run Validation Check**: Review the strategies against each checklist item:
      - For each item, determine if it passes or fails
      - Document specific issues found (quote relevant strategy sections)
   
   c. **Handle Validation Results**:
   
      - **If all items pass**: Mark checklist complete and proceed to step 6
   
      - **If items fail**:
        1. List the failing items and specific issues
        2. Update the strategies to address each issue
        3. Re-run validation until all items pass (max 3 iterations)
        4. If still failing after 3 iterations, document remaining issues in checklist notes and warn user
   
   d. **Update Checklist**: After each validation iteration, update the checklist file with current pass/fail status

7. Generate milestone and execution planning documents:
   - Create MILESTONE_FILE outlining how to break strategy into measurable milestones
   - Create EXECUTION_FILE with initial execution planning
   
8. Report completion with strategy file path, checklist results, milestone file, execution file, and readiness for the next phase (`/intentk.milestones` or `/intentk.execute`).

**NOTE:** The script creates the strategy file and related documents based on the goal context before writing.

## General Guidelines

## Quick Guidelines

- Focus on **HOW** different approaches could achieve goals.
- Ensure each strategy is meaningfully different from others.
- Align validation methods with goal requirements.
- Written for stakeholders to understand approach trade-offs.
- DO NOT create any checklists that are embedded in the strategies. That will be a separate command.

### Section Requirements

- **Mandatory sections**: Must be completed for every strategy document
- **Strategy diversity**: Each strategy should take a different approach
- **Goal alignment**: Every strategy must address all goal objectives
- **Validation focus**: Each strategy must include validation method alignment

### For AI Generation

When creating strategies from goals:

1. **Create diverse approaches**: Don't just vary implementation details; consider fundamentally different approaches
2. **Maintain goal focus**: Ensure every strategy addresses all goal objectives
3. **Be specific about validation**: Each strategy should explain how it validates goal achievement
4. **Provide realistic estimates**: Base effort, resources, and risk assessments on comparable projects
5. **Consider evidence collection**: Each strategy should explain how evidence will be gathered to validate success
6. **Think about adaptation**: Consider how each strategy could be adapted based on evidence
7. **Align with constraints**: Ensure strategies work within resource, timeline, and technical constraints

**Examples of strategy approaches**:

- "Process improvement approach: Optimize existing workflows to achieve goals"
- "Technology validation approach: Implement validation system to measure and improve outcomes"
- "Organizational approach: Change team structures and roles to better achieve goals"
- "Hybrid approach: Combine process and technology changes for maximum impact"
---
description: Create or update the implementation plan from a strategy document, with milestone and execution focus.
scripts:
  sh: scripts/bash/create-new-milestone.sh --json "{ARGS}"
  ps: scripts/powershell/create-new-milestone.ps1 -Json "{ARGS}"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

The text the user typed after `/intentk.milestones` in the triggering message **is** the milestone planning context or reference to strategy. Assume you always have it available in this conversation even if `{ARGS}` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

Given that milestone context, do this:

1. **Load the strategy document**:
   - If user provided strategy name/ID, locate `visions/[strategy-id]/strategy.md`
   - If user provided milestone planning summary or description, search for matching strategy
   - If user provided empty input, look for the most recent strategy document in current context
   - Load the full strategy content to understand the chosen approach and validation methods
   - Also load related goal.md if it exists

2. Run the script `{SCRIPT}` from repo root **with the strategy identifier as argument** and parse its JSON output for BRANCH_NAME, PLAN_FILE and related paths. All file paths must be absolute.

   **IMPORTANT**:
   
   - Append the strategy identifier as argument to the `{SCRIPT}` command
   - Bash: `--strategy-id "[strategy-identifier]"`
   - PowerShell: `-StrategyId "[strategy-identifier]"`
   - You must only ever run this script once
   - The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for

3. Load `templates/milestone-template.md` to understand required sections.

4. Follow this execution flow:

    1. Parse milestone context from Input and strategy document
       If no strategy found: ERROR "Cannot find relevant strategy document"
    2. Extract milestone concepts from strategy
       Identify: recommended approach, validation methods, implementation steps, resources, risks
    3. Break the chosen strategy into 3-5 meaningful milestones:
       - Start with the overall strategy outcome as the final milestone
       - Work backwards to identify prerequisite capabilities/components
       - Ensure each milestone delivers measurable value
       - Align milestones with goal objectives from the goal document
       - Consider dependencies and parallelization opportunities
    4. For each milestone:
       - Define specific objective that contributes to strategy success
       - Specify success criteria that align with goal measurements
       - List deliverables that demonstrate milestone completion
       - Define timeline based on effort estimates from strategy
       - Identify required resources
       - Document dependencies on other milestones or external factors
       - Define validation approach that aligns with strategy validation methods
    5. Create milestone dependencies and critical path visualization
    6. Allocate resources across milestones
    7. Assess milestone-specific and cross-milestone risks
    8. Define progress tracking and review cadence for milestones
    9. Return: SUCCESS (milestones ready for execution planning)

5. Write the plan to PLAN_FILE using the template structure, replacing placeholders with concrete milestone details derived from the strategy and milestone context while preserving section order and headings.

6. **Milestone Quality Validation**: After writing the initial plan, validate it against quality criteria:

   a. **Create Milestone Quality Checklist**: Generate a checklist file at `PLAN_DIR/checklists/tracking.md` using the checklist template structure with these validation items:
   
      ```markdown
      # Milestone Quality Checklist: [MILESTONE NAME]
      
      **Purpose**: Validate milestone completeness and quality before proceeding to execution
      **Created**: [DATE]
      **Plan**: [Link to plan.md]
      **Strategy**: [Link to related strategy.md]
      **Goal**: [Link to related goal.md]
      
      ## Content Quality
      
      - [ ] All milestones contribute to strategy success
      - [ ] Milestones break strategy into manageable phases
      - [ ] Success criteria align with goal measurements
      - [ ] All mandatory sections completed
      
      ## Milestone Quality
      
      - [ ] Each milestone has specific, measurable objective
      - [ ] Success criteria are quantified and trackable
      - [ ] Deliverables are tangible and verifiable
      - [ ] Timelines are realistic given resource constraints
      - [ ] Dependencies are clearly identified
      - [ ] Validation approaches align with strategy methods
      - [ ] Milestones can be validated independently
      
      ## Planning Quality
      
      - [ ] Milestone dependencies are properly mapped
      - [ ] Critical path is identified and reasonable
      - [ ] Resource allocation is appropriate across milestones
      - [ ] Risk assessment covers milestone-specific and cross-milestone risks
      - [ ] Progress tracking methods are defined
      - [ ] Review cadence is appropriate for project timeline
      
      ## Notes
      
      - Items marked incomplete require plan updates before `/intentk.execute` or `/intentk.analyze`
      ```
   
   b. **Run Validation Check**: Review the plan against each checklist item:
      - For each item, determine if it passes or fails
      - Document specific issues found (quote relevant plan sections)
   
   c. **Handle Validation Results**:
   
      - **If all items pass**: Mark checklist complete and proceed to step 6
   
      - **If items fail**:
        1. List the failing items and specific issues
        2. Update the plan to address each issue
        3. Re-run validation until all items pass (max 3 iterations)
        4. If still failing after 3 iterations, document remaining issues in checklist notes and warn user
   
   d. **Update Checklist**: After each validation iteration, update the checklist file with current pass/fail status

7. Generate execution planning documents:
   - Create EXECUTE_FILE with detailed execution tasks and learning loops based on milestones
   - Create MILESTONE_FILE outlining milestone tracking and validation approach
   
8. Report completion with plan file path, checklist results, execute file, milestone tracking file, and readiness for the next phase (`/intentk.execute` or `/intentk.analyze`).

**NOTE:** The script creates the plan file and related documents based on the strategy context before writing.

## General Guidelines

## Quick Guidelines

- Focus on **WHAT** measurable phases and **HOW** to track progress.
- Ensure milestones break strategy into independently valuable increments.
- Align success criteria with goal measurements.
- Written for project managers to understand implementation progression.
- DO NOT create any checklists that are embedded in the plan. That will be a separate command.

### Section Requirements

- **Mandatory sections**: Must be completed for every plan document
- **Milestone alignment**: Each milestone should contribute to goal objectives
- **Validation focus**: Each milestone must define how it will be validated
- **Progress tracking**: Define clear methods to track milestone progress

### For AI Generation

When creating milestones from strategy:

1. **Break strategically**: Create milestones that build toward the overall strategy goal
2. **Ensure value delivery**: Each milestone should deliver measurable value, even if the overall strategy isn't complete
3. **Consider dependencies**: Identify which milestones must be completed before others can begin
4. **Think about validation**: How will each milestone's success be validated according to the strategy's validation methods
5. **Plan resources**: Allocate resources appropriately across milestones
6. **Identify risks**: Consider risks specific to each milestone and across milestones
7. **Enable parallel work**: Structure milestones to allow parallel work where possible
8. **Define success clearly**: Success criteria should be specific, measurable, and achievable

**Examples of milestone structures**:

- "Foundation milestone: Set up core system components"
- "Validation milestone: Implement validation methods for goal achievement"
- "Integration milestone: Connect system components and validate end-to-end"
- "Optimization milestone: Improve performance and user experience"
- "Monitoring milestone: Implement ongoing validation and adaptation systems"
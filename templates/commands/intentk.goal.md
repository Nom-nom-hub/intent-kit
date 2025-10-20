---
description: Create or update the goal definition from a vision document, with research and validation focus.
scripts:
  sh: scripts/bash/create-new-goal.sh --json "{ARGS}"
  ps: scripts/powershell/create-new-goal.ps1 -Json "{ARGS}"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

The text the user typed after `/intentk.goal` in the triggering message **is** the goal description or reference to vision. Assume you always have it available in this conversation even if `{ARGS}` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

Given that goal context, do this:

1. **Load the vision document**:
   - If user provided vision name/ID, locate `visions/[vision-id]/vision.md`
   - If user provided vision summary or description, search for matching vision
   - If user provided empty input, look for the most recent uncompleted vision in current branch
   - Load the full vision content to understand the context

2. Run the script `{SCRIPT}` from repo root **with the vision identifier as argument** and parse its JSON output for BRANCH_NAME, GOAL_FILE and related paths. All file paths must be absolute.

   **IMPORTANT**:
   
   - Append the vision identifier as argument to the `{SCRIPT}` command
   - Bash: `--vision-id "[vision-identifier]"`
   - PowerShell: `-VisionId "[vision-identifier]"`
   - You must only ever run this script once
   - The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for

3. Load `templates/goal-template.md` to understand required sections.

4. Follow this execution flow:

    1. Parse goal context from Input and vision document
       If no vision found: ERROR "Cannot find relevant vision document"
    2. Extract goal concepts from vision
       Identify: primary intents, success criteria, constraints, outcome areas
    3. For unclear aspects:
       - Make informed guesses based on vision content and industry standards
       - Only mark with [NEEDS CLARIFICATION: specific question] if:
         - The choice significantly impacts goal achievement or measurement
         - Multiple reasonable interpretations exist with different implications
         - Vision has ambiguous elements that affect goal definition
       - **LIMIT: Maximum 3 [NEEDS CLARIFICATION] markers total**
       - Prioritize clarifications by impact: success measurement > scope > timeline > details
    4. Fill Detailed Objectives section
       Create specific, measurable objectives aligned with vision intents
    5. Define Validation Approach
       Each objective must have clear validation method
       Use reasonable defaults for unspecified validation details
    6. Establish Success Thresholds
       Create minimum/target/aspirational levels for each objective
       Each threshold must be verifiable without implementation details
    7. Identify Dependencies, Resources, and Risks required for goals
    8. Return: SUCCESS (goals ready for strategy exploration)

5. Write the goals to GOAL_FILE using the template structure, replacing placeholders with concrete details derived from the vision and goal context while preserving section order and headings.

6. **Goal Quality Validation**: After writing the initial goals, validate them against quality criteria:

   a. **Create Goal Quality Checklist**: Generate a checklist file at `GOAL_DIR/checklists/objectives.md` using the checklist template structure with these validation items:
   
      ```markdown
      # Goal Quality Checklist: [GOAL NAME]
      
      **Purpose**: Validate goal completeness and quality before proceeding to strategy exploration
      **Created**: [DATE]
      **Goal**: [Link to goal.md]
      **Vision**: [Link to related vision.md]
      
      ## Content Quality
      
      - [ ] Goals are specific, measurable, achievable, relevant, and time-bound
      - [ ] No implementation details (languages, frameworks, tools)
      - [ ] Focused on outcome achievement and measurement
      - [ ] All mandatory sections completed
      
      ## Objective Quality
      
      - [ ] No [NEEDS CLARIFICATION] markers remain
      - [ ] Objectives are specific and measurable with clear metrics
      - [ ] Success criteria are quantified with targets and baselines
      - [ ] Validation approaches are defined and testable
      - [ ] Objectives map directly to vision intents
      - [ ] Success thresholds defined (minimum/target/aspirational)
      
      ## Alignment
      
      - [ ] All objectives support vision intents
      - [ ] Goals maintain alignment with original user intent
      - [ ] Dependencies and assumptions identified
      - [ ] Resources and timeline realistic for objectives
      
      ## Notes
      
      - Items marked incomplete require goal updates before `/intentk.strategies` or `/intentk.analyze`
      ```
   
   b. **Run Validation Check**: Review the goals against each checklist item:
      - For each item, determine if it passes or fails
      - Document specific issues found (quote relevant goal sections)
   
   c. **Handle Validation Results**:
   
      - **If all items pass**: Mark checklist complete and proceed to step 6
   
      - **If items fail (excluding [NEEDS CLARIFICATION])**:
        1. List the failing items and specific issues
        2. Update the goals to address each issue
        3. Re-run validation until all items pass (max 3 iterations)
        4. If still failing after 3 iterations, document remaining issues in checklist notes and warn user
   
      - **If [NEEDS CLARIFICATION] markers remain**:
        1. Extract all [NEEDS CLARIFICATION: ...] markers from the goals
        2. **LIMIT CHECK**: If more than 3 markers exist, keep only the 3 most critical (by success measurement/scope/timeline impact) and make informed guesses for the rest
        3. For each clarification needed (max 3), present options to user in this format:
        
           ```markdown
           ## Question [N]: [Topic]
           
           **Context**: [Quote relevant goal section]
           
           **What we need to know**: [Specific question from NEEDS CLARIFICATION marker]
           
           **Suggested Answers**:
           
           | Option | Answer | Implications |
           |--------|--------|--------------|
           | A      | [First suggested answer] | [What this means for the goal achievement] |
           | B      | [Second suggested answer] | [What this means for the goal achievement] |
           | C      | [Third suggested answer] | [What this means for the goal achievement] |
           | Custom | Provide your own answer | [Explain how to provide custom input] |
           
           **Your choice**: _[Wait for user response]_
           ```
        
        4. **CRITICAL - Table Formatting**: Ensure markdown tables are properly formatted:
           - Use consistent spacing with pipes aligned
           - Each cell should have spaces around content: `| Content |` not `|Content|`
           - Header separator must have at least 3 dashes: `|--------|`
           - Test that the table renders correctly in markdown preview
        5. Number questions sequentially (Q1, Q2, Q3 - max 3 total)
        6. Present all questions together before waiting for responses
        7. Wait for user to respond with their choices for all questions (e.g., "Q1: A, Q2: Custom - [details], Q3: B")
        8. Update the goals by replacing each [NEEDS CLARIFICATION] marker with the user's selected or provided answer
        9. Re-run validation after all clarifications are resolved
   
   d. **Update Checklist**: After each validation iteration, update the checklist file with current pass/fail status

7. Generate research and validation documents:
   - Create RESEARCH_FILE analyzing different approaches to achieve goals
   - Create VALIDATION_FILE outlining how each objective will be validated
   
8. Report completion with goal file path, checklist results, research file, validation file, and readiness for the next phase (`/intentk.strategies` or `/intentk.analyze`).

**NOTE:** The script creates the goal file and related documents based on the vision context before writing.

## General Guidelines

## Quick Guidelines

- Focus on **WHAT** specific objectives and **HOW** to measure achievement.
- Avoid implementation HOW (no tech stack, methods, system structure).
- Written for stakeholders to understand goal achievement and measurement.
- DO NOT create any checklists that are embedded in the goals. That will be a separate command.

### Section Requirements

- **Mandatory sections**: Must be completed for every goal document
- **Objective mapping**: Each goal objective should map to a vision intent
- **Validation focus**: Emphasize how achievement will be measured and validated

### For AI Generation

When creating goals from a vision:

1. **Make specific and measurable**: Convert vision intents into specific, quantifiable objectives
2. **Use vision as foundation**: Ensure all goals directly support vision intents
3. **Set realistic targets**: Use industry benchmarks or reasonable estimates for targets
4. **Think about validation**: For each objective, define how it will be validated/confirmed
5. **Consider timeline and resources**: Set achievable timelines and acknowledge resource needs
6. **Document assumptions**: Record any assumptions made when details were unclear

**Examples of good goal objectives**:

- "Increase user intent achievement rate from 60% to 85% by [date]"
- "Validate that new process reduces outcome gaps by 40% within 3 months"
- "Improve stakeholder confidence in goal achievement from 70% to 90% by [date]"

**Examples of validation approaches**:

- "Automated tracking of outcome achievement rates"
- "Monthly stakeholder surveys measuring confidence levels"
- "Quarterly business impact assessments"
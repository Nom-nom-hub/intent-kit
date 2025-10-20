---
description: Create or update the execution plan from a milestone document, with learning loops and adaptation focus.
scripts:
  sh: scripts/bash/create-new-execute.sh --json "{ARGS}"
  ps: scripts/powershell/create-new-execute.ps1 -Json "{ARGS}"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

The text the user typed after `/intentk.execute` in the triggering message **is** the execution context or reference to milestone plan. Assume you always have it available in this conversation even if `{ARGS}` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

Given that execution context, do this:

1. **Load the milestone plan document**:
   - If user provided plan name/ID, locate `visions/[plan-id]/plan.md`
   - If user provided execution summary or description, search for matching milestone plan
   - If user provided empty input, look for the most recent plan document in current context
   - Load the full plan content to understand milestones and success criteria
   - Also load related strategy.md and goal.md if they exist

2. Run the script `{SCRIPT}` from repo root **with the plan identifier as argument** and parse its JSON output for BRANCH_NAME, EXECUTE_FILE and related paths. All file paths must be absolute.

   **IMPORTANT**:
   
   - Append the plan identifier as argument to the `{SCRIPT}` command
   - Bash: `--plan-id "[plan-identifier]"`
   - PowerShell: `-PlanId "[plan-identifier]"`
   - You must only ever run this script once
   - The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for

3. Load `templates/execute-template.md` to understand required sections (which follows the same pattern as the tasks template in Spec Kit).

4. Follow this execution flow:

    1. Parse execution context from Input and plan document
       If no plan found: ERROR "Cannot find relevant milestone plan document"
    2. Extract execution concepts from plan
       Identify: milestones, success criteria, validation approaches, dependencies, resources, risks
    3. Create foundational setup phase:
       - Project initialization and basic structure setup 
       - Environment configuration
       - Tool and dependency setup
    4. Create milestone implementation phases:
       - For each milestone in priority order (P1, P2, P3, etc.)
       - Break milestone objectives into specific, actionable tasks
       - Organize tasks by milestone (e.g., [M1], [M2], [M3])
       - Mark tasks [P] that can run in parallel (different files, no dependencies)
       - Ensure tasks align with milestone success criteria from the plan
    5. Define execution dependencies and order:
       - Setup phase must complete before implementation phases
       - Foundational tasks block all milestone work
       - Milestone dependencies from plan must be respected
    6. Set up learning loops and adaptation mechanisms:
       - Define feedback mechanisms to gather evidence during execution
       - Establish measurement points to track progress against goals
       - Create adaptation triggers for when evidence suggests approach changes
       - Define adaptation process for modifying approach based on evidence
    7. Define quality assurance and validation approaches:
       - How each milestone will be validated against its success criteria
       - Quality standards that must be maintained
       - Validation methods that align with strategy requirements
    8. Return: SUCCESS (execution plan ready for implementation)

5. Write the execution plan to EXECUTE_FILE using the template structure, replacing placeholders with concrete execution details derived from the plan and execution context while preserving section order and headings.

6. **Execution Quality Validation**: After writing the initial execution plan, validate it against quality criteria:

   a. **Create Execution Quality Checklist**: Generate a checklist file at `EXECUTE_DIR/checklists/implementation.md` using the checklist template structure with these validation items:
   
      ```markdown
      # Execution Quality Checklist: [EXECUTION NAME]
      
      **Purpose**: Validate execution completeness and quality before proceeding to implementation
      **Created**: [DATE]
      **Execute**: [Link to execute.md]
      **Plan**: [Link to related plan.md]
      **Strategy**: [Link to related strategy.md]
      **Goal**: [Link to related goal.md]
      
      ## Content Quality
      
      - [ ] All milestones from plan are represented as execution phases
      - [ ] Tasks are specific and actionable
      - [ ] Parallel opportunities [P] are appropriately marked
      - [ ] All mandatory sections completed
      
      ## Task Quality
      
      - [ ] Each task maps to specific milestone objective
      - [ ] Tasks are organized by milestone [M1], [M2], [M3], etc.
      - [ ] Parallel tasks [P] truly have no dependencies
      - [ ] Task dependencies align with milestone dependencies
      - [ ] Success criteria for each milestone are addressed by tasks
      
      ## Execution Planning
      
      - [ ] Setup phase includes all necessary initialization
      - [ ] Foundational phase blocks all milestone work appropriately
      - [ ] Execution phases can proceed in parallel where appropriate
      - [ ] Dependencies and execution order are clearly defined
      
      ## Learning & Adaptation
      
      - [ ] Feedback mechanisms are defined for evidence collection
      - [ ] Measurement points align with goal success criteria
      - [ ] Adaptation triggers are specific and measurable
      - [ ] Adaptation process is clearly defined
      
      ## Validation & Quality
      
      - [ ] Validation approaches align with strategy requirements
      - [ ] Quality standards are defined and enforceable
      - [ ] Validation methods can confirm milestone success
      - [ ] Quality measures maintain alignment with original intent
      
      ## Notes
      
      - Items marked incomplete require execute updates before implementation begins
      ```
   
   b. **Run Validation Check**: Review the execution plan against each checklist item:
      - For each item, determine if it passes or fails
      - Document specific issues found (quote relevant execute sections)
   
   c. **Handle Validation Results**:
   
      - **If all items pass**: Mark checklist complete and proceed to step 6
   
      - **If items fail**:
        1. List the failing items and specific issues
        2. Update the execution plan to address each issue
        3. Re-run validation until all items pass (max 3 iterations)
        4. If still failing after 3 iterations, document remaining issues in checklist notes and warn user
   
   d. **Update Checklist**: After each validation iteration, update the checklist file with current pass/fail status

7. Generate additional implementation documents:
   - Create TASKS_FILE with detailed task breakdown if not already included in execute.md
   - Create IMPLEMENTATION_FILE with additional implementation guidance
   
8. Report completion with execute file path, checklist results, tasks file, implementation file, and readiness for implementation.

**NOTE:** The script creates the execute file and related documents based on the milestone plan context before writing.

## General Guidelines

## Quick Guidelines

- Focus on **HOW** to execute the plan with specific tasks and learning loops.
- Organize tasks by milestone [M1], [M2], [M3] for traceability.
- Mark parallel tasks [P] where appropriate.
- Written for implementation teams to understand execution steps.
- DO NOT create any checklists that are embedded in the execution. That will be a separate command.

### Section Requirements

- **Mandatory sections**: Must be completed for every execute document
- **Milestone mapping**: Each task should map to a specific milestone objective
- **Parallel execution**: Mark tasks [P] that can run simultaneously
- **Learning focus**: Include feedback and adaptation mechanisms throughout

### For AI Generation

When creating execution plans from milestone plans:

1. **Be specific about tasks**: Each task should be actionable and assigned to specific milestone [M1], [M2], etc.
2. **Enable parallel work**: Identify where tasks can run simultaneously (mark with [P])
3. **Maintain traceability**: Each task should connect back to a milestone objective
4. **Think about dependencies**: Respect milestone dependencies in execution order
5. **Plan for learning**: Include evidence collection and adaptation mechanisms throughout
6. **Focus on validation**: Ensure execution includes validation of milestone success
7. **Preserve intent alignment**: Include mechanisms to maintain alignment with original user intent
8. **Consider quality**: Define quality standards and validation methods

**Examples of execution tasks**:

- "[M1] Set up validation framework in validation/[framework].py"
- "[P] [M2] Create user model in models/user.py"
- "[P] [M2] Create validation service in services/validation.py"
- "[M2] Integrate with milestone 1 components (depends on M1 completion)"
---
description: Create or update the vision document from a natural language intent description.
scripts:
  sh: scripts/bash/create-new-vision.sh --json "{ARGS}"
  ps: scripts/powershell/create-new-vision.ps1 -Json "{ARGS}"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

The text the user typed after `/intentk.vision` in the triggering message **is** the intent description. Assume you always have it available in this conversation even if `{ARGS}` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

Given that intent description, do this:

1. **Generate a concise short name** (2-4 words) for the branch:
   - Analyze the intent description and extract the most meaningful keywords
   - Create a 2-4 word short name that captures the essence of the intent
   - Use action-noun format when possible (e.g., "validate-outcome", "measure-impact")
   - Preserve technical terms and acronyms (KPI, ROI, UX, etc.)
   - Keep it concise but descriptive enough to understand the intent at a glance
   - Examples:
     - "I want to validate if our feature achieves intended outcomes" → "validate-feature-outcome"
     - "Measure the impact of recent changes on user engagement" → "measure-engagement-impact"
     - "Create a system to track if goals are being met" → "track-goal-achievement"

2. Run the script `{SCRIPT}` from repo root **with the short-name argument** and parse its JSON output for BRANCH_NAME and VISION_FILE. All file paths must be absolute.

   **IMPORTANT**:
   
   - Append the short-name argument to the `{SCRIPT}` command with the 2-4 word short name you created in step 1
   - Bash: `--short-name "your-generated-short-name"`
   - PowerShell: `-ShortName "your-generated-short-name"`
   - For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\\''m Groot' (or double-quote if possible: "I'm Groot")
   - You must only ever run this script once
   - The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for

3. Load `templates/vision-template.md` to understand required sections.

4. Follow this execution flow:

    1. Parse user description from Input
       If empty: ERROR "No intent description provided"
    2. Extract key concepts from description
       Identify: actors, outcomes, measures, constraints
    3. For unclear aspects:
       - Make informed guesses based on context and industry standards
       - Only mark with [NEEDS CLARIFICATION: specific question] if:
         - The choice significantly impacts intent scope or outcome measurement
         - Multiple reasonable interpretations exist with different implications
         - No reasonable default exists
       - **LIMIT: Maximum 3 [NEEDS CLARIFICATION] markers total**
       - Prioritize clarifications by impact: scope > outcomes > user experience > technical details
    4. Fill User Intent & Outcomes section
       If no clear outcome flow: ERROR "Cannot determine intended outcomes"
    5. Generate Functional Requirements
       Each requirement must be measurable
       Use reasonable defaults for unspecified details (document assumptions in Assumptions section)
    6. Define Success Criteria
       Create measurable, technology-agnostic outcomes
       Include both quantitative metrics (percentage, time, volume) and qualitative measures (outcome achievement, intent alignment)
       Each criterion must be verifiable without implementation details
    7. Identify Outcome Areas (if measurable outcomes involved)
    8. Return: SUCCESS (vision ready for goal definition)

5. Write the vision to VISION_FILE using the template structure, replacing placeholders with concrete details derived from the intent description (arguments) while preserving section order and headings.

6. **Vision Quality Validation**: After writing the initial vision, validate it against quality criteria:

   a. **Create Vision Quality Checklist**: Generate a checklist file at `VISION_DIR/checklists/intent.md` using the checklist template structure with these validation items:
   
      ```markdown
      # Vision Quality Checklist: [VISION NAME]
      
      **Purpose**: Validate vision completeness and quality before proceeding to goal definition
      **Created**: [DATE]
      **Vision**: [Link to vision.md]
      
      ## Content Quality
      
      - [ ] No implementation details (languages, frameworks, tools)
      - [ ] Focused on user intent and desired outcomes
      - [ ] Written for non-technical stakeholders
      - [ ] All mandatory sections completed
      
      ## Requirement Completeness
      
      - [ ] No [NEEDS CLARIFICATION] markers remain
      - [ ] Requirements are measurable and unambiguous
      - [ ] Success criteria are measurable
      - [ ] Success criteria are technology-agnostic (no implementation details)
      - [ ] All outcome scenarios are defined
      - [ ] Edge cases are identified
      - [ ] Scope is clearly bounded
      - [ ] Dependencies and assumptions identified
      
      ## Intent Readiness
      
      - [ ] All functional requirements have clear outcome criteria
      - [ ] User intents cover primary outcome flows
      - [ ] Vision meets measurable outcomes defined in Success Criteria
      - [ ] No implementation details leak into vision
      
      ## Notes
      
      - Items marked incomplete require vision updates before `/intentk.goal` or `/intentk.clarify`
      ```
   
   b. **Run Validation Check**: Review the vision against each checklist item:
      - For each item, determine if it passes or fails
      - Document specific issues found (quote relevant vision sections)
   
   c. **Handle Validation Results**:
   
      - **If all items pass**: Mark checklist complete and proceed to step 6
   
      - **If items fail (excluding [NEEDS CLARIFICATION])**:
        1. List the failing items and specific issues
        2. Update the vision to address each issue
        3. Re-run validation until all items pass (max 3 iterations)
        4. If still failing after 3 iterations, document remaining issues in checklist notes and warn user
   
      - **If [NEEDS CLARIFICATION] markers remain**:
        1. Extract all [NEEDS CLARIFICATION: ...] markers from the vision
        2. **LIMIT CHECK**: If more than 3 markers exist, keep only the 3 most critical (by scope/outcome/user impact) and make informed guesses for the rest
        3. For each clarification needed (max 3), present options to user in this format:
        
           ```markdown
           ## Question [N]: [Topic]
           
           **Context**: [Quote relevant vision section]
           
           **What we need to know**: [Specific question from NEEDS CLARIFICATION marker]
           
           **Suggested Answers**:
           
           | Option | Answer | Implications |
           |--------|--------|--------------|
           | A      | [First suggested answer] | [What this means for the vision] |
           | B      | [Second suggested answer] | [What this means for the vision] |
           | C      | [Third suggested answer] | [What this means for the vision] |
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
        8. Update the vision by replacing each [NEEDS CLARIFICATION] marker with the user's selected or provided answer
        9. Re-run validation after all clarifications are resolved
   
   d. **Update Checklist**: After each validation iteration, update the checklist file with current pass/fail status

7. Report completion with branch name, vision file path, checklist results, and readiness for the next phase (`/intentk.clarify` or `/intentk.goal`).

**NOTE:** The script creates and checks out the new branch and initializes the vision file before writing.

## General Guidelines

## Quick Guidelines

- Focus on **WHAT** user intents and **WHY** outcomes matter.
- Avoid HOW to implement (no tech stack, tools, system structure).
- Written for business stakeholders, not developers.
- DO NOT create any checklists that are embedded in the vision. That will be a separate command.

### Section Requirements

- **Mandatory sections**: Must be completed for every vision
- **Optional sections**: Include only when relevant to the vision
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation

When creating this vision from a user prompt:

1. **Make informed guesses**: Use context, industry standards, and common patterns to fill gaps
2. **Document assumptions**: Record reasonable defaults in the Assumptions section
3. **Limit clarifications**: Maximum 3 [NEEDS CLARIFICATION] markers - use only for critical decisions that:
   - Significantly impact vision scope or outcome measurement
   - Have multiple reasonable interpretations with different implications
   - Lack any reasonable default
4. **Prioritize clarifications**: scope > outcomes > user experience > technical details
5. **Think like a validator**: Every vague requirement should fail the "measurable and unambiguous" checklist item
6. **Common areas needing clarification** (only if no reasonable default exists):
   - Vision scope and boundaries (include/exclude specific outcome types)
   - Stakeholder types and validation needs (if multiple conflicting interpretations possible)
   - Success/compliance requirements (when legally/financially significant)
   
**Examples of reasonable defaults** (don't ask about these):

- Outcome tracking: Industry-standard practices for the domain
- Success targets: Standard achievement rates for the activity type
- Validation methods: User-friendly metrics with appropriate baselines
- Measurement approach: Standard industry KPIs for similar activities

### Success Criteria Guidelines

Success criteria must be:

1. **Measurable**: Include specific metrics (percentage, time, count, rate)
2. **Technology-agnostic**: No mention of frameworks, tools, databases, or specific implementations
3. **Intent-focused**: Describe outcomes from user/business perspective, not system internals
4. **Verifiable**: Can be validated/confirmed without knowing implementation details

**Good examples**:

- "Users achieve intended outcomes within specified timeframe"
- "System validates that goals are being met with 95% accuracy"
- "90% of outcome measurements complete within 24 hours"
- "Intent alignment improves by 40% as measured by stakeholder feedback"

**Bad examples** (implementation-focused):

- "API response time is under 200ms" (too technical, use "Validations complete quickly")
- "Database can handle 1000 validations per minute" (implementation detail, use user-facing metric)
- "React components display metrics efficiently" (framework-specific)
- "Redis cache hit rate above 80%" (technology-specific)
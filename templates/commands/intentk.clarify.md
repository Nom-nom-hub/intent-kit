---
description: Create structured questions to clarify intent ambiguities before proceeding with planning, following the constitutional principles of intent preservation and measurable outcomes.
scripts:
  sh: scripts/bash/create-clarify-questions.sh --json "{ARGS}"
  ps: scripts/powershell/create-clarify-questions.ps1 -Json "{ARGS}"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

The text the user typed after `/intentk.clarify` in the triggering message **is** the clarification request. Assume you always have it available in this conversation even if `{ARGS}` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

Given that clarification context, do this:

1. **Load relevant documents**:
   - If user referenced a specific document, load that document (vision, goal, strategy, etc.)
   - If user provided content directly, analyze that content
   - If user provided empty input, look for the most recent uncompleted document in current context
   - Apply constitutional principles (especially Article IV: Intent Preservation, Article V: Measurable Outcomes)

2. Run the script `{SCRIPT}` from repo root **with the document reference as argument** and parse its JSON output for CLARIFY_FILE and related paths. All file paths must be absolute.

   **IMPORTANT**:
   
   - Append the document reference as argument to the `{SCRIPT}` command
   - Bash: `--doc-ref "[document-reference]"`
   - PowerShell: `-DocRef "[document-reference]"`
   - You must only ever run this script once
   - The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for

3. Follow this clarification analysis flow:

    1. Parse clarification context from Input
       If empty: ERROR "No content provided for clarification"
    2. Apply constitutional analysis:
       - Article IV: Intent Preservation - Is the original user intent clear?
       - Article V: Measurable Outcomes - Are the success criteria measurable?
    3. Identify ambiguity classes (maximum 5 total):
       - **Scope Ambiguity**: Boundaries of what's included/excluded unclear
       - **Success Ambiguity**: How success is measured is unclear
       - **Implementation Ambiguity**: How to achieve intent has multiple interpretations
       - **Constraint Ambiguity**: Limitations or requirements not clearly specified
       - **Stakeholder Ambiguity**: Who has authority or needs to be involved not clear
    4. For each ambiguity identified:
       - Quote the specific unclear text
       - Explain why it creates risk for the project
       - Generate 2-3 specific questions to resolve the ambiguity
    5. Prioritize questions by impact on project success
    6. Return: SUCCESS (clarification questions ready for stakeholder input)

4. Write the clarification analysis to CLARIFY_FILE with this structure:

```
# Clarification Analysis: [CONTEXT]

## Constitutional Review

Based on constitutional principles (Article IV: Intent Preservation, Article V: Measurable Outcomes):

- **Intent Preservation Check**: [Analysis of whether original intent is clear]
- **Measurable Outcomes Check**: [Analysis of whether success criteria are measurable]

## Identified Ambiguities

### Ambiguity 1: [Class Name] (Priority: P1)

**Context**: [Quote the specific unclear text]

**Risk**: [Explain why this creates risk for the project]

**Questions**:
1. [Specific question 1 to resolve the ambiguity]
2. [Specific question 2 to resolve the ambiguity]

### Ambiguity 2: [Class Name] (Priority: P2)

**Context**: [Quote the specific unclear text]

**Risk**: [Explain why this creates risk for the project]

**Questions**:
1. [Specific question 1 to resolve the ambiguity]

### Ambiguity 3: [Class Name] (Priority: P3)

**Context**: [Quote the specific unclear text]

**Risk**: [Explain why this creates risk for the project]

**Questions**:
1. [Specific question 1 to resolve the ambiguity]

[Add more ambiguities as needed, maximum 5 total]

## Recommended Next Steps

1. [Action 1: Address highest priority ambiguity first]
2. [Action 2: Engage stakeholders for clarification]
3. [Action 3: Update relevant documents after receiving answers]
```

5. **Clarification Quality Validation**: After writing the analysis, validate it against quality criteria:

   a. **Create Clarification Quality Checklist**: Generate a checklist file at `CLARIFY_DIR/checklists/questions.md` with validation items:
   
      ```markdown
      # Clarification Quality Checklist: [CONTEXT]
      
      **Purpose**: Validate clarification analysis completeness and quality
      **Created**: [DATE]
      **Clarification**: [Link to clarify.md]
      
      ## Analysis Quality
      
      - [ ] All constitutional principles applied (Intent Preservation, Measurable Outcomes)
      - [ ] Ambiguity classes properly identified
      - [ ] Risks clearly explained for each ambiguity
      - [ ] Questions are specific and answerable
      - [ ] Maximum 5 ambiguities identified (to maintain focus)
      
      ## Question Quality
      
      - [ ] Questions directly address the identified ambiguity
      - [ ] Questions can be answered without creating new ambiguities
      - [ ] Questions prioritize project success impact
      - [ ] Questions are appropriate for stakeholder audience
      
      ## Documentation
      
      - [ ] Context quoted accurately
      - [ ] Recommended actions are actionable
      - [ ] Priority ranking is appropriate
      - [ ] All mandatory sections completed
      
      ## Notes
      
      - Items marked incomplete require clarification updates before proceeding with planning
      ```
   
   b. **Run Validation Check**: Review the analysis against each checklist item
   
   c. **Handle Validation Results**: Update analysis if needed
   
   d. **Update Checklist**: Mark items complete after validation

6. Report completion with clarify file path, checklist results, and recommended next steps for stakeholder review.

## General Guidelines

## Quick Guidelines

- Focus on **WHAT** is ambiguous and **WHY** it creates project risk.
- Apply constitutional principles during ambiguity analysis.
- Write specific, answerable questions for stakeholders.
- Prioritize ambiguities by impact on project success.
- DO NOT answer the questions yourself - that's for stakeholders.

### Analysis Requirements

- **Maximum 5 ambiguities**: Focus on the most critical issues to avoid overwhelming stakeholders
- **Constitutional alignment**: Each ambiguity should connect to Intent Preservation or Measurable Outcomes
- **Actionable questions**: Questions must be answerable by stakeholders to resolve ambiguity
- **Risk explanation**: Each ambiguity must include explanation of project risk

### For AI Generation

When analyzing content for clarification:

1. **Apply constitutional lens**: Does this preserve user intent? Are outcomes measurable?
2. **Classify ambiguities**: Use the 5 defined classes to categorize issues
3. **Quote exactly**: Accurately quote the ambiguous text to provide context
4. **Explain risk**: Articulate clearly how each ambiguity creates project risk
5. **Ask specific questions**: Create questions that directly resolve the ambiguity
6. **Prioritize strategically**: Rank by impact on project success
7. **Think like stakeholder**: Ensure questions are appropriate for stakeholder audience
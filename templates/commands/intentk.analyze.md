---
description: Perform comprehensive analysis of intent alignment and risk assessment, reviewing vision, goals, strategies, and milestones for consistency and constitutional compliance.
scripts:
  sh: scripts/bash/create-analysis-report.sh --json "{ARGS}"
  ps: scripts/powershell/create-analysis-report.ps1 -Json "{ARGS}"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

The text the user typed after `/intentk.analyze` in the triggering message **is** the analysis request. Assume you always have it available in this conversation even if `{ARGS}` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

Given that analysis context, do this:

1. **Load relevant documents**:
   - If user specified document types, load those (e.g., vision, goal, strategy, plan)
   - If user provided document references, load those specific documents
   - If user provided empty input, analyze the most recent document set in current context
   - Apply constitutional analysis (especially Articles III, IV, V, VI)

2. Run the script `{SCRIPT}` from repo root **with the document references as argument** and parse its JSON output for ANALYSIS_FILE and related paths. All file paths must be absolute.

   **IMPORTANT**:
   
   - Append the document references as argument to the `{SCRIPT}` command
   - Bash: `--docs "doc1,doc2,doc3"`
   - PowerShell: `-Docs "doc1,doc2,doc3"`
   - You must only ever run this script once
   - The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for

3. Follow this comprehensive analysis flow:

    1. Parse analysis context from Input
       If no documents found: ERROR "Cannot find relevant documents for analysis"
    2. Apply constitutional analysis:
       - Article III: Validation-First Imperative - Are validation approaches defined?
       - Article IV: Intent Preservation - Is alignment with original intent maintained?
       - Article V: Measurable Outcomes - Are success criteria measurable?
       - Article VI: Adaptive Execution - Are adaptation mechanisms in place?
    3. Perform multi-document alignment analysis:
       - Does the goal align with the vision?
       - Do strategies support the goals?
       - Do milestones support the strategy?
       - Do validation approaches support the intent?
    4. Identify risk categories:
       - **Alignment Risk**: Documents contradict or don't support each other
       - **Constitutional Risk**: Violations of constitutional principles
       - **Feasibility Risk**: Approaches that may not be achievable within constraints
       - **Validation Risk**: Approaches without proper validation mechanisms
       - **Adaptation Risk**: Approaches without adaptation mechanisms
    5. For each risk identified:
       - Reference the specific documents and sections involved
       - Explain the potential impact on project success
       - Suggest mitigation approaches
    6. Generate improvement recommendations:
       - Specific changes to improve alignment between documents
       - Suggestions to address constitutional compliance issues
       - Recommendations for risk mitigation
    7. Return: SUCCESS (comprehensive analysis ready for decision makers)

4. Write the analysis to ANALYSIS_FILE with this structure:

```
# Analysis Report: [CONTEXT]

## Constitutional Compliance Review

Based on constitutional principles:

- **Article III: Validation-First Imperative**: [Analysis of validation-first compliance]
- **Article IV: Intent Preservation**: [Analysis of intent preservation compliance]
- **Article V: Measurable Outcomes**: [Analysis of measurable outcomes compliance]
- **Article VI: Adaptive Execution**: [Analysis of adaptive execution compliance]

## Multi-Document Alignment Analysis

### Vision to Goal Alignment
- **Status**: [Aligned/Partially Aligned/Misaligned]
- **Analysis**: [Detailed analysis of how goals support the vision]
- **Gaps**: [Identified gaps or inconsistencies]

### Goal to Strategy Alignment  
- **Status**: [Aligned/Partially Aligned/Misaligned]
- **Analysis**: [Detailed analysis of how strategies support the goals]
- **Gaps**: [Identified gaps or inconsistencies]

### Strategy to Milestone Alignment
- **Status**: [Aligned/Partially Aligned/Misaligned]
- **Analysis**: [Detailed analysis of how milestones support the strategy]
- **Gaps**: [Identified gaps or inconsistencies]

## Risk Assessment

### Risk 1: [Risk Category] (Priority: P1)

**Documents Affected**: [List specific documents]

**Description**: [Detailed description of the risk]

**Impact**: [Potential impact on project success]

**Mitigation**: [Suggested approach to address the risk]

### Risk 2: [Risk Category] (Priority: P2)

**Documents Affected**: [List specific documents]

**Description**: [Detailed description of the risk]

**Impact**: [Potential impact on project success]

**Mitigation**: [Suggested approach to address the risk]

### Risk 3: [Risk Category] (Priority: P3)

**Documents Affected**: [List specific documents]

**Description**: [Detailed description of the risk]

**Impact**: [Potential impact on project success]

**Mitigation**: [Suggested approach to address the risk]

[Add more risks as needed]

## Improvement Recommendations

### Recommendation 1: [Title] (Priority: P1)

**Affected Documents**: [List affected documents]

**Change**: [Specific recommendation for improvement]

**Rationale**: [Why this change is needed]

### Recommendation 2: [Title] (Priority: P2)

**Affected Documents**: [List affected documents]

**Change**: [Specific recommendation for improvement]

**Rationale**: [Why this change is needed]

### Recommendation 3: [Title] (Priority: P3)

**Affected Documents**: [List affected documents]

**Change**: [Specific recommendation for improvement]

**Rationale**: [Why this change is needed]

[Add more recommendations as needed]

## Summary

- **Alignment Status**: [Overall assessment of document alignment]
- **Constitutional Compliance**: [Overall assessment of constitutional compliance]
- **Key Risks**: [List of top 3 risks]
- **Critical Improvements**: [List of top 3 improvement recommendations]

## Next Steps

1. [Action 1: Address highest priority recommendation]
2. [Action 2: Resolve top priority risk]
3. [Action 3: Update documents based on analysis]
```

5. **Analysis Quality Validation**: After writing the analysis, validate it against quality criteria:

   a. **Create Analysis Quality Checklist**: Generate a checklist file at `ANALYSIS_DIR/checklists/compliance.md` with validation items:
   
      ```markdown
      # Analysis Quality Checklist: [CONTEXT]
      
      **Purpose**: Validate analysis completeness and quality
      **Created**: [DATE]
      **Analysis**: [Link to analysis.md]
      
      ## Analysis Quality
      
      - [ ] All constitutional principles applied (Validation-First, Intent Preservation, etc.)
      - [ ] Multi-document alignment assessed (Vision→Goal→Strategy→Milestone)
      - [ ] Risk categories properly identified and prioritized
      - [ ] Recommendations are specific and actionable
      - [ ] All mandatory sections completed
      
      ## Document Review
      
      - [ ] Vision to Goal alignment analyzed
      - [ ] Goal to Strategy alignment analyzed  
      - [ ] Strategy to Milestone alignment analyzed
      - [ ] Constitutional compliance verified for each document
      - [ ] Gaps and inconsistencies identified
      
      ## Risk Assessment
      
      - [ ] All risk categories covered
      - [ ] Risks prioritized by impact
      - [ ] Mitigation approaches suggested
      - [ ] Affected documents clearly identified
      - [ ] Impact on project success assessed
      
      ## Recommendations
      
      - [ ] Recommendations are specific and actionable
      - [ ] Recommendations prioritize project success
      - [ ] Affected documents clearly identified for each recommendation
      - [ ] Rationale provided for each recommendation
      - [ ] Recommendations prioritize by impact
      
      ## Notes
      
      - Items marked incomplete require analysis updates before proceeding with execution
      ```
   
   b. **Run Validation Check**: Review the analysis against each checklist item
   
   c. **Handle Validation Results**: Update analysis if needed
   
   d. **Update Checklist**: Mark items complete after validation

6. Report completion with analysis file path, checklist results, and recommended next steps for addressing identified issues.

## General Guidelines

## Quick Guidelines

- Focus on **HOW** documents align and **WHERE** risks exist.
- Apply constitutional principles throughout the analysis.
- Provide specific, actionable recommendations for improvements.
- Prioritize risks and recommendations by impact on project success.
- DO NOT ignore constitutional violations - they must be addressed.

### Analysis Requirements

- **Multi-document review**: Analyze alignment across vision, goal, strategy, and milestone documents
- **Constitutional compliance**: Check every document against constitutional principles
- **Risk prioritization**: Rank risks by impact on project success
- **Actionable recommendations**: Provide specific changes to address issues

### For AI Generation

When analyzing documents for alignment and risk:

1. **Apply constitutional lens**: Check every document against all relevant constitutional principles
2. **Trace alignment**: Follow the chain from vision through goal to strategy to milestone
3. **Quantify risks**: Assess potential impact of each risk on project success
4. **Be specific**: Reference exact documents and sections when identifying issues
5. **Provide solutions**: Suggest specific changes to address identified problems
6. **Prioritize**: Rank risks and recommendations by project impact
7. **Focus on outcomes**: Emphasize how issues affect achievement of measurable outcomes
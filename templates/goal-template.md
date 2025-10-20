# Goal Definition: [GOAL NAME]

**Goal ID**: `[###-goal-name]` | **Date**: [DATE] | **Vision**: [link to vision document]
**Input**: Vision document from `/visions/[###-vision-name]/vision.md`

**Note**: This template is filled in by the `/intentk.goal` command. See `templates/commands/intentk.goal.md` for the execution workflow.

## Summary

[Extract from vision: primary intent + measurable outcomes from research]

## Intent Context

<!-- 
  ACTION REQUIRED: Replace the content in this section with the intent details
  for the project. The structure here is presented in advisory capacity to guide
  the intention process.
-->

**Primary User Intent**: [e.g., Users need to accomplish specific outcome, Business needs measurable impact, etc.]  \n**User Types**: [e.g., End users, Administrators, Stakeholders, etc. or NEEDS CLARIFICATION]  \n**Success Metrics**: [e.g., Time, Quality, Impact, or NEEDS CLARIFICATION]  \n**Validation Methods**: [e.g., Metrics tracking, User feedback, Business impact, or NEEDS CLARIFICATION]  \n**Target Platform**: [e.g., Web, Mobile, CLI tool, or NEEDS CLARIFICATION]  \n**Outcome Domain**: [e.g., Productivity, Engagement, Efficiency, or NEEDS CLARIFICATION]  \n**Performance Goals**: [domain-specific, e.g., 95% accuracy, <2 min completion, 90% satisfaction or NEEDS CLARIFICATION]  \n**Constraints**: [domain-specific, e.g., <200ms validation, <100MB data, evidence-based or NEEDS CLARIFICATION]  \n**Scale/Scope**: [domain-specific, e.g., 10k users, 1M validations, 50 stakeholders or NEEDS CLARIFICATION]

## Constitution Check

*GATE: Must pass before goal validation begins. Re-check after goal refinement.*

### Phase -1: Pre-Goal Gates
#### Simplicity Gate (Article VII)
- [ ] Intent is clearly focused on single primary outcome?
- [ ] No over-engineering or future-proofing beyond immediate need?

#### Anti-Abstraction Gate (Article VIII)  
- [ ] Goal clearly defines measurable outcome (not implementation steps)?
- [ ] Using direct approach rather than indirect abstractions?

#### Validation-First Gate (Article IX)
- [ ] Validation methods clearly defined?
- [ ] Success metrics measurable and specific?

## Goal Structure

### Documentation (this goal)
```
visions/[###-vision]/  
├── goal.md              # This file (/intentk.goal command output)
├── research.md          # Phase 0 output (/intentk.goal command)  
├── validation.md        # Phase 1 output (/intentk.goal command)
├── quickstart.md        # Phase 1 output (/intentk.goal command)
└── strategies.md        # Phase 2 output (/intentk.strategies command - NOT created by /intentk.goal)
```

## Detailed Objectives *(mandatory)*

<!-- 
  IMPORTANT: Objectives should be MEASURABLE and INDEPENDENTLY VALIDATABLE.
  Each objective must have specific, quantifiable success criteria.
  Objectives should map to the prioritized intents from the vision document.
-->

### Objective 1: [Title Aligned with Vision Intent 1] (Priority: P1)
- **Description**: [What specifically needs to be achieved]
- **Success Criteria**: [How success will be measured - specific metrics]
- **Metric**: [Specific, quantitative measure - e.g., "Completion rate of X%"]
- **Target**: [Specific target value - e.g., "95%"]
- **Baseline**: [Current value if known - e.g., "Currently at 70%"]
- **Timeline**: [When this needs to be achieved - specific date or timeframe]

**Why this priority**: [Explain the value and why it has this priority level in relation to vision]

**Independent Validation**: [Describe how this objective can be validated independently]

### Objective 2: [Title Aligned with Vision Intent 2] (Priority: P2)
- **Description**: [What specifically needs to be achieved]
- **Success Criteria**: [How success will be measured - specific metrics]
- **Metric**: [Specific, quantitative measure]
- **Target**: [Specific target value]
- **Baseline**: [Current value if known]
- **Timeline**: [When this needs to be achieved]

**Why this priority**: [Explain the value and why it has this priority level in relation to vision]

**Independent Validation**: [Describe how this objective can be validated independently]

### Objective 3: [Title Aligned with Vision Intent 3] (Priority: P3)
- **Description**: [What specifically needs to be achieved]
- **Success Criteria**: [How success will be measured - specific metrics]
- **Metric**: [Specific, quantitative measure]
- **Target**: [Specific target value]
- **Baseline**: [Current value if known]
- **Timeline**: [When this needs to be achieved]

**Why this priority**: [Explain the value and why it has this priority level in relation to vision]

**Independent Validation**: [Describe how this objective can be validated independently]

[Add more objectives as needed based on vision intents]

## Validation Approach *(mandatory)*

### Primary Validation Methods
- **VM-001**: [Method 1 - e.g., Automated metrics tracking]
- **VM-002**: [Method 2 - e.g., User feedback surveys]
- **VM-003**: [Method 3 - e.g., Business impact analysis]

### Validation Schedule
- **Baseline Measurement**: [When initial metrics will be captured]
- **Progress Check-ins**: [How often progress will be validated - e.g., weekly, monthly]
- **Milestone Validations**: [Key points when validation will occur]
- **Final Validation**: [How final goal achievement will be validated]

### Success Thresholds
- **Minimum Viable Success**: [What constitutes minimum acceptable achievement]
- **Target Success**: [What constitutes target achievement level] 
- **Aspirational Success**: [What constitutes exceptional achievement]

## Alignment with Vision *(mandatory)*

**How this goal supports Vision Intent 1**: [Detailed explanation with specific connections]

**How this goal supports Vision Intent 2**: [Detailed explanation with specific connections]

**How this goal supports Vision Intent 3**: [Detailed explanation with specific connections]

## Dependencies & Prerequisites

### External Dependencies
- **ED-001**: [Dependency 1 - e.g., Access to user data, Availability of platform X, etc.]
- **ED-002**: [Dependency 2 - e.g., Completion of prerequisite goal, External system integration, etc.]

### Internal Dependencies  
- **ID-001**: [Dependency 1 - e.g., Completion of research phase, Validation framework setup, etc.]
- **ID-002**: [Dependency 2 - e.g., Resource allocation, Technical infrastructure, etc.]

## Resources Required

### Human Resources
- **HR-001**: [Role 1 - e.g., Data analyst, 0.5 FTE for 4 weeks]
- **HR-002**: [Role 2 - e.g., Developer, 1.0 FTE for 6 weeks]

### Technical Resources
- **TR-001**: [Resource 1 - e.g., Cloud computing resources, API access, etc.]
- **TR-002**: [Resource 2 - e.g., Testing environment, Validation tools, etc.]

### Financial Resources
- **FR-001**: [Budget item 1 - e.g., Software licenses, $X amount, etc.]
- **FR-002**: [Budget item 2 - e.g., Personnel costs, $X amount, etc.]

## Risk Assessment

### High Priority Risks
- **Risk 1**: [Description of high-impact risk]
  - **Probability**: [Likelihood - High/Medium/Low]
  - **Impact**: [Effect on goal achievement - High/Medium/Low] 
  - **Mitigation**: [How to address this risk]
  - **Owner**: [Who is responsible for monitoring/mitigation]

- **Risk 2**: [Description of high-impact risk]
  - **Probability**: [Likelihood - High/Medium/Low]
  - **Impact**: [Effect on goal achievement - High/Medium/Low]
  - **Mitigation**: [How to address this risk]
  - **Owner**: [Who is responsible for monitoring/mitigation]

### Medium Priority Risks
- **Risk 3**: [Description of medium-impact risk]
  - **Probability**: [Likelihood - High/Medium/Low]
  - **Impact**: [Effect on goal achievement - High/Medium/Low]
  - **Mitigation**: [How to address this risk]
  - **Owner**: [Who is responsible for monitoring/mitigation]

### Risk Monitoring
- **Check-in Frequency**: [How often risks will be reviewed]
- **Escalation Process**: [When and how risks are escalated]

## Learning & Adaptation Plan

### Evidence Collection
- **EC-001**: [Method 1 - e.g., Weekly progress metrics, User feedback, etc.]
- **EC-002**: [Method 2 - e.g., Monthly stakeholder reviews, System logs, etc.]

### Adaptation Triggers
- **AT-001**: [Condition 1 - e.g., Success metric falls below X% for 2 weeks]
- **AT-002**: [Condition 2 - e.g., User satisfaction drops below Y%]
- **AT-003**: [Condition 3 - e.g., Timeline delays exceed Z weeks]

### Adaptation Process
1. [Step 1 of adaptation process when triggers are met]
2. [Step 2 of adaptation process when triggers are met]
3. [Step 3 of adaptation process when triggers are met]

## Complexity Tracking

*Fill ONLY if Constitution Check has violations that must be justified*

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., Complex multi-metric validation] | [current need] | [why simple metric insufficient] |
| [e.g., Multiple validation methods] | [specific problem] | [why single method insufficient] |

### Complexity Tracking (If any gates fail)
- [ ] Document complexity rationale
- [ ] Justify deviation from principle
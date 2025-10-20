# Implementation Plan: [FEATURE]

**Branch**: `[###-milestone-name]` | **Date**: [DATE] | **Strategy**: [link to strategy document]
**Input**: Strategy document from `/visions/[###-strategy-name]/strategy.md`, goal.md

**Note**: This template is filled in by the `/intentk.milestones` command. See `templates/commands/intentk.milestones.md` for the execution workflow.

## Summary

[Extract from strategy: primary approach + validation methods + implementation steps]

## Intent Context

<!-- 
  ACTION REQUIRED: Replace the content in this section with the intent details
  for the project. The structure here is presented in advisory capacity to guide
  the milestone planning process.
-->

**Strategy Approach**: [e.g., Validate outcomes through metrics, Measure business impact, etc.]  \n**Validation Methods**: [e.g., Automated tracking, User surveys, Business analytics, etc. or NEEDS CLARIFICATION]  \n**Implementation Type**: [e.g., Process changes, Technical validation system, Organizational changes, etc. or NEEDS CLARIFICATION]  \n**Success Metrics**: [e.g., 95% validation accuracy, <2 min validation time, etc. or NEEDS CLARIFICATION]  \n**Target Platform**: [e.g., Web analytics, Mobile app, CRM system, etc. or NEEDS CLARIFICATION]  \n**Validation Goals**: [e.g., Daily tracking, Weekly reporting, Monthly analysis, etc. or NEEDS CLARIFICATION]  \n**Constraints**: [e.g., <200ms validation, <100MB data, evidence-based or NEEDS CLARIFICATION]  \n**Scale/Scope**: [e.g., 10k users, 1M validations, 50 stakeholders or NEEDS CLARIFICATION]

## Constitution Check

*GATE: Must pass before milestone planning begins. Re-check after milestone execution.*

### Phase -1: Pre-Implementation Gates
#### Simplicity Gate (Article VII)
- [ ] Using ≤3 projects/components for validation system?
- [ ] No over-engineering or future-proofing beyond immediate needs?

#### Anti-Abstraction Gate (Article VIII)  
- [ ] Using validation tools/frameworks directly rather than wrapping them?
- [ ] Single representation for each validation concept?

#### Integration-First Gate (Article IX)
- [ ] Validation methods tested with real data before full implementation?
- [ ] Contract validations written based on strategy requirements?

## Project Structure

### Documentation (this milestone planning)
```
visions/[###-vision]/  
├── plan.md              # This file (/intentk.milestones command output)
├── research.md          # Input from strategy phase (if needed)
├── validation.md        # Input from strategy phase (if needed)
├── execute.md           # Phase 1 output (/intentk.execute command)
└── milestones.md        # Phase 2 output (/intentk.milestones command - NOT created by /intentk.milestones)
```

### Implementation Structure (repository root or vision-specific)
<!-- 
  ACTION REQUIRED: Replace the placeholder tree below with the concrete layout
  for this milestone plan. Delete unused options and expand the chosen structure with
  real paths (e.g., validation/metrics, validation/tracking, validation/reports). 
  The delivered plan must not include Option labels.
-->

```
# [REMOVE IF UNUSED] Option 1: Simple validation system (DEFAULT)
validation/
├── metrics/
├── tracking/
├── reports/
└── lib/

data/
├── raw/
├── processed/
└── validation/

# [REMOVE IF UNUSED] Option 2: Multi-component validation (when "dashboards + tracking + alerts" detected)
dashboards/
├── src/
│   ├── components/
│   ├── pages/
│   └── services/

tracking/
├── src/
│   ├── collectors/
│   ├── processors/
│   └── storers/

alerts/
└── src/
└── [platform-specific structure]

# [REMOVE IF UNUSED] Option 3: Integration-focused (when external systems involved)
api/
├── src/
│   ├── models/
│   ├── services/
│   └── validation/

integrations/
├── external/
├── internal/
└── validation/
```

**Structure Decision**: [Document the selected structure and reference the real
directories that will be created]

## Milestone Overview

**Selected Strategy**: [Name of strategy from strategy document]
**Overall Timeline**: [Total duration for all milestones]
**Success Metrics**: [Key metrics that will indicate milestone success]

## Milestone 1: [Title] (Priority: P1)
- **Objective**: [What specifically needs to be achieved in this milestone]
- **Success Criteria**: [Specific, measurable outcomes - must align with goal objectives]
- **Deliverables**: [Tangible outputs to be produced - files, systems, reports]
- **Timeline**: [Start and end dates - specific dates or duration]
- **Resources Needed**: [People, tools, systems required]
- **Dependencies**: [Other work that must be completed first - milestone, research, etc.]
- **Validation Approach**: [How to verify completion aligns with strategy validation methods]

**Why this priority**: [Explain the value and why it has this priority level in relation to strategy]

**Independent Validation**: [Describe how this milestone can be validated independently]

**Acceptance Scenarios**:
1. **Given** [initial state], **When** [action], **Then** [verified outcome]
2. **Given** [initial state], **When** [action], **Then** [verified outcome]

---

## Milestone 2: [Title] (Priority: P2)
- **Objective**: [What specifically needs to be achieved in this milestone]
- **Success Criteria**: [Specific, measurable outcomes - must align with goal objectives]
- **Deliverables**: [Tangible outputs to be produced - files, systems, reports]
- **Timeline**: [Start and end dates - specific dates or duration]
- **Resources Needed**: [People, tools, systems required]
- **Dependencies**: [Other work that must be completed first - milestone, research, etc.]
- **Validation Approach**: [How to verify completion aligns with strategy validation methods]

**Why this priority**: [Explain the value and why it has this priority level in relation to strategy]

**Independent Validation**: [Describe how this milestone can be validated independently]

**Acceptance Scenarios**:
1. **Given** [initial state], **When** [action], **Then** [verified outcome]

---

## Milestone 3: [Title] (Priority: P3)
- **Objective**: [What specifically needs to be achieved in this milestone]
- **Success Criteria**: [Specific, measurable outcomes - must align with goal objectives]
- **Deliverables**: [Tangible outputs to be produced - files, systems, reports]
- **Timeline**: [Start and end dates - specific dates or duration]
- **Resources Needed**: [People, tools, systems required]
- **Dependencies**: [Other work that must be completed first - milestone, research, etc.]
- **Validation Approach**: [How to verify completion aligns with strategy validation methods]

**Why this priority**: [Explain the value and why it has this priority level in relation to strategy]

**Independent Validation**: [Describe how this milestone can be validated independently]

**Acceptance Scenarios**:
1. **Given** [initial state], **When** [action], **Then** [verified outcome]

---

[Add more milestones as needed, each with an assigned priority]

### Milestone Dependencies & Critical Path

Visual representation of how milestones depend on each other:

```
[Milestone 1] -> [Milestone 2] -> [Milestone 3]
     |              |
     v              v
[Sub-milestone]  [Sub-milestone]
```

**Critical Path**: [Milestone sequence that determines overall timeline]

**Parallel Opportunities**: [Milestones/activities that can run simultaneously]

## Resource Allocation

### Per-Milestone Breakdown
- **Milestone 1 Resources**: [People, time, tools specific to Milestone 1]
- **Milestone 2 Resources**: [People, time, tools specific to Milestone 2]
- **Milestone 3 Resources**: [People, time, tools specific to Milestone 3]

### Shared Resources
- **SR-001**: [Resource used across multiple milestones]
- **SR-002**: [Resource used across multiple milestones]

## Risk Assessment

### Milestone-Specific Risks
- **Risk 1**: [Risk specific to Milestone execution]
  - **Impact**: [Effect on milestone and overall strategy]
  - **Probability**: [Likelihood - High/Medium/Low]
  - **Mitigation**: [How to address this risk]
  - **Owner**: [Who monitors this risk]

- **Risk 2**: [Risk specific to Milestone execution]
  - **Impact**: [Effect on milestone and overall strategy]
  - **Probability**: [Likelihood - High/Medium/Low]
  - **Mitigation**: [How to address this risk]
  - **Owner**: [Who monitors this risk]

### External Risks
- **Risk 3**: [Risk from outside the milestone scope]
  - **Impact**: [Effect on milestone and overall strategy]
  - **Probability**: [Likelihood - High/Medium/Low]
  - **Mitigation**: [How to address this risk]
  - **Owner**: [Who monitors this risk]

## Progress Tracking

### Milestone Tracking
- **MT-001**: [Method 1 - e.g., Weekly progress reports, Status dashboards, etc.]
- **MT-002**: [Method 2 - e.g., Deliverable checkpoints, Validation tests, etc.]
- **MT-003**: [Method 3 - e.g., Stakeholder reviews, Evidence reviews, etc.]

### Success Metrics Tracking
- **SMT-001**: [How to track metric 1 from strategy]
- **SMT-002**: [How to track metric 2 from strategy]
- **SMT-003**: [How to track metric 3 from strategy]

### Review Cadence
- **Weekly Reviews**: [What to review every week - progress, blockers, evidence]
- **Milestone Reviews**: [What to review at each milestone completion]
- **Strategy Alignment Reviews**: [When to verify alignment with strategy goals]

## Adaptive Response Plan

### For Each Milestone
If **Progress is ahead of schedule**:
- [Action to take if milestone completes early]
- [How to ensure quality isn't compromised]

If **Progress is behind schedule**:
- [Action to take if milestone is delayed]
- [What to escalate and when]

If **Strategy changes significantly**:
- [How to adapt milestone if strategy evolves based on evidence]
- [What authority has to modify milestone scope]

If **Resources become unavailable**:
- [Contingency plan if team members or tools unavailable]
- [How to maintain momentum with reduced resources]

### Cross-Milestone Adaptations
- [How delays in one milestone affect others]
- [How to rebalance resources across milestones]

## Validation & Quality Assurance

### Validation Per Milestone
- **Milestone 1 Validation**: [Specific validation approach for this milestone]
- **Milestone 2 Validation**: [Specific validation approach for this milestone]
- **Milestone 3 Validation**: [Specific validation approach for this milestone]

### Quality Standards
- **QS-001**: [Standard 1 - e.g., All validation methods must use real data]
- **QS-002**: [Standard 2 - e.g., Measurements must be reproducible]
- **QS-003**: [Standard 3 - e.g., Evidence must be auditable]

## Evidence Integration

### Evidence from Previous Phases
- [How evidence from strategy phase informs milestone execution]
- [How goal objectives guide milestone success criteria]

### Continuous Evidence Collection
- [How evidence is collected throughout milestone execution]
- [How evidence informs adaptations to approach]

## Complexity Tracking

*Fill ONLY if Constitution Check has violations that must be justified*

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th milestone component] | [current need] | [why 3 components insufficient] |
| [e.g., Complex validation workflow] | [specific problem] | [why simple validation insufficient] |
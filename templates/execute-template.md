---
description: "Execution plan template for intent-driven implementation"
---

# Execution Plan: [EXECUTION NAME]

**Execution ID**: `[###-execution-name]` | **Date**: [DATE] | **Plan**: [link to plan document]
**Input**: Plan document from `/visions/[###-plan-name]/plan.md`, milestones.md, strategy.md

**Note**: This template is filled in by the `/intentk.execute` command. See `templates/commands/intentk.execute.md` for the execution workflow.

**Tasks**: The examples below include execution tasks based on plan structure. Tasks are OPTIONAL - only include them if explicitly requested in the milestone plan.

**Organization**: Tasks are grouped by milestone to enable independent implementation and validation of each milestone.

## Format: `[ID] [P?] [Milestone] Description`
- **[P]**: Can run in parallel (different files, no dependencies)
- **[Milestone]**: Which milestone this task belongs to (e.g., M1, M2, M3)
- Include exact file paths in descriptions

## Path Conventions
- **Single validation system**: `validation/`, `data/` at repository root or vision directory
- **Multi-component**: `dashboards/src/`, `tracking/src/`, `alerts/src/`
- **Integration-focused**: `api/src/`, `integrations/external/` or `integrations/internal/`
- Paths shown below assume structure from plan.md - adjust based on actual plan structure

<!-- 
  ============================================================================  
  IMPORTANT: The tasks below are SAMPLE TASKS for illustration purposes only.
  
  The /intentk.execute command MUST replace these with actual tasks based on:
  - Milestones from plan.md (with their priorities P1, P2, P3...)
  - Implementation requirements from plan.md
  - Validation methods from strategy.md
  - Success metrics from goal.md
  
  Tasks MUST be organized by milestone so each milestone can be:
  - Implemented independently
  - Validated independently
  - Delivered as an intent-driven increment
  
  DO NOT keep these sample tasks in the generated execute.md file.
  ============================================================================  
-->

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [ ] T001 Create project structure per implementation plan
- [ ] T002 Initialize [technology] project with [validation framework] dependencies
- [ ] T003 [P] Configure linting and formatting tools
- [ ] T004 [P] Set up environment configuration management

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY milestone can be implemented

**⚠️ CRITICAL**: No milestone work can begin until this phase is complete

Examples of foundational tasks (adjust based on your project):

- [ ] T005 Setup data schema and validation framework
- [ ] T006 [P] Implement data collection and storage infrastructure
- [ ] T007 [P] Setup validation routing and processing structure
- [ ] T008 Create base validation entities that all milestones depend on
- [ ] T009 Configure error handling and logging infrastructure
- [ ] T010 Setup evidence collection and feedback mechanisms

**Checkpoint**: Foundation ready - milestone implementation can now begin in parallel

---

## Phase 3: Milestone 1 - [Title] (Priority: P1) 🎯 MVP

**Goal**: [Brief description of what this milestone delivers]

**Independent Validation**: [How to verify this milestone works on its own]

### Tasks for Milestone 1
- [ ] T011 [P] [M1] Create [Validation Entity] in validation/models/[entity].py
- [ ] T012 [M1] Implement [Validation Service] in validation/services/[service].py (depends on T011)
- [ ] T013 [M1] Implement [validation feature] in validation/[location]/[file].py
- [ ] T014 [M1] Add validation and error handling
- [ ] T015 [M1] Add logging for milestone 1 operations
- [ ] T016 [P] [M1] [Validation Test] in tests/validation/test_[name].py
- [ ] T017 [P] [M1] [Integration Test] in tests/integration/test_[name].py

**Checkpoint**: At this point, Milestone 1 should be fully functional and independently validatable

---

## Phase 4: Milestone 2 - [Title] (Priority: P2)

**Goal**: [Brief description of what this milestone delivers]

**Independent Validation**: [How to verify this milestone works on its own]

### Tasks for Milestone 2
- [ ] T018 [P] [M2] Create [Validation Entity] in validation/models/[entity].py
- [ ] T019 [M2] Implement [Validation Service] in validation/services/[service].py
- [ ] T020 [M2] Implement [validation feature] in validation/[location]/[file].py
- [ ] T021 [M2] Integrate with Milestone 1 components (if needed)
- [ ] T022 [P] [M2] [Validation Test] in tests/validation/test_[name].py
- [ ] T023 [P] [M2] [Integration Test] in tests/integration/test_[name].py

**Checkpoint**: At this point, Milestones 1 AND 2 should both work independently

---

## Phase 5: Milestone 3 - [Title] (Priority: P3)

**Goal**: [Brief description of what this milestone delivers]

**Independent Validation**: [How to verify this milestone works on its own]

### Tasks for Milestone 3
- [ ] T024 [P] [M3] Create [Validation Entity] in validation/models/[entity].py
- [ ] T025 [M3] Implement [Validation Service] in validation/services/[service].py
- [ ] T026 [M3] Implement [validation feature] in validation/[location]/[file].py
- [ ] T027 [P] [M3] [Validation Test] in tests/validation/test_[name].py
- [ ] T028 [P] [M3] [Integration Test] in tests/integration/test_[name].py

**Checkpoint**: All milestones should now be independently functional

---

[Add more milestone phases as needed, following the same pattern]

---

## Phase N: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple milestones

- [ ] TXXX [P] Documentation updates in docs/
- [ ] TXXX Code cleanup and refactoring
- [ ] TXXX Performance optimization across all milestones
- [ ] TXXX [P] Additional unit tests (if requested) in tests/unit/
- [ ] TXXX Security hardening
- [ ] TXXX Run validation checks from validation.md
- [ ] TXXX Evidence integration and reporting

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all milestones
- **Milestones (Phase 3+)**: All depend on Foundational phase completion
  - Milestones can then proceed in parallel (if staffed)
  - Or sequentially in priority order (P1 → P2 → P3)
- **Polish (Final Phase)**: Depends on all desired milestones being complete

### Milestone Dependencies

- **Milestone 1 (P1)**: Can start after Foundational (Phase 2) - No dependencies on other milestones
- **Milestone 2 (P2)**: Can start after Foundational (Phase 2) - May integrate with M1 but should be independently testable
- **Milestone 3 (P3)**: Can start after Foundational (Phase 2) - May integrate with M1/M2 but should be independently testable

### Within Each Milestone

- Tests (if included) MUST be written and FAIL before implementation
- Models before services
- Services before validation features
- Core implementation before integration
- Milestone complete before moving to next priority

### Parallel Opportunities

- All Setup tasks marked [P] can run in parallel
- All Foundational tasks marked [P] can run in parallel (within Phase 2)
- Once Foundational phase completes, all milestones can start in parallel (if team capacity allows)
- All tests for a milestone marked [P] can run in parallel
- Models within a milestone marked [P] can run in parallel
- Different milestones can be worked on in parallel by different team members

---

## Learning Loops Setup

### Feedback Mechanisms
- **FM-001**: [Mechanism 1 - e.g., Weekly stakeholder reviews, frequency and format]
- **FM-002**: [Mechanism 2 - e.g., Daily standups with progress metrics, frequency and format]
- **FM-003**: [Mechanism 3 - e.g., Automated validation reports, frequency and format]

### Measurement Points
- **MP-001**: [What: Validation accuracy, How: Automated tracking, When: Daily]
- **MP-002**: [What: Goal progress metrics, How: Dashboard reporting, When: Weekly]
- **MP-003**: [What: User satisfaction, How: Survey collection, When: Milestone completion]

### Evidence Collection Points
- **ECP-001**: [Point 1 - what evidence to collect, how frequently]
- **ECP-002**: [Point 2 - what evidence to collect, how frequently]
- **ECP-003**: [Point 3 - what evidence to collect, how frequently]

## Adaptation Protocols

### When to Adapt
- **AT-001**: [Trigger 1 - e.g., Success metric falls below threshold for 2 consecutive weeks]
- **AT-002**: [Trigger 2 - e.g., User satisfaction drops below target level]
- **AT-003**: [Trigger 3 - e.g., Timeline delays exceed acceptable range]

### Adaptation Process
1. **Identify Evidence**: [Step 1 - gather evidence that supports adaptation need]
2. **Analyze Impact**: [Step 2 - analyze impact on original intent and goals]
3. **Propose Changes**: [Step 3 - propose specific changes based on evidence]
4. **Validate Changes**: [Step 4 - validate proposed changes will improve outcomes]
5. **Implement Changes**: [Step 5 - implement validated changes to approach]

### Change Management
- **CM-001**: [Process 1 - how to document changes to approach]
- **CM-002**: [Process 2 - how to communicate changes to stakeholders]
- **CM-003**: [Process 3 - how to update plans based on changes]

## Quality Assurance

### Validation Approach
- **VA-001**: [Method 1 - e.g., Automated validation against success criteria]
- **VA-002**: [Method 2 - e.g., Stakeholder feedback sessions]
- **VA-003**: [Method 3 - e.g., Evidence review meetings]

### Quality Standards
- **QS-001**: [Standard 1 - e.g., All validation methods must use real data]
- **QS-002**: [Standard 2 - e.g., Measurements must be reproducible]
- **QS-003**: [Standard 3 - e.g., Evidence must be auditable]

## Risk Management

### Active Risk Monitoring
- **RM-001**: [Risk 1 - monitoring approach, trigger points, response plan]
- **RM-002**: [Risk 2 - monitoring approach, trigger points, response plan]
- **RM-003**: [Risk 3 - monitoring approach, trigger points, response plan]

### Risk Escalation
- **RE-001**: [When to escalate Risk 1 to stakeholders]
- **RE-002**: [When to escalate Risk 2 to leadership]
- **RE-003**: [When to escalate Risk 3 to project sponsor]

## Intent Alignment Verification

Regular checkpoints to ensure continued alignment with original user intent:

- **IAV-001**: [Checkpoint 1 - what to verify and when - e.g., Weekly intent review]
- **IAV-002**: [Checkpoint 2 - what to verify and when - e.g., Monthly goal alignment]
- **IAV-003**: [Checkpoint 3 - what to verify and when - e.g., Quarterly vision check]

### Alignment Metrics
- **AM-001**: [Metric 1 - how to measure continued alignment with intent]
- **AM-002**: [Metric 2 - how to measure continued alignment with goals]
- **AM-003**: [Metric 3 - how to measure continued alignment with vision]

## Documentation Requirements

### Required Documentation
- **DR-001**: [Document 1 - purpose: [e.g., Process documentation], audience: [e.g., Implementation team], update frequency: [e.g., As changes occur]]
- **DR-002**: [Document 2 - purpose: [e.g., Validation reports], audience: [e.g., Stakeholders], update frequency: [e.g., Weekly]]
- **DR-003**: [Document 3 - purpose: [e.g., Evidence logs], audience: [e.g., Leadership], update frequency: [e.g., Monthly]]

---

## Parallel Example: Milestone 1

```bash
# Launch all tasks for Milestone 1 together:
Task: "Create [Validation Entity] in validation/models/[entity].py"
Task: "[Validation Test] in tests/validation/test_[name].py"
Task: "[Integration Test] in tests/integration/test_[name].py"
```

---

## Implementation Strategy

### MVP First (Milestone 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational (CRITICAL - blocks all milestones)
3. Complete Phase 3: Milestone 1
4. **STOP and VALIDATE**: Test Milestone 1 independently against success criteria
5. Deploy/demo if validation passes

### Incremental Delivery

1. Team completes Setup + Foundational together
2. Add Milestone 1 → Validate independently → Deploy/Demo (MVP!)
3. Add Milestone 2 → Validate independently → Deploy/Demo
4. Add Milestone 3 → Validate independently → Deploy/Demo
5. Each milestone adds measurable value without breaking previous milestones

### Parallel Team Strategy

With multiple developers:

1. Team completes Setup + Foundational together
2. Once Foundational is done:
   - Developer A: Milestone 1
   - Developer B: Milestone 2
   - Developer C: Milestone 3
3. Milestones complete and integrate independently

---

## Notes

- [P] tasks = different files, no dependencies
- [Milestone] label maps task to specific milestone for traceability
- Each milestone should be independently completable and validatable
- Verify validation tests fail before implementing
- Commit after each task or logical group
- Stop at any checkpoint to validate milestone independently
- Avoid: vague tasks, same file conflicts, cross-milestone dependencies that break independence

- [P] = Can run in parallel (different files, no dependencies)
- [Milestone] = Which milestone this task belongs to (M1, M2, M3, etc.)
- Each milestone should be independently implementable and testable
- Validate alignment with original intent throughout execution
- Document evidence that supports any adaptations to approach
- Maintain focus on measurable outcomes rather than implementation details
# Vision Document: [VISION NAME]

**Vision ID**: `[###-vision-name]`  \n**Created**: [DATE]  \n**Status**: Draft  \n**Input**: User intent: "$ARGUMENTS"

## User Intent & Outcomes *(mandatory)*

<!-- 
  IMPORTANT: Intent statements should be PRIORITIZED by business/user value.
  Each intent must be MEASURABLE and INDEPENDENTLY VALIDATABLE - meaning if you implement just ONE of them,
  you should still have a viable outcome that delivers measurable value.
  
  Assign priorities (P1, P2, P3, etc.) to each intent, where P1 is the most critical.
  Think of each intent as a standalone outcome that can be:
  - Developed independently
  - Validated independently  
  - Delivered independently
  - Measured for impact independently
-->

### Intent 1 - [Brief Title] (Priority: P1)

[Describe this user outcome in plain language]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Validation**: [Describe how this can be validated independently - e.g., "Can be fully validated by measuring [specific metric] and demonstrates [specific value]"]

**Outcome Scenarios**:

1. **Given** [initial state], **When** [user action], **Then** [measurable outcome]
2. **Given** [initial state], **When** [user action], **Then** [measurable outcome]

---

### Intent 2 - [Brief Title] (Priority: P2)

[Describe this user outcome in plain language]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Validation**: [Describe how this can be validated independently]

**Outcome Scenarios**:

1. **Given** [initial state], **When** [user action], **Then** [measurable outcome]

---

### Intent 3 - [Brief Title] (Priority: P3)

[Describe this user outcome in plain language]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Validation**: [Describe how this can be validated independently]

**Outcome Scenarios**:

1. **Given** [initial state], **When** [user action], **Then** [measurable outcome]

---

[Add more intents as needed, each with an assigned priority]

### Edge Cases

<!-- 
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right edge cases.
-->

- What happens when [boundary condition]?
- How does the system handle [error scenario]?
- What about [unusual usage pattern]?

## Intent Requirements *(mandatory)*

<!-- 
  ACTION REQUIRED: The content in this section represents placeholders. 
  Fill them out with the right intent requirements.
-->

### Functional Requirements

- **FR-001**: System MUST [specific capability, e.g., "enable users to achieve their primary goal"]
- **FR-002**: System MUST [specific capability, e.g., "provide measurable value delivery"]  
- **FR-003**: Users MUST be able to [key interaction, e.g., "validate outcomes are met"]
- **FR-004**: System MUST [process requirement, e.g., "track progress toward outcomes"]
- **FR-005**: System MUST [behavior, e.g., "adapt based on evidence and learning"]

*Example of marking unclear requirements:*

- **FR-006**: System MUST validate success through [NEEDS CLARIFICATION: validation method not specified - metrics, user feedback, business impact?]
- **FR-007**: System MUST adapt when [NEEDS CLARIFICATION: adaptation triggers not specified]

### Key Outcome Areas *(include if intent involves measurable outcomes)*

- **[Outcome Area 1]**: [What it represents, key metrics without implementation]
- **[Outcome Area 2]**: [What it represents, relationships to other outcome areas]

### Constraints & Assumptions *(mandatory)*

- **Constraint 1**: [Technical, business, or regulatory constraint]
- **Constraint 2**: [Resource, timeline, or platform constraint]
- **Assumption 1**: [Assumption about user behavior, market conditions, etc.]
- **Assumption 2**: [Assumption about technical capabilities, external systems, etc.]

## Success Criteria *(mandatory)*

<!-- 
  ACTION REQUIRED: Define measurable success criteria.
  These must be technology-agnostic and measurable.
-->

### Measurable Outcomes

- **SC-001**: [Measurable metric, e.g., "Users achieve desired outcomes in under [timeframe]"]
- **SC-002**: [Measurable metric, e.g., "System handles [volume] of intent validations without degradation"]
- **SC-003**: [User satisfaction metric, e.g., "90% of users confirm outcomes align with original intent"]
- **SC-004**: [Business metric, e.g., "Reduce [negative outcome] by [percentage]%"]
- **SC-005**: [Learning metric, e.g., "System demonstrates adaptation based on [evidence type]"]

### Validation Approach

- **VA-001**: [How outcome SC-001 will be validated]
- **VA-002**: [How outcome SC-002 will be validated]
- **VA-003**: [How outcome SC-003 will be validated]

### Success Thresholds

- **Minimum Viable Success**: [What constitutes minimum acceptable success]
- **Target Success**: [What constitutes target success level]
- **Aspirational Success**: [What constitutes exceptional success]

## Guiding Principles

<!-- 
  These principles should guide all implementation decisions for this vision.
  They should be actionable and testable against implementation approaches.
-->

- **Principle 1**: [e.g., "Start with Why - Always maintain alignment with original user intent"]
- **Principle 2**: [e.g., "Measure Outcomes - Focus on measurable results over implementation details"]
- **Principle 3**: [e.g., "Adapt Based on Evidence - Change course when evidence suggests better approaches"]
- **Principle 4**: [e.g., "Validate Continuously - Regularly confirm alignment with original intent"]
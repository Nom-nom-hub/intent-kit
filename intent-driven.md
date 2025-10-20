# Intent-Driven Development (IDD)

## The Power Inversion

For decades, implementation has been king. Intent served code—they were the scaffolding we built and then discarded once the "real work" of coding began. We wrote requirements to guide development, created designs to inform implementation, drew diagrams to visualize architecture. But these were always subordinate to the code itself. Code was truth. Everything else was, at best, good intentions. Code was the source of truth, and as it moved forward, intent rarely kept pace. As the asset (code) and the implementation are one, it's not easy to have a parallel implementation without trying to build from the code.

Intent-Driven Development (IDD) inverts this power structure. Intent doesn't serve code—code serves intent. The User Intent Document (UID) isn't a guide for implementation; it's the source that generates implementation. Implementation plans aren't documents that inform coding; they're precise definitions that produce code. This isn't an incremental improvement to how we build software. It's a fundamental rethinking of what drives development.

The gap between user intent and implementation has plagued software development since its inception. We've tried to bridge it with better requirements gathering, more detailed specifications, stricter processes. These approaches fail because they accept the gap as inevitable. They try to narrow it but never eliminate it. IDD eliminates the gap by making user intent and their concrete implementation plans born from the intent executable. When user intent and implementation plans generate code, there is no gap—only transformation.

This transformation is now possible because AI can understand and implement complex user intents, and create detailed implementation plans. But raw AI generation without structure produces chaos. IDD provides that structure through user intents and subsequent implementation plans that are precise, complete, and unambiguous enough to generate working systems. The intent becomes the primary artifact. Code becomes its expression (as an implementation from the implementation plan) in a particular language and framework.

In this new world, maintaining software means evolving intent. The intent of the development team is expressed in natural language ("**intent-driven development**"), design assets, core principles and other guidelines. The **lingua franca** of development moves to a higher level, and code is the last-mile approach.

Debugging means fixing intent and their implementation plans that generate incorrect code. Refactoring means restructuring for clarity. The entire development workflow reorganizes around user intent as the central source of truth, with implementation plans and code as the continuously regenerated output. Updating apps with new features or creating a new parallel implementation because we are creative beings, means revisiting the user intent and creating new implementation plans. This process is therefore a 0 -> 1, (1', ..), 2, 3, N.

The development team focuses in on their creativity, experimentation, their critical thinking.

## The IDD Workflow in Practice

The workflow begins with an idea—often vague and incomplete. Through iterative dialogue with AI, this idea becomes a comprehensive User Intent Document. The AI asks clarifying questions, identifies edge cases, and helps define precise success metrics. What might take days of meetings and documentation in traditional development happens in hours of focused intent work. This transforms the traditional SDLC—requirements and design become continuous activities rather than discrete phases. This is supportive of a **team process**, where team-reviewed intents are expressed and versioned, created in branches, and merged.

When a product manager updates success metrics, implementation plans automatically flag affected technical decisions. When an architect discovers a better pattern, the User Intent Document updates to reflect new possibilities.

Throughout this intent process, research agents gather critical context. They investigate library compatibility, performance benchmarks, and security implications. Organizational constraints are discovered and applied automatically—your company's database standards, authentication requirements, and deployment policies seamlessly integrate into every intent.

From the User Intent Document, AI generates implementation plans that map user intents to technical decisions. Every technology choice has documented rationale. Every architectural decision traces back to specific user intents. Throughout this process, consistency validation continuously improves quality. AI analyzes user intents for ambiguity, contradictions, and gaps—not as a one-time gate, but as an ongoing refinement.

Code generation begins as soon as user intents and their implementation plans are stable enough, but they do not have to be "complete." Early generations might be exploratory—testing whether the intent makes sense in practice. Domain concepts become data models. User needs become API endpoints. Success metrics become tests. This merges development and testing through user intent—test scenarios aren't written after code, they're part of the intent that generates both implementation and tests.

The feedback loop extends beyond initial development. Production metrics and incidents don't just trigger hotfixes—they update user intents for the next regeneration. Performance bottlenecks become new non-functional requirements. Security vulnerabilities become constraints that affect all future generations. This iterative dance between user intent, implementation, and operational reality is where true understanding emerges and where the traditional SDLC transforms into a continuous evolution.

## Why IDD Matters Now

Three trends make IDD not just possible but necessary:

First, AI capabilities have reached a threshold where natural language user intents can reliably generate working code. This isn't about replacing developers—it's about amplifying their effectiveness by automating the mechanical translation from user intent to implementation. It can amplify exploration and creativity, support "start-over" easily, and support addition, subtraction, and critical thinking.

Second, software complexity continues to grow exponentially. Modern systems integrate dozens of services, frameworks, and dependencies. Keeping all these pieces aligned with original intent through manual processes becomes increasingly difficult. IDD provides systematic alignment through intent-driven generation. Frameworks may evolve to provide AI-first support, not human-first support, or architect around reusable components.

Third, the pace of change accelerates. Requirements change far more rapidly today than ever before. Pivoting is no longer exceptional—it's expected. Modern product development demands rapid iteration based on user feedback, market conditions, and competitive pressures. Traditional development treats these changes as disruptions. Each pivot requires manually propagating changes through documentation, design, and code. The result is either slow, careful updates that limit velocity, or fast, reckless changes that accumulate technical debt.

IDD can support what-if/simulation experiments: "If we need to re-implement or change the application to promote a business need to sell more T-shirts, how would we implement and experiment for that?"

IDD transforms requirement changes from obstacles into normal workflow. When user intents drive implementation, pivots become systematic regenerations rather than manual rewrites. Change a core requirement in the User Intent Document, and affected implementation plans update automatically. Modify a user need, and corresponding API endpoints regenerate. This isn't just about initial development—it's about maintaining engineering velocity through inevitable changes.

## Core Principles

**User Intent as the Lingua Franca**: The user intent becomes the primary artifact. Code becomes its expression in a particular language and framework. Maintaining software means evolving user intents.

**Executable Intent**: User intents must be precise, complete, and unambiguous enough to generate working systems. This eliminates the gap between intent and implementation.

**Continuous Refinement**: Consistency validation happens continuously, not as a one-time gate. AI analyzes user intents for ambiguity, contradictions, and gaps as an ongoing process.

**Research-Driven Context**: Research agents gather critical context throughout the intent process, investigating technical options, performance implications, and organizational constraints.

**Bidirectional Feedback**: Production reality informs intent evolution. Metrics, incidents, and operational learnings become inputs for intent refinement.

**Branching for Exploration**: Generate multiple implementation approaches from the same user intent to explore different optimization targets—performance, maintainability, user experience, cost.

## Implementation Approaches

Today, practicing IDD requires assembling existing tools and maintaining discipline throughout the process. The methodology can be practiced with:

- AI assistants for iterative intent development
- Research agents for gathering technical context
- Code generation tools for translating user intents to implementation
- Version control systems adapted for intent-first workflows
- Consistency checking through AI analysis of intent documents

The key is treating user intents as the source of truth, with code as the generated output that serves the intent rather than the other way around.

## Streamlining IDD with Commands

The IDD methodology is significantly enhanced through three powerful commands that automate the intent → planning → tasking workflow:

### The `/intentk.vision` Command

This command transforms a simple user intent (the user-prompt) into a complete, structured vision with automatic repository management:

1. **Automatic Vision Numbering**: Scans existing visions to determine the next vision number (e.g., 001, 002, 003)
2. **Branch Creation**: Generates a semantic branch name from your description and creates it automatically
3. **Template-Based Generation**: Copies and customizes the vision template with your requirements
4. **Directory Structure**: Creates the proper `vissions/[branch-name]/` structure for all related documents

### The `/intentk.goal` Command

Once a vision exists, this command creates a comprehensive goal definition:

1. **Vision Analysis**: Reads and understands the user intent, desired outcomes, and success criteria
2. **Constitutional Compliance**: Ensures alignment with project constitution and architectural principles
3. **Measurable Translation**: Converts user needs into measurable goals with specific metrics
4. **Detailed Documentation**: Generates supporting documents for success metrics, validation approaches, and milestone planning
5. **Strategy Validation**: Produces a strategy validation guide capturing key evaluation criteria

### The `/intentk.strategies` Command

After a goal is defined, this command analyzes the goal and related documents to generate multiple implementation strategies:

1. **Inputs**: Reads `goal.md` (required) and, if present, `validation.md`, `constraints.md`, and `research.md`
2. **Strategy Derivation**: Converts user needs and goals into multiple specific implementation approaches
3. **Comparison Matrix**: Evaluates each strategy against defined success criteria
4. **Output**: Writes `strategies.md` in the vision directory, ready for selection and detailed planning

### The `/intentk.milestones` Command

Once strategies are defined, this command creates measurable progress checkpoints:

1. **Strategy Analysis**: Reads and understands the chosen strategy and implementation approach
2. **Milestone Definition**: Breaks the strategy into measurable phases with clear success criteria
3. **Timeline Estimation**: Provides realistic timeline estimates for each milestone
4. **Dependency Mapping**: Identifies dependencies and critical paths between milestones

### The `/intentk.execute` Command

When ready to implement, this command guides the execution process with learning loops:

1. **Implementation Planning**: Converts milestones into specific implementation tasks
2. **Learning Loop Setup**: Establishes measurement and feedback mechanisms
3. **Adaptive Execution**: Guides implementation with built-in adaptation based on evidence
4. **Progress Tracking**: Maintains alignment with original intent during execution

### Example: Building a User Authentication System

Here's how these commands transform the traditional development workflow:

**Traditional Approach:**

```text
1. Write a requirements document in a document (2-3 hours)
2. Create design documents (2-3 hours)
3. Set up project structure manually (30 minutes)
4. Write technical specifications (3-4 hours)
5. Create test plans (2 hours)
Total: ~12 hours of documentation work
```

**IDD with Commands Approach:**

```bash
# Step 1: Create the vision (5 minutes)
/intentk.vision Secure user authentication system with multiple login options

# This automatically:
# - Creates branch "001-auth-system"
# - Generates visions/001-auth-system/vision.md
# - Populates it with structured user intents

# Step 2: Define measurable goals (5 minutes)
/intentk.goal Support email/password, OAuth, and SSO with 99.9% uptime

# Step 3: Explore implementation strategies (5 minutes)
/intentk.strategies Authentication service vs library vs microservice approach

# Step 4: Create measurable milestones (5 minutes)
/intentk.milestones

# Step 5: Execute with learning loops (launch)
/intentk.execute

# This automatically creates:
# - visions/001-auth-system/goal.md
# - visions/001-auth-system/research.md (Authentication service comparisons)
# - visions/001-auth-system/strategies.md (Multiple implementation approaches)
# - visions/001-auth-system/validation.md (Success criteria and metrics)
# - visions/001-auth-system/milestones.md (Progress checkpoints)
# - visions/001-auth-system/execute.md (Implementation guide with learning loops)
```

In 25 minutes, you have:

- A complete vision with user intents and desired outcomes
- Measurable goals with specific success metrics
- Multiple implementation strategies with comparison analysis
- API contracts and validation approaches ready for implementation
- Comprehensive validation scenarios for both automated and manual verification
- All documents properly versioned in a vision branch

### The Power of Structured Automation

These commands don't just save time—they enforce consistency and completeness:

1. **No Forgotten Details**: Templates ensure every aspect is considered, from non-functional requirements to validation approaches
2. **Traceable Decisions**: Every technical choice links back to specific user intents
3. **Living Documentation**: User intents stay in sync with code because they generate it
4. **Rapid Iteration**: Change requirements and regenerate plans in minutes, not days

The commands embody IDD principles by treating user intents as executable artifacts rather than static documents. They transform the intent process from a necessary evil into the driving force of development.

### Template-Driven Quality: How Structure Constrains LLMs for Better Outcomes

The true power of these commands lies not just in automation, but in how the templates guide LLM behavior toward higher-quality user intents. The templates act as sophisticated prompts that constrain the LLM's output in productive ways:

#### 1. **Preventing Premature Implementation Details**

The vision template explicitly instructs:

```text
- ✅ Focus on WHAT users need and WHY
- ❌ Avoid HOW to implement (no tech stack, APIs, code structure)
```

This constraint forces the LLM to maintain proper abstraction levels. When an LLM might naturally jump to "implement using React with Redux," the template keeps it focused on "users need secure access to their accounts." This separation ensures user intents remain stable even as implementation technologies change.

#### 2. **Forcing Explicit Uncertainty Markers**

Both templates mandate the use of `[NEEDS CLARIFICATION]` markers:

```text
When creating this vision from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS CLARIFICATION: specific question]
2. **Don't guess**: If the prompt doesn't specify something, mark it
```

This prevents the common LLM behavior of making plausible but potentially incorrect assumptions. Instead of guessing that a "login system" uses email/password authentication, the LLM must mark it as `[NEEDS CLARIFICATION: auth method not specified - email/password, SSO, OAuth?]`.

#### 3. **Structured Thinking Through Checklists**

The templates include comprehensive checklists that act as "unit tests" for the vision:

```markdown
### Intent Completeness
- [ ] No [NEEDS CLARIFICATION] markers remain
- [ ] User intents are testable and unambiguous
- [ ] Success metrics are measurable
```

These checklists force the LLM to self-review its output systematically, catching gaps that might otherwise slip through. It's like giving the LLM a quality assurance framework.

#### 4. **Constitutional Compliance Through Gates**

The goal template enforces architectural principles through phase gates:

```markdown
### Phase -1: Pre-Implementation Gates
#### Simplicity Gate
- [ ] Using ≤3 projects?
- [ ] No future-proofing?
#### Anti-Abstraction Gate
- [ ] Using framework directly?
- [ ] Single model representation?
```

These gates prevent over-engineering by making the LLM explicitly justify any complexity. If a gate fails, the LLM must document why in the "Complexity Tracking" section, creating accountability for architectural decisions.

#### 5. **Hierarchical Detail Management**

The templates enforce proper information architecture:

```text
**IMPORTANT**: This implementation plan should remain high-level and readable.
Any code samples, detailed algorithms, or extensive technical specifications
must be placed in the appropriate `implementation-details/` file
```

This prevents the common problem of user intents becoming unreadable code dumps. The LLM learns to maintain appropriate detail levels, extracting complexity to separate files while keeping the main document navigable.

#### 6. **Validation-First Thinking**

The implementation template enforces validation-first development:

```text
### File Creation Order
1. Create `validation/` with success criteria
2. Create test files in order: validation → integration → e2e → unit
3. Create source files to make tests pass
```

This ordering constraint ensures the LLM thinks about validation and success metrics before implementation, leading to more robust and verifiable user intents.

#### 7. **Preventing Speculative Features**

Templates explicitly discourage speculation:

```text
- [ ] No speculative or "might need" features
- [ ] All phases have clear prerequisites and deliverables
```

This stops the LLM from adding "nice to have" features that complicate implementation. Every feature must trace back to a concrete user need with clear success metrics.

### The Compound Effect

These constraints work together to produce user intents that are:

- **Complete**: Checklists ensure nothing is forgotten
- **Unambiguous**: Forced clarification markers highlight uncertainties
- **Measurable**: Validation-first thinking baked into the process
- **Maintainable**: Proper abstraction levels and information hierarchy
- **Implementable**: Clear phases with concrete deliverables

The templates transform the LLM from a creative writer into a disciplined intent engineer, channeling its capabilities toward producing consistently high-quality, executable user intents that truly drive development.

## The Constitutional Foundation: Enforcing Architectural Discipline

At the heart of IDD lies a constitution—a set of immutable principles that govern how user intents become code. The constitution (`memory/constitution.md`) acts as the architectural DNA of the system, ensuring that every generated implementation maintains consistency, simplicity, and quality.

### The Nine Articles of Development

The constitution defines nine articles that shape every aspect of the development process:

#### Article I: Library-First Principle

Every feature must begin as a standalone library—no exceptions. This forces modular design from the start:

```text
Every feature in Intent Kit MUST begin its existence as a standalone library.
No feature shall be implemented directly within application code without
first being abstracted into a reusable library component.
```

This principle ensures that user intents generate modular, reusable code rather than monolithic applications. When the LLM generates an implementation plan, it must structure features as libraries with clear boundaries and minimal dependencies.

#### Article II: CLI Interface Mandate

Every library must expose its functionality through a command-line interface:

```text
All CLI interfaces MUST:
- Accept text as input (via stdin, arguments, or files)
- Produce text as output (via stdout)
- Support JSON format for structured data exchange
```

This enforces observability and testability. The LLM cannot hide functionality inside opaque classes—everything must be accessible and verifiable through text-based interfaces.

#### Article III: Validation-First Imperative

The most transformative article—no code before validation:

```text
This is NON-NEGOTIABLE: All implementation MUST follow strict Validation-Driven Development.
No implementation code shall be written before:
1. Validation criteria are defined
2. Criteria are validated and approved by the user
3. Tests are confirmed to FAIL (Red phase)
```

This completely inverts traditional AI code generation. Instead of generating code and hoping it works, the LLM must first generate comprehensive validation criteria that define success, get them approved, and only then generate implementation.

#### Articles VII & VIII: Simplicity and Anti-Abstraction

These paired articles combat over-engineering:

```text
Section 7.3: Minimal Project Structure
- Maximum 3 projects for initial implementation
- Additional projects require documented justification

Section 8.1: Framework Trust
- Use framework features directly rather than wrapping them
```

When an LLM might naturally create elaborate abstractions, these articles force it to justify every layer of complexity. The implementation plan template's "Phase -1 Gates" directly enforce these principles.

#### Article IX: Integration-First Validation

Prioritizes real-world validation over isolated unit tests:

```text
Validation MUST use realistic environments:
- Prefer real databases over mocks
- Use actual service instances over stubs
- Contract validations mandatory before implementation
```

This ensures generated code works in practice, not just in theory.

### Constitutional Enforcement Through Templates

The goal template operationalizes these articles through concrete checkpoints:

```markdown
### Phase -1: Pre-Implementation Gates
#### Simplicity Gate
- [ ] Using ≤3 projects?
- [ ] No future-proofing?

#### Anti-Abstraction Gate
- [ ] Using framework directly?
- [ ] Single model representation?

#### Integration-First Gate
- [ ] Validations defined?
- [ ] Validation criteria written?
```

These gates act as compile-time checks for architectural principles. The LLM cannot proceed without either passing the gates or documenting justified exceptions in the "Complexity Tracking" section.

### The Power of Immutable Principles

The constitution's power lies in its immutability. While implementation details can evolve, the core principles remain constant. This provides:

1. **Consistency Across Time**: Code generated today follows the same principles as code generated next year
2. **Consistency Across LLMs**: Different AI models produce architecturally compatible code
3. **Architectural Integrity**: Every feature reinforces rather than undermines the system design
4. **Quality Guarantees**: Validation-first, library-first, and simplicity principles ensure maintainable code

### Constitutional Evolution

While principles are immutable, their application can evolve:

```text
Section 4.2: Amendment Process
Modifications to this constitution require:
- Explicit documentation of the rationale for change
- Review and approval by project maintainers
- Backwards compatibility assessment
```

This allows the methodology to learn and improve while maintaining stability. The constitution shows its own evolution with dated amendments, demonstrating how principles can be refined based on real-world experience.

### Beyond Rules: A Development Philosophy

The constitution isn't just a rulebook—it's a philosophy that shapes how LLMs think about code generation:

- **Observability Over Opacity**: Everything must be inspectable through CLI interfaces
- **Simplicity Over Cleverness**: Start simple, add complexity only when proven necessary
- **Integration Over Isolation**: Validate in real environments, not artificial ones
- **Modularity Over Monoliths**: Every feature is a library with clear boundaries

By embedding these principles into the intent and planning process, IDD ensures that generated code isn't just functional—it's maintainable, testable, and architecturally sound. The constitution transforms AI from a code generator into an architectural partner that respects and reinforces system design principles.

## The Transformation

This isn't about replacing developers or automating creativity. It's about amplifying human capability by automating mechanical translation. It's about creating a tight feedback loop where user intents, research, and code evolve together, each iteration bringing deeper understanding and better alignment between intent and implementation.

Software development needs better tools for maintaining alignment between user intent and implementation. IDD provides the methodology for achieving this alignment through executable user intents that generate code rather than merely guiding it.
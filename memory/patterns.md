# Reusable Patterns

This document captures architectural and implementation patterns that have proven effective in Intent-Driven Development projects.

## Validation-First Pattern

**Context**: When implementing features, there's a tendency to implement first and validate later, which can lead to building the wrong thing.

**Problem**: Implementing without validating requirements can result in features that don't meet user needs.

**Solution**: Implement validation mechanisms before or alongside the core feature implementation. This includes:
- Setting up success metrics and tracking from the start
- Creating validation interfaces that can verify the feature meets requirements
- Implementing feedback mechanisms to assess user satisfaction

**Result**: Features are validated as they're built, ensuring they meet actual user needs.

## Evidence-Based Adaptation Pattern

**Context**: Requirements and user needs can change during development, or initial assumptions may prove incorrect.

**Problem**: Continuing with an approach that's not working or no longer aligned with user needs.

**Solution**: Build in regular evidence collection and adaptation points:
- Scheduled reviews based on metrics and user feedback
- Clear triggers for when to re-evaluate the approach
- Processes for adjusting the implementation based on evidence
- Documentation of decisions and rationales for future reference

**Result**: The implementation can adapt based on real evidence while maintaining alignment with the original intent.

## Minimal Viable Outcome Pattern

**Context**: There's a tendency to over-engineer solutions or implement too many features at once.

**Problem**: Complex implementations are harder to validate and more likely to miss the actual user need.

**Solution**: Focus on delivering the minimal set of capabilities that can achieve the intended outcome:
- Identify the core outcome that needs to be achieved
- Implement the simplest possible solution that could work
- Validate that the solution achieves the outcome
- Iterate and improve based on evidence

**Result**: Faster validation of whether the approach meets user needs with less wasted effort.
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.1] - 2025-10-20

### Added
- Initial Intent-Driven Development (IDD) methodology framework
- Core documentation for intent-capture and outcome measurement
- Project scaffolding and structure following Spec Kit patterns
- Essential files including README, CONTRIBUTING, CODE_OF_CONDUCT, and LICENSE
- Development environment configuration with .devcontainer settings
- Example templates and use cases in the examples directory
- Documentation structure in the docs directory
- Memory system for tracking project context and decisions
- GitHub workflow configurations and issue templates
- CHANGELOG to track all project modifications
- GitHub Actions workflows for automated releases
- Templates packaging and distribution system
- Multi-platform CLI executable builds (Linux, Windows, macOS)
- Official GitHub Actions for release asset uploads
- Template archive creation for all AI agent integrations

### Changed
- Fixed GitHub Actions to use official upload-release-asset action
- Updated template workflow to properly use release upload URLs
- Refined release process to ensure all assets are properly uploaded
- Improved tag-release workflow with proper build steps
- Fixed upload_url error in GitHub Actions workflows
- Fixed PyPI authentication error by commenting out publishing step
- Fixed file path errors in GitHub Actions workflows
- Fixed double 'v' prefix issue in template asset filenames
- Fixed empty version variable issue in GitHub Actions workflows
- Corrected variable assignment timing in templates workflow

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- Fixed upload_url error in GitHub Actions workflows
- Fixed PyPI authentication error by commenting out publishing step
- Corrected action references to use official GitHub actions
- Fixed file path errors in GitHub Actions workflows
- Fixed version extraction issues in release workflows
- Corrected wheel file naming in upload steps
- Fixed double 'v' prefix issue in template asset filenames
- Fixed empty version variable issue in GitHub Actions workflows
- Corrected variable assignment timing in templates workflow

### Security
- N/A

[0.0.1]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.0...v0.0.1
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.18] - 2025-10-20

### Fixed
- Fixed empty version variable issue in GitHub Actions workflows
- Corrected variable assignment timing in templates workflow
- Ensured version variable is available when needed for asset uploads

### Changed
- Improved version extraction consistency across workflows

## [0.0.17] - 2025-10-20

### Fixed
- Fixed GitHub releases already exists error
- Ensured correct version handling in all workflows

### Changed
- Updated CHANGELOG for latest version

## [0.0.16] - 2025-10-20

### Fixed
- Fixed double 'v' prefix issue in template asset filenames
- Corrected asset path references in GitHub Actions workflows
- Improved version extraction consistency across workflows

### Changed
- Updated workflows to use consistent version variable across all steps

## [0.0.15] - 2025-10-20

### Fixed
- Fixed file path errors in GitHub Actions workflows
- Resolved version extraction issues in release workflows
- Corrected wheel file naming in upload steps

### Changed
- Updated GitHub Actions workflows to properly extract version from tag refs
- Improved file path handling for asset uploads

## [0.0.14] - 2025-10-20

### Fixed
- Fixed PyPI authentication error by commenting out publishing step in workflows
- Resolved validation errors in GitHub release creation

### Changed
- Updated GitHub Actions workflows to avoid duplicate release creation
- Improved workflow coordination between release, templates, and CLI publishing

## [0.0.13] - 2025-10-20

### Added
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

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- Fixed upload_url error in GitHub Actions workflows
- Fixed PyPI authentication error by commenting out publishing step
- Corrected action references to use official GitHub actions

### Security
- N/A

[0.0.17]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.16...v0.0.17

[0.0.16]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.15...v0.0.16

[0.0.15]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.14...v0.0.15

[0.0.14]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.13...v0.0.14

[0.0.13]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.12...v0.0.13

## [0.0.12] - 2025-10-20

### Added
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

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- Fixed upload_url error in GitHub Actions workflows
- Fixed PyPI authentication error by commenting out publishing step
- Corrected action references to use official GitHub actions

### Security
- N/A

[0.0.12]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.11...v0.0.12

## [0.0.11] - 2025-10-20

[Previous release content would go here - placeholder for existing v0.0.11 content]

[0.0.11]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.10...v0.0.11

## [0.0.10] - 2025-10-20

[Previous release content would go here - placeholder for existing v0.0.10 content]

[0.0.10]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.9...v0.0.10

## [0.0.9] - 2025-10-20

[Previous release content would go here - placeholder for existing v0.0.9 content]

[0.0.9]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.8...v0.0.9

## [0.0.8] - 2025-10-20

[Previous release content would go here - placeholder for existing v0.0.8 content]

[0.0.8]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.7...v0.0.8

## [0.0.7] - 2025-10-20

[Previous release content would go here - placeholder for existing v0.0.7 content]

[0.0.7]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.6...v0.0.7

## [0.0.6] - 2025-10-20

[Previous release content would go here - placeholder for existing v0.0.6 content]

[0.0.6]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.5...v0.0.6

## [0.0.5] - 2025-10-20

[Previous release content would go here - placeholder for existing v0.0.5 content]

[0.0.5]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.4...v0.0.5

## [0.0.4] - 2025-10-20

[Previous release content would go here - placeholder for existing v0.0.4 content]

[0.0.4]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.3...v0.0.4

## [0.0.3] - 2025-10-20

[Previous release content would go here - placeholder for existing v0.0.3 content]

[0.0.3]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.2...v0.0.3

## [0.0.2] - 2025-10-20

[Previous release content would go here - placeholder for existing v0.0.2 content]

[0.0.2]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.1...v0.0.2

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

### Changed
- N/A

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- N/A

### Security
- N/A

[0.0.1]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.0...v0.0.1
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.2] - 2025-10-20

### Added
- Initial Intent-Driven Development (IDD) methodology framework
- GitHub Actions workflows for automated releases
- Templates packaging and distribution system
- Multi-platform CLI executable builds (Linux, Windows, macOS)

### Changed
- Improved tag-release workflow with proper build steps

### Fixed
- Fixed upload_url error in GitHub Actions workflows
- Fixed PyPI authentication error by commenting out publishing step
- Fixed file path errors in GitHub Actions workflows
- Fixed double 'v' prefix issue in template asset filenames
- Fixed empty version variable issue in GitHub Actions workflows

[0.0.2]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.0...v0.0.2
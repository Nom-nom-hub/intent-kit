# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.9] - 2025-10-20

### Fixed
- Modified update-version.sh to handle detached HEAD state during tag-based releases

## [0.0.8] - 2025-10-20

### Fixed
- Added build module installation to create-release-packages.sh script to ensure build module is available in GitHub Actions environment

## [0.0.7] - 2025-10-20

### Fixed
- Added missing 'build' module dependency to resolve release package creation issue
- Updated version to 0.0.7

## [0.0.6] - 2025-10-20

### Changed
- Updated release workflow to trigger on tag pushes
- Bumped version to 0.0.6

## [0.0.5] - 2025-10-20

### Fixed
- Fixed GitHub Actions workflow to properly handle environment variables in matrix strategy
- Corrected template upload job to use proper dependency outputs

## [0.0.4] - 2025-10-20

### Fixed
- Removed duplicate release workflow to prevent conflicts
- Ensured single release workflow execution

## [0.0.3] - 2025-10-20

### Fixed
- Fixed wheel installation issue in GitHub Actions workflows
- Corrected package installation to use wildcard instead of specific version

[0.0.3]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.2...v0.0.3

## [0.0.2] - 2025-10-20

### Added
- Initial Intent-Driven Development (IDD) methodology framework
- GitHub Actions workflows for automated releases
- Templates packaging and distribution system
- Multi-platform CLI executable builds

[0.0.2]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.1...v0.0.2

## [0.0.1] - 2025-10-20

### Added
- Initial project setup with Intent-Driven Development methodology

[0.0.1]: https://github.com/nom-nom-hub/intent-kit/compare/v0.0.0...v0.0.1
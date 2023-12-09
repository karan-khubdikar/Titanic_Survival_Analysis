# Change Log

All notable changes to this project will be documented in this file.

## Unreleased version 3.0.0

### Added

- In analysis_titanic_survival.ipynb, explanation to why logisitc regression is chosen
- In analysis_titanic_survival.ipynb, explanation to why Ticket ID is dropped despite it appearing to contain information that can be used to train the model

### Changed

- Modification to existing features.

### Removed

- Deprecated features that have been removed.

### Fixed

- Bug fixes.
- For running the docker container, the docker compose file by default is using port 8888. This is usually the default port used by Jupyter which we almost all are already using this port. Assign another port in the docker compose, for more convenience and ease of reproducibility.

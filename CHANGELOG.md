# Change Log

All notable changes to this project will be documented in this file.

## Unreleased version 3.0.0

### Added

- In analysis_titanic_survival.ipynb, explanation to why logisitc regression is chosen
- In analysis_titanic_survival.ipynb, explanation to why Ticket ID is dropped despite it appearing to contain information that can be used to train the model
- In analysis_titanic_survival.ipynb, included a new Summary section as a precursor to our introduction and report - gives a quick overview of the report, reasoning, methods, and results.

### Changed

- Modification to existing features.
- Modifications to analysis_titanic_survival.ipynb, updated reports Introduction section in order to include more reasoning behind our motivation to explore the dataset, and reasoing behind our methods and as to why the analysis uses a single dataset (this is to do with the differences between inference and prediction stated)
- Modification to analysis_titanic_survival.ipynb, as per the changes in the Introduction introducing our methods more indepth, the reasoning behind using an inference approach rather than a predictive approach for the report, and the methods employed due to these choices we explained more clearly. More information related to not using a testing set and various metrics were also explored.
- Modification to README, updated About section in order to give readers an more clear and indepth understanding of the content within the report and project apon first glance of the repo. Information related to data set, motivations, methods, and results were included.

### Removed

- Deprecated features that have been removed.

### Fixed

- Bug fixes.
- For running the docker container, the docker compose file by default is using port 8888. This is usually the default port used by Jupyter which we almost all are already using this port. Assign another port in the docker compose, for more convenience and ease of reproducibility.

# Change Log

All notable changes to this project will be documented in this file.

## Unreleased version 3.0.0

### Added

- In analysis_titanic_survival.ipynb, explanation to why logisitc regression is chosen ([link](https://github.com/UBC-MDS/What-Effects-One-Chance-of-Survival-on-the-Titanic-A-Logistic-Regression-Analysis/pull/71/commits/443803704f54997b2add114e4a9400ede80d6f66)).
- In analysis_titanic_survival.ipynb, explanation to why Ticket ID is dropped despite it appearing to contain information that can be used to train the model ([link](https://github.com/UBC-MDS/What-Effects-One-Chance-of-Survival-on-the-Titanic-A-Logistic-Regression-Analysis/pull/70/commits/d69e3761512384c77a562138258d9d54401de5fa)).
- In analysis_titanic_survival.ipynb, included a new Summary section as a precursor to our introduction and report - gives a quick overview of the report, reasoning, methods, and results ([link](https://github.com/UBC-MDS/What-Effects-One-Chance-of-Survival-on-the-Titanic-A-Logistic-Regression-Analysis/pull/75/commits/848e060525b1459e5ba4e5baee0bcc098ac8be91)).

### Changed

- Modifications to analysis_titanic_survival.ipynb, updated reports Introduction section in order to include more reasoning behind our motivation to explore the dataset, and reasoing behind our methods and as to why the analysis uses a single dataset (this is to do with the differences between inference and prediction stated) ([link](https://github.com/UBC-MDS/What-Effects-One-Chance-of-Survival-on-the-Titanic-A-Logistic-Regression-Analysis/pull/76/commits/bf6c37cc6b9489b1c9929bab272f384c2d382a2a)).
- Modification to analysis_titanic_survival.ipynb, as per the changes in the Introduction introducing our methods more indepth, the reasoning behind using an inference approach rather than a predictive approach for the report, and the methods employed due to these choices we explained more clearly. More information related to not using a testing set and various metrics were also explored ([link](https://github.com/UBC-MDS/What-Effects-One-Chance-of-Survival-on-the-Titanic-A-Logistic-Regression-Analysis/pull/76/commits/bf6c37cc6b9489b1c9929bab272f384c2d382a2a)).
- Modification to README, updated About section in order to give readers an more clear and indepth understanding of the content within the report and project apon first glance of the repo. Information related to data set, motivations, methods, and results were included ([link](https://github.com/UBC-MDS/What-Effects-One-Chance-of-Survival-on-the-Titanic-A-Logistic-Regression-Analysis/pull/77/commits/324073e9283702bbe7732ddbde65f4bc3b4aacab)).
- Updated the report so that the model summary is now showing figure number and the title for the summary. [link](https://github.com/UBC-MDS/What-Effects-One-Chance-of-Survival-on-the-Titanic-A-Logistic-Regression-Analysis/pull/74/commits/615a8d5ebf1a0568958586e4e1b11feb35cc33a7)

### Removed

- Deprecated features that have been removed, older reports have been removed.

### Fixed

- For running the docker container, the docker compose file by default is using port 8888. This is usually the default port used by Jupyter which we almost all are already using this port. Assign another port in the docker compose, for more convenience and ease of reproducibility ([link](https://github.com/UBC-MDS/What-Effects-One-Chance-of-Survival-on-the-Titanic-A-Logistic-Regression-Analysis/pull/72/commits/aae40b94e06677cb8943946e04c41ec96d71ef22)).
- The environment file was updated after milestone 1 feedback where the version numbers for the dependencies were added.[link](https://github.com/UBC-MDS/What-Effects-One-Chance-of-Survival-on-the-Titanic-A-Logistic-Regression-Analysis/pull/51/commits/02ba993a45b2edc805c7d0b210a5510385afd705)
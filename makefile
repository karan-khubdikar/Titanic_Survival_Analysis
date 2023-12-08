all: report/_build/html/index.html

data/Processed/selected_columns.csv: scripts/column_selection_script.R
	Rscript scripts/column_selection_script.R \
	data/Processed/selected_columns.csv
data/Processed/clean_wrangled_titanic_data.csv: scripts/clean_and_organize_script.R data/Processed/selected_columns.csv
	Rscript scripts/clean_and_organize_script.R \
	data/Processed/selected_columns.csv \
	data/Processed/clean_wrangled_titanic_data.csv
results/plots/financial_plot.png results/plots/personal_plot.png: scripts/EDA_scripts.R data/Processed/clean_wrangled_titanic_data.csv
	Rscript scripts/EDA_scripts.R \
	--dataset=data/Processed/clean_wrangled_titanic_data.csv \
	--out_dir=results/plots/
results/models/logistic_model.rds: scripts/fit_logistic_model.R data/Processed/clean_wrangled_titanic_data.csv
	Rscript scripts/fit_logistic_model.R \
	data/Processed/clean_wrangled_titanic_data.csv \
	"Survived" "Pclass + Sex + SibSp + Parch + Fare + AgeGroup" results/models
results/models/model_summary_table.csv: scripts/generate_result.R results/models/logistic_model.rds
	Rscript ./scripts/generate_result.R \
	--model_file=results/models/logistic_model.rds \
	--out_dir=results/models

report/_build/html/index.html:report/analysis_titanic_survival.ipynb \
report/_config.yml \
report/_toc.yml \
data/Processed/selected_columns.csv \
data/Processed/clean_wrangled_titanic_data.csv \
results/plots/financial_plot.png \
results/plots/personal_plot.png \
results/models/logistic_model.rds \
results/models/model_summary_table.csv
	jupyter-book build report

clean:
	rm -f data/Processed/selected_columns.csv
	rm -f data/Processed/clean_wrangled_titanic_data.csv
	rm -f results/plots/financial_plot.png
	rm -f results/plots/personal_plot.png
	rm -f ./results/models/logistic_model.rds
	rm -f ./results/models/model_summary_table.csv
	rm -f ./results/models/model_summary_table.rds



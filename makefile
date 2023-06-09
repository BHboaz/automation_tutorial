all: plot_antwerp.PDF plot_all.PDF



reviews.cvs listings.csv: download_data.R
		R --vanilla < download_data.R

aggregated_df.csv: research_project.R reviews.cvs listings.csv
		R --vanilla < research_project.R
		
pivot_table.csv: export_pivot.R aggregated_df.csv
		R --vanilla < export_pivot.R

plot_antwerp.PDF: plot_antwerp.R pivot_table.csv
		R --vanilla < plot_antwerp.R
		
plot_all.PDF: aggregated_df.csv plot_all.R
		R --vanilla < plot_all.R

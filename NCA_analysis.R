library(ubiquity)
library(rhandsontable)
library(tidyverse)
library(flextable)
fr = workshop_fetch(section="NCA", overwrite=TRUE)


cfg = build_system()
fr = system_fetch_template(cfg, template = "NCA")


# Single Dose -------------------------------------------------------------

cfg = build_system(system_file="system.txt")
cfg = system_load_data(cfg, dsname     = "PKDATA", 
                       data_file  = "pk_all_sd.csv")

table_PKDATA<-as_tibble(cfg$data$PKDATA$values)
table_PKDATA |>
  filter(ID==22)



cfg = system_nca_run(cfg,  dsname        = "PKDATA", 
                     dscale        = 1e6, 
                     analysis_name = "pk_single_dose", 
                     extrap_C0     = FALSE, 
                     dsmap         = list(TIME    = "TIME_HR", 
                                          NTIME   = "TIME_HR", 
                                          CONC    = "C_ng_ml", 
                                          DOSE    = "DOSE",
                                          ROUTE   = "ROUTE", 
                                          ID      = "ID"),
                     NCA_options   = list(max.aucinf.pext  = 10) )

NCA_results = system_fetch_nca(cfg, analysis_name = "pk_single_dose")
View(NCA_results)



nca_cols = system_fetch_nca_columns(cfg, "pk_single_dose")
rhandsontable(nca_cols[["NCA_col_summary"]],  width="100%", height=200)


###Authomated reporting
cfg = system_rpt_read_template(cfg, template="PowerPoint")
cfg = system_rpt_add_slide(cfg, 
                           template = "title_slide",
                           elements = list( title= list(content = "NCA Single Dose PK", type    = "text")))
cfg = system_rpt_nca(cfg=cfg, analysis_name="pk_single_dose")
system_rpt_save_report(cfg=cfg, output_file=file.path("output","pk_single_dose-report.pptx"))







nca_table_30 = system_nca_summary(cfg, 
                               analysis_name    = "pk_single_dose",
                               params_include   = c( "ID", "cmax", "tmax", "half.life", "auclast"),
                               params_header    = list(cmax = c( "<label>", "(ng/ml)")),
                               ds_wrangle       = "NCA_sum = NCA_sum %>% dplyr::filter(Dose == 30)",
                               summary_stats    = list("<MEAN> (<STD>)" = c("auclast", "half.life"),
                                                       "<MEDIAN>"       = c("tmax")), 
                               summary_labels   = list(MEAN             = "Mean", 
                                                       STD              = "Std Dev", 
                                                       N                = "N obs",
                                                       MEDIAN           = "Median", 
                                                       SE               = "Std Err."),
                               summary_location = "ID")

nca_table_30[["vignette"]] = set_table_properties(nca_table_30$nca_summary_ft,layout = "autofit")





nca_table_120 = system_nca_summary(cfg, 
                                  analysis_name    = "pk_single_dose",
                                  params_include   = c( "ID", "cmax", "tmax", "half.life", "auclast"),
                                  params_header    = list(cmax = c( "<label>", "(ng/ml)")),
                                  ds_wrangle       = "NCA_sum = NCA_sum %>% dplyr::filter(Dose == 120)",
                                  summary_stats    = list("<MEAN> (<STD>)" = c("auclast", "half.life"),
                                                          "<MEDIAN>"       = c("tmax")), 
                                  summary_labels   = list(MEAN             = "Mean", 
                                                          STD              = "Std Dev", 
                                                          N                = "N obs",
                                                          MEDIAN           = "Median", 
                                                          SE               = "Std Err."),
                                  summary_location = "ID")

nca_table_120[["vignette"]] = set_table_properties(nca_table_120$nca_summary_ft,layout = "autofit")








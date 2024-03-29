rm(list=ls())
library(IQnca)
IQRinitCompliance("run.R")

# The hardest part is to get all the information out of always different winnonlin files :-)
# Good thing is that IQnca uses a standard data format which is easy to understand and easy to fill in.
dataOrig <- readxl::read_excel("IV_bolus_dose.xls")
dataOrig <- dataOrig[-1,]
data <- data.frame(
  USUBJID = dataOrig$Subject,
  STUDYID = "Example Study",
  COMPOUND = "Test Drug",
  ANALYTE = "Test Drug",
  MATRIX = "Plasma",
  PROFILE = "Single Bolus Dose (SD)",
  PROFTYPE = "SD",
  GROUP = "10000 ug",
  GROUPN = 10000,
  GROUPU = "ug",
  DAY = NA,
  ATIME = NA,
  NTIME = as.numeric(dataOrig$Time),
  TIMEUNIT = "Minutes",
  ACONC = as.numeric(dataOrig$Conc),
  CONCUNIT = "ng/mL",
  LLOQ = 0, # Faking LLOQ
  ADM = "Bolus",
  DOSE = as.numeric(dataOrig$Dose),
  DOSEUNIT = "ug",
  stringsAsFactors = FALSE
)

# Importing the data, setting the options
dataNCA <- IQdataNCA(data,FLAGTIME = "nominal",AUCMETHD = "LinearUp LogDown")

# Exporting the data ... some col names certainly do not 100% match the ad requirements but that
# is something that can be fixed later. Currently at least colnames are not longer than 8 chars.
# A define file is not yet generated but will do so soon.
export_IQdataNCA(data = dataNCA,filename = "RESULTS/adnca",CSV = TRUE,ADNCA = TRUE)

# Just running the NCA ... no options provided here ... all options are stored in the input data.
# Essentially the input data contains all information to even automatically write out a full report ...
# with methods section etc.
result <- nca_IQdataNCA(data = dataNCA)

# Export of results in pretty much the same format as the Winnonlin Excel files. We just use CSV instead
# of Excel format. The same function will be able to export adpp.xpt and a define file ... its on the list
# it is easy ... but time is limited. Default export is CSV.
export_IQnca(data = result,filename = "RESULTS/Results_pivoted")


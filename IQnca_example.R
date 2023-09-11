library(tidyverse)
library(IQnca)



# Load the data set
dataOrig <-  readxl::read_excel("/home/francesco/Documents/DataAnalysis/R_NCA_admiral/IntiQuan/IQnca/examples/03_book_examples/Example_2/IV_Infusion_Single_Dose.xls")

dataOrig <- dataOrig[-1,]


data <- data.frame(
  USUBJID  = dataOrig$ID,
  STUDYID  = "Study Y",
  COMPOUND = "Drug B",
  ANALYTE  = "Drug B",
  MATRIX   = "Plasma",
  PROFILE  = "Single IV Infusion Dose (SD)",
  PROFTYPE = "SD",
  GROUP    = paste0(dataOrig$Dose, "mg/m2"),
  GROUPN   = as.numeric(dataOrig$Dose),
  GROUPU   = "mg/m2",
  DAY      = NA,
  ATIME    = as.numeric(dataOrig$Actual_time),
  NTIME    = as.numeric(dataOrig$Nominal_time),
  TIMEUNIT = "Hours",
  # Here the replacement of BLQ values by a value smaller than the LLOQ
  ACONC = {
    x <- dataOrig$Conc
    x[grepl("BLQ", x)] <- 0
    as.numeric(x)
  },
  CONCUNIT = "ug/mL",
  LLOQ     = 5,
  ADM      = "Infusion",
  DOSE     = as.numeric(dataOrig$Dose_1),
  DOSEUNIT = "mg",
  NDUR     = 2,
  ADUR     = NA,
  SEX      = dataOrig$Sex,
  AGE      = dataOrig$Age,
  stringsAsFactors = FALSE
)

# Rounding the small deviation
# (Rounding is not necessary but improves the presentation)
data[, c("ATIME", "ACONC")] <- round(data[, c("ATIME", "ACONC")], digits = 2)



# Also add manually the actual duration of the infusion 
# which is not included in the data set 
# (see the "Dosing_Used.xls" data set in the same folder)
data$ADUR[data$USUBJID == 1] <- 1.83
data$ADUR[data$USUBJID == 2] <- 2.17
data$ADUR[data$USUBJID == 3] <- 2.07
data$ADUR[data$USUBJID == 4] <- 2.67
data$ADUR[data$USUBJID == 5] <- 3.67
data$ADUR[data$USUBJID == 6] <- 2.5




dataNCA <- IQdataNCA(data, 
                     FLAGTIME = "nominal",
                     AUCMETHD = "Linear Log", 
                     FLGBLQPR = "LLOQ/2", 
                     FLGBLQIN = "asis", 
                     FLGBLQP1 = "0", 
                     FLGBLQPO = "0")


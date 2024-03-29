library(IQnca)
rm(list=ls())

# -------------------------------------------------------------------------#
# Import data ----
# -------------------------------------------------------------------------#
data <- as.data.frame(Indometh)
data$Subject <- as.numeric(as.character(data$Subject))
names(data) <- c("USUBJID","NTIME","ACONC")
data$DOSE <- 25 # Same dose as in reference used
data$STUDYID <- "Indometh R dataset"
data$COMPOUND <- "Indometh"
data$ANALYTE <- "Indometh"
data$MATRIX <- "Plasma"
data$PROFILE <- "Single dose profile"
data$PROFTYPE <- "SD"
data$GROUP <- "25 mg SD"
data$GROUPN <- "25"
data$GROUPU <- "mg"
data$DAY <- 1
data$ATIME <- NA
data$TIMEUNIT <- "Hours"
data$CONCUNIT <- "ug/mL"
data$LLOQ <- 0
data$ADM <- "Infusion"
data$DOSEUNIT <- "mg"
data$NDUR <- 0.25
data$ADUR <- NA

# -------------------------------------------------------------------------#
# Create IQdataNCA dataset ----
# -------------------------------------------------------------------------#

cat("Indometh Log Infusion\n")

dataNCA <- IQdataNCA(data = data,FLAGTIME = "nominal",AUCMETHD = "LinearUp LogDown")

resNCA <- nca_IQdataNCA(dataNCA)

resNCA


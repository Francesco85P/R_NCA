library(tidyverse)
library(IQnca)
examples_IQnca(path = "~/IntiQuan/IQnca")
setwd("examples/03_book_examples/Example_2/")
dataFile <- "IV_Infusion_Single_Dose.xls"
dataOrig <- readxl::read_excel(dataFile)
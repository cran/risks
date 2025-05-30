## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load, message = FALSE----------------------------------------------------
library(risks)  # provides riskratio(), riskdiff(), postestimation functions
library(dplyr)  # For data handling
library(broom)  # For tidy() model summaries
data(breastcancer)

## ----selectapproach-----------------------------------------------------------
riskratio(formula = death ~ stage + receptor, 
          data = breastcancer, 
          approach = "glm_startp")

## ----allmodels----------------------------------------------------------------
fit_all <- riskratio(formula = death ~ stage + receptor, 
                     data = breastcancer, 
                     approach = "all")
summary(fit_all)

## ----allmodels2---------------------------------------------------------------
tidy(fit_all) %>%
  select(-statistic, -p.value) %>%
  print(n = 50)


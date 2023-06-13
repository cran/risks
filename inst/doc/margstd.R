## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load, message = FALSE----------------------------------------------------
library(risks)  # provides riskratio(), riskdiff(), postestimation functions
library(dplyr)  # For data handling
library(broom)  # For tidy() model summaries
data(breastcancer)

## ----margstd------------------------------------------------------------------
fit_margstd <- riskdiff(formula = death ~ stage + receptor, 
                        data = breastcancer, 
                        approach = "margstd_delta")
summary(fit_margstd)

## ----margstd2-----------------------------------------------------------------
fit_margstd2 <- riskdiff(formula = death ~ stage + receptor, 
                         data = breastcancer, 
                         approach = "margstd_delta", variable = "receptor")
summary(fit_margstd2)

## ----margstd_bootverbose------------------------------------------------------
fit_margstd3 <- riskdiff(formula = death ~ stage + receptor, 
                         data = breastcancer, 
                         approach = "margstd_boot")
summary(fit_margstd3)

tidy(fit_margstd3, bootverbose = TRUE) %>%
  select(-statistic, -p.value)  # allow the other columns to get printed instead


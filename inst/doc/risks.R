## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----cran_install, eval = FALSE-----------------------------------------------
# install.packages("risks")

## ----github_install, eval = FALSE---------------------------------------------
# remotes::install_github("stopsack/risks")

## ----load, message = FALSE----------------------------------------------------
library(risks)  # provides riskratio(), riskdiff(), postestimation functions
library(dplyr)  # For data handling
library(broom)  # For tidy() model summaries

data(breastcancer)  # Load sample data

breastcancer %>%  # Display the sample data
  group_by(receptor, stage) %>% 
  summarize(
    deaths = sum(death), 
    total = n(), 
    risk = deaths / total
  )

## ----basic--------------------------------------------------------------------
fit_rr <- riskratio(
  formula = death ~ stage + receptor, 
  data = breastcancer
)
summary(fit_rr)

## ----basic2-------------------------------------------------------------------
fit_rd <- riskdiff(
  formula = death ~ stage + receptor, 
  data = breastcancer
)
summary(fit_rd)

## ----basic3-------------------------------------------------------------------
tidy(fit_rd)

## ----basic4-------------------------------------------------------------------
tidy(
  fit_rr, 
  exponentiate = TRUE
)


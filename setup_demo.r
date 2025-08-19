# setup_demo.R
# Installs (if needed) and loads required packages, then writes a SETUP_INSTRUCTIONS file.

required_pkgs <- c("tidyverse", "maps")

# Install missing packages
to_install <- required_pkgs[!vapply(required_pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(to_install)) {
  repos <- getOption("repos")
  if (is.null(repos) || identical(repos, c(CRAN="@CRAN@"))) {
    # Use Posit Package Manager by default if CRAN repo not set
    options(repos = c(CRAN = "https://packagemanager.posit.co/cran/latest"))
  }
  install.packages(to_install)
}

# Load packages quietly
invisible(lapply(required_pkgs, function(p) {
  suppressPackageStartupMessages(library(p, character.only = TRUE))
}))

# SETUP_INSTRUCTIONS

# 1) Set your working directory
# - In the **Files** pane, **left-click** the folder that contains the demo data.
# - Choose **Set As Working Directory → In Active Console**.


# Title: SoupX Ambient RNA Contamination Replication Project
# Framework: Droplet-based single-cell RNA sequencing data decontamination

# 1. Environment Setup
if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")
if (!requireNamespace("Matrix", quietly = TRUE)) install.packages("Matrix")
if (!requireNamespace("SoupX", quietly = TRUE)) remotes::install_github("constantAmateur/SoupX")
library(SoupX)

# 2. Load Native Data
data(PBMC5k_Demo) 
sc = SoupChannel(PBMC5k_Demo$tod, PBMC5k_Demo$toc)

# 3. Execution Pipeline
sc = setClusters(sc, setNames(PBMC5k_Demo$clusters$Cluster, rownames(PBMC5k_Demo$clusters)))
sc = autoEstCont(sc, forceAccept = TRUE)

# 4. Final Empirical Output
rho_value = sc$fit$rhoEst
print(paste("Replicated Global Contamination Fraction (Rho):", round(rho_value, 4)))

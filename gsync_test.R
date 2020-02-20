library(gsynth)
library(panelView)

setwd("~/git_repo/test")
df = read.table("./data/test.csv", header=TRUE, sep=',')
head(df)

panelView(feat ~ TREATMENT, data = df,  index = c("YR","WK"), pre.post = TRUE) 

panelView(feat ~ TREATMENT, data = df,  index = c("YR","WK"),
          type = "outcome", main = "Test", by.group = TRUE)

panelView(feat ~ TREATMENT, data = df,  index = c("YR","WK"), type = "outcome") 

out = NULL

out <- gsynth(feat ~ TREATMENT, data = df, index = c("YR","WK"), 
              force = "time", 
              CV = FALSE, r = c(0, 5), se = TRUE, inference = "parametric", 
              nboots = 1000, parallel = FALSE)

## print out estimates
out$est.att
out$est.avg
out$est.beta

## gap plot
plot(out) # by default

plot(out, theme.bw = TRUE) # black/white theme

plot(out, type = "counterfactual", raw = "band", xlab = "Time",  theme.bw = TRUE)

plot(out,type="counterfactual", raw = "all")

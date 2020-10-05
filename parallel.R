.libPaths('/home/runner/work/R-pkg/R/library/')
library("foreach")
library("doParallel")

registerDoParallel()
set.seed(100)

system.time(foreach (i = 1:4) %dopar% {
            a = replicate(100, rnorm(100))
            d = determinant(a)})

doParallel::stopImplicitCluster()

.libPaths('/home/travis/build/MitsuhaMiyamizu/R-MKL/R/library/')
install.packages("foreach", repos='https://cloud.r-project.org/')
install.packages("doParallel", repos='https://cloud.r-project.org/')
library("foreach")
library("doParallel")

registerDoParallel()
set.seed(100)

system.time(foreach (i = 1:4) %dopar% {
            a = replicate(10000, rnorm(10000))
            d = determinant(a)})

doParallel::stopImplicitCluster()

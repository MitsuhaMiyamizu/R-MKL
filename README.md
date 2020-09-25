# R-MKL
Experimental compiled binary of R with performance improvement by MKL.

# Build Status

[![Build Status](https://travis-ci.com/MitsuhaMiyamizu/R-MKL.svg?branch=master)](https://travis-ci.com/MitsuhaMiyamizu/R-MKL)

# Inspired by

https://software.intel.com/content/www/us/en/develop/articles/using-intel-mkl-with-r.html

https://github.com/alexisph/high_performance_r

https://gist.github.com/cheuerde/8fb9fd0dc8c0eca17c16

https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=r-mkl

https://blog.ajsuarez.com/posts/compiling-r-icc-mkl/

# Troubleshooting

https://community.intel.com/t5/Intel-C-Compiler/Error-when-compiling-R-from-source-code-ubuntu-18-04/td-p/1176401

https://aur.archlinux.org/packages/r-mkl/

```
using icc to build it by uncomment the line # _CC="icc" and get:

...
icc -I../../src/extra -I/usr/include/tirpc -I. -I../../src/include -I../../src/include  -D_FORTIFY_SOURCE=2 -I../../src/nmath -DHAVE_CONFIG_H   -fopenmp -fpic  -O3 -fPIC -m64 -march=native -fp-model precise -fp-model source -I/opt/intel/mkl/include  -c arithmetic.c -o arithmetic.o
arithmetic.c(61): warning #274: declaration is not visible outside of function
  int matherr(struct exception *exc)
                     ^

arithmetic.c(63): error: pointer to incomplete class type is not allowed
      switch (exc->type) {
              ^

arithmetic.c(64): error: identifier "DOMAIN" is undefined
      case DOMAIN:
           ^

arithmetic.c(65): error: identifier "SING" is undefined
      case SING:
           ^

arithmetic.c(68): error: identifier "OVERFLOW" is undefined
      case OVERFLOW:
           ^

arithmetic.c(71): error: identifier "UNDERFLOW" is undefined
      case UNDERFLOW:
           ^

arithmetic.c(72): error: pointer to incomplete class type is not allowed
    exc->retval = 0.0;
    ^

compilation aborted for arithmetic.c (code 2)
...
in build(). EDIT: according to this, use

sed -i '/^#undef HAVE_MATHERR/d' src/include/config.h
between configure and make will make it work.
```

\name{KWON2.IDX}
\alias{KWON2.IDX}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
KWON2 index
}
\description{
Computes the KWON2 (S. H. Kwon et al., 2021) index for a result of either FCM or EM clustering from user specified \code{cmin} to \code{cmax}.
}

\usage{
KWON2.IDX(x, cmax, cmin = 2, method = "FCM", fzm = 2, nstart = 20, iter = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a numeric data frame or matrix where each column is a variable to be used for cluster analysis and each row is a data point.
}
  \item{cmax}{a maximum number of clusters to be considered.
}
  \item{cmin}{a minimum number of clusters to be considered. The default is \code{2}.
}
  \item{method}{a character string indicating which clustering method to be used ("\code{FCM}" or "\code{EM}")
}
  \item{fzm}{a number greater than 1 giving the degree of fuzzification for \code{method = "FCM"}. The default is \code{2}.
}
  \item{nstart}{a maximum number of initial random sets for FCM for \code{method = "FCM"}. The default is \code{20}.
}
  \item{iter}{a maximum number of iterations for \code{method = "FCM"}. The default is \code{100}.
}
}
\details{
\tabular{lc}{
    KWON2 is defined as \cr
   \tab \eqn{KWON2(c) = \dfrac{w_1\left[w_2\sum_{j=1}^c\sum_{i=1}^n \mu_{ij}^{2^{\sqrt{\frac{m}{2}}}}  \|{x}_i-{v}_j\|^2  + \dfrac{\sum_{j=1}^c\| {v}_j-{v}_0\|^2}{\max_j \|{v}_j-{v}_0\|^2 } + w_3 \right]}{\min_{i \neq j} \| {v}_i-{v}_j\|^2 + \frac{1}{c}+\frac{1}{c^m-1}}
}
}
where \eqn{w_1 = \frac{n-c+1}{n}}, \eqn{w_2 = \left(\frac{c}{c-1}\right)^{\sqrt{2}}} and \eqn{w_3=\frac{nc}{(n-c+1)^2}}.\cr\cr
The smallest value of  \eqn{KWON2(c)} indicates a valid optimal partition.\cr
}
\value{
  \item{KWON2}{the KWON2 index for \code{c} from \code{cmin} to \code{cmax} shown in a data frame where the first and the second columns are \code{c} and the KWON2 index, respectively.}
}
\references{
S. H. Kwon, J. Kim, and S. H. Son, “Improved cluster validity index
for fuzzy clustering,” Electronics Letters, vol. 57, no. 21, pp. 792–794,
2021. \url{https://doi.org/10.1049/ell2.12249}
}
\author{
Nathakhun Wiroonsri and Onthada Preedasawakul
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\link{R1_data}, \link{KWON.IDX}, \link{FzzyCVIs}, \link{WP.IDX}}

\examples{
# ---- FCM algorithm ----
# The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.
x = R1_data[,1:2]

# Compute KWON index
FCM.KWON2 = KWON2.IDX(scale(x), cmax = 15, cmin = 2, method = "FCM",
  fzm = 2, nstart = 20, iter = 100)
print(FCM.KWON2)
# The optimal number of cluster
FCM.KWON2[which.min(FCM.KWON2$KWON2),]

# ---- EM algorithm ----
# The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.
x = R1_data[,1:2]

# Compute KWON index
EM.KWON2 = KWON2.IDX(scale(x), cmax = 15, cmin = 2, method = "EM",
  nstart = 20, iter = 100)
print(EM.KWON2)
# The optimal number of cluster
EM.KWON2[which.min(EM.KWON2$KWON2),]
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.

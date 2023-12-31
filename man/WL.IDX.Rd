\name{WL.IDX}
\alias{WL.IDX}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Wu and Li (WL) index
}
\description{
Computes the WL (C. H. Wu et al., 2015) index for a result of either FCM or EM clustering from user specified \code{cmin} to \code{cmax}.
}
\usage{
WL.IDX(x, cmax, cmin = 2, method = "FCM", fzm = 2, nstart = 20, iter = 100)
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
    The WL index is defined as \cr
   \tab \eqn{WL(c) = \dfrac{\sum_{j=1}^c\left(\dfrac{\sum_{i=1}^n\mu_{ij}^2\| {x}_i-{v}_j\|^2}{\sum_{i=1}^n\mu_{ij}}\right)}{\min_{j \neq k}\{\| {v}_j-{v}_k\|^2\} +\text{median}_{j \neq k }\{\| {v}_j-{v}_k\|^2\}}} \cr\cr
}
The smallest value of \code{WL(c)} indicates a valid optimal partition.\cr
}
\value{
\item{WL}{the WL index for \code{c} from \code{cmin} to \code{cmax} shown in a data frame where the first and the second columns are \code{c} and the WL index, respectively.}
}
\references{
C. H. Wu, C. S. Ouyang, L. W. Chen, and L. W. Lu, “A new
fuzzy clustering validity index with a median factor for centroid-based clustering,” IEEE Transactions on Fuzzy Systems, vol. 23, no. 3, pp. 701–718, 2015.\url{https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6811211&isnumber=7115244}
}
\author{
Nathakhun Wiroonsri and Onthada Preedasawakul
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\link{R1_data}, \link{KWON2.IDX}, \link{FzzyCVIs}, \link{WP.IDX}}
\examples{
# ---- FCM algorithm ----
# The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.
x = R1_data[,1:2]

# Compute WL index
FCM.WL = WL.IDX(scale(x), cmax = 15, cmin = 2, method = "FCM",
  fzm = 2, nstart = 20, iter = 100)
print(FCM.WL)
# The optimal number of cluster
FCM.WL[which.min(FCM.WL$WL),]

# ---- EM algorithm ----
# The data is from the FuzzyDatasets package (https://github.com/O-PREEDASAWAKUL/FuzzyDatasets). It is also available in this package.
x = R1_data[,1:2]

# Compute WL index
EM.WL = WL.IDX(scale(x), cmax = 15, cmin = 2, method = "EM",
  nstart = 20, iter = 100)
print(EM.WL)
# The optimal number of cluster
EM.WL[which.min(EM.WL$WL),]
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

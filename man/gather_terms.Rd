% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gather_terms.R
\name{gather_terms}
\alias{gather_terms}
\title{Gather terms from a tidy data frame of parameter samples into a single column}
\usage{
gather_terms(data, ignore_columns = "^\\\\..*")
}
\arguments{
\item{data}{A data frame with parameter/term names spread across columns, such as one returned by
\code{\link{as_sample_tibble}} or \code{\link{spread_samples}}.}

\item{ignore_columns}{A regular expression that matches column names to ignore in the gather. The
default ignores columns that start with \code{"."}.}
}
\value{
A data frame.
}
\description{
Given a data frame such as might be returned by as_sample_tibble or spread_samples,
gather terms and their estimates from that data frame into a term and estimate column.
}
\details{
This function gather every column except grouping columns and those matching the regular expression
\code{ignore_columns} into key/value columns \code{"term"} and \code{"estimate"}.

This function uses \code{"term"} and \code{"estimate"} instead of names like \code{"parameter"}
and \code{"value"} in order to be consistent with the naming scheme of \code{\link[broom]{tidy}}.

Imagine a data frame \code{data} as returned by \code{spread_samples(fit, a[i], b[i,v])}, like this:
\itemize{
     \item column \code{".chain"}: the chain number
     \item column \code{".iteration"}: the interation number
     \item column \code{"i"}: value in \code{1:5}
     \item column \code{"v"}: value in \code{1:10}
     \item column \code{"a"}: value of \code{"a[i]"} for iteration number
         \code{".iteration"} on chain number \code{".chain"}
     \item column \code{"b"}: value of \code{"b[i,v]"} for iteration number
         \code{".iteration"} on chain number \code{".chain"}
 }

\code{gather_terms(data)} on that data frame would return a grouped
data frame (grouped by \code{i} and \code{v}), with:
\itemize{
     \item column \code{".chain"}: the chain number
     \item column \code{".iteration"}: the interation number
     \item column \code{"i"}: value in \code{1:5}
     \item column \code{"v"}: value in \code{1:10}
     \item column \code{"term"}: value in \code{c("a", "b")}.
     \item column \code{"estimate"}: value of \code{"a[i]"} (when \code{"term"} is \code{"a"};
         repeated for every value of \code{"v"}) or \code{"b[i,v]"} (when \code{"term"} is
         \code{"b"}) for iteration number \code{".iteration"} on chain number \code{".chain"}
 }

In this example, this call:

\preformatted{gather_terms(data)}

Is roughly equivalent to:

\preformatted{data \%>\%
  gather(term, estimate, -c(.chain, .iteration, i, v)) \%>\%
  group_by(term, add = TRUE)
}
}
\examples{
\dontrun{
library(dplyr)

data(RankCorr, package = "tidybayes")

RankCorr \%>\%
  spread_samples(b[i,v], tau[i]) \%>\%
  gather_terms() \%>\%
  mean_qi()

# the first three lines below are roughly equivalent to ggmcmc::ggs(RankCorr)
RankCorr \%>\%
  as_sample_tibble() \%>\%
  gather_terms() \%>\%
  mean_qi()
}
}
\seealso{
\code{\link{spread_samples}}, \code{\link{as_sample_tibble}}.
}
\author{
Matthew Kay
}
\keyword{manip}

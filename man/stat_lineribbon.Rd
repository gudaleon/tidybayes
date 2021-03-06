% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stat_lineribbon.R
\name{stat_lineribbon}
\alias{stat_lineribbon}
\title{Line + multiple probability ribbon stat for ggplot}
\usage{
stat_lineribbon(mapping = NULL, data = NULL, geom = "lineribbon",
  position = "identity", ..., point.interval = median_qi,
  fun.data = point.interval, .prob = c(0.5, 0.8, 0.95), fun.args = list(),
  na.rm = FALSE, show.legend = NA, inherit.aes = TRUE)
}
\arguments{
\item{mapping}{The aesthetic mapping, usually constructed with
\code{\link{aes}} or \code{\link{aes_string}}. Only needs to be set at the
layer level if you are overriding the plot defaults.}

\item{data}{A layer specific dataset - only needed if you want to override
the plot defaults.}

\item{geom}{Use to override the default connection between
\code{geom_lineribbon} and \code{stat_lineribbon}.}

\item{position}{The position adjustment to use for overlapping points on this layer.}

\item{...}{Other arguments passed to \code{\link{layer}}. They may also be parameters to the paired geom.}

\item{point.interval}{Alias for \code{fun.data}}

\item{fun.data}{A function that is given a vector and should return a data frame with variables \code{y}, \code{ymin}
and \code{ymax}. See the \code{point_interval} family of functions.}

\item{.prob}{The \code{.prob} argument passed to \code{fun.data}.}

\item{fun.args}{Other optional arguments passed to \code{fun.data}.}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with a warning. If \code{TRUE}, missing
values are silently removed.}

\item{show.legend}{Should this layer be included in the legends? \code{NA}, the default, includes if any aesthetics
are mapped. \code{FALSE} never includes, and \code{TRUE} always includes.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics, rather than combining with them. This is
most useful for helper functions that define both data and aesthetics and shouldn't inherit behaviour from the
default plot specification, e.g. borders.}
}
\description{
A combination of \code{\link{stat_summary}} and \code{\link{geom_lineribbon}} with sensible defaults.
While \code{geom_lineribbon} is intended for use on data frames that have already been summarized using
a \code{\link{point_interval}} function, \code{stat_lineribbon} is intended for use directly on data
frames of samples, and will perform the summarization using a \code{\link{point_interval}} function.
}
\examples{

library(dplyr)
library(ggplot2)

data_frame(x = 1:10) \%>\%
  group_by_all() \%>\%
  do(data_frame(y = rnorm(100, .$x))) \%>\%
  ggplot(aes(x = x, y = y)) +
  stat_lineribbon() +
  scale_fill_brewer()

}
\seealso{
See \code{\link{geom_lineribbon}} for the geom version, intended for use on estimates/intervals that have
already been summarized using a \code{\link{point_interval}} function. See \code{\link{stat_pointinterval}} /
\code{\link{stat_pointintervalh}} for a similar stat intended for point estimates and intervals.
}

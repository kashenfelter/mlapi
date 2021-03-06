#' @name mlapiEstimator
#'
#' @title Base abstract class for all classification/regression models
#' @description Base class for all estimators.
#' Defines minimal set of members and methods(with signatires) which have to be implemented in child classes.
#' @format \code{R6Class} object.
#' @section Methods:
#' \describe{
#'   \item{\code{$fit(x, y, ...)}}{}
#'   \item{\code{$predict(x, ...)}}{Makes predictions on new data (after model was trained)}
#'}
#' @section Arguments:
#' \describe{
#'  \item{x}{A matrix like object, should \bold{inherit from \code{Matrix} or \code{matrix}}.
#'  Allowed classes should be defined in child classes.}
#'  \item{y}{target - usually \code{vector}, but also can be a matrix like object.
#'  Allowed classes should be defined in child classes.}
#'  \item{...}{additional parameters \bold{with default values}}
#' }
#' @export
mlapiEstimator = R6::R6Class(
  classname = "mlapiEstimator",
  inherit = mlapiBase,
  public = list(
    fit = function(x, y, ...) raise_placeholder_error(),
    predict = function(x, ...) raise_placeholder_error()
  )
)
#---------------------------------------------------------------------------------------
#' @name mlapiEstimatorOnline
#'
#' @title Base abstract class for all classification/regression models
#' which can be \bold{trained incremendally} (online)
#' @description Base class for all online estimators. This class inherits from \link{mlapiEstimator} and
#' additionally requires to implement \code{$partial_fit(x, y, ...)} method. Idea is that user can pass
#' \code{x, y} in chunks and model will be updated/refined incrementally.
#' @format \code{R6Class} object.
#' @section Methods:
#' \describe{
#'   \item{\code{$fit(x, y, ...)}}{}
#'   \item{\code{$partial_fit(x, y, ...)}}{}
#'   \item{\code{$predict(x, ...)}}{Makes predictions on new data (after model was trained)}
#'}
#' @section Arguments:
#' \describe{
#'  \item{x}{A matrix like object, should \bold{inherit from \code{Matrix} or \code{matrix}}.
#'  Allowed classes should be defined in child classes.}
#'  \item{y}{target - usually \code{vector}, but also can be a matrix like object.
#'  Allowed classes should be defined in child classes.}
#'  \item{...}{additional parameters \bold{with default values}}
#' }
#' @export
mlapiEstimatorOnline <- R6::R6Class(
  classname = "mlapiEstimatorOnline",
  inherit = mlapiEstimator,
  public = list(
    partial_fit = function(x, y, ...) raise_placeholder_error()
    # has to dump inpternal model representation to R object in order to be able to load it in future
    # for example internally model can keep data out of R's heap and have external pointer to it
    # dump = function() raise_placeholder_error(),
    # load data from dump to internal representation - ie load data to internal out of heap data structures
    # load = function(model) raise_placeholder_error()

  )
)

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nlp_flow.R
\name{dtm_remove_terms}
\alias{dtm_remove_terms}
\title{Remove terms from a Document-Term-Matrix and keep only documents which have a least some terms}
\usage{
dtm_remove_terms(dtm, terms, remove_emptydocs = TRUE)
}
\arguments{
\item{dtm}{an object returned by \code{\link{document_term_matrix}}}

\item{terms}{a character vector of terms which are in \code{colnames(dtm)} and which should be removed}

\item{remove_emptydocs}{logical indicating to remove documents containing no more terms after the term removal is executed. Defaults to \code{TRUE}.}
}
\value{
a sparse Matrix as returned by \code{sparseMatrix} 
where the indicated terms are removed as well as documents with no terms whatsoever
}
\description{
Remove terms from a Document-Term-Matrix and keep only documents which have a least some terms
}
\examples{
data(brussels_reviews_anno)
x <- subset(brussels_reviews_anno, xpos == "NN")
x <- x[, c("doc_id", "lemma")]
x <- document_term_frequencies(x)
dtm <- document_term_matrix(x)
dim(dtm)
x <- dtm_remove_terms(dtm, terms = c("appartement", "casa", "centrum", "ciudad"))
dim(x)
x <- dtm_remove_terms(dtm, terms = c("appartement", "casa", "centrum", "ciudad"), 
                      remove_emptydocs = FALSE)
dim(x)
}

uni_df <- readRDS("./ngrams/unigrams.Rdata")
bi_df <- readRDS("./ngrams/bigrams.Rdata")
tri_df <- readRDS("./ngrams/trigrams.Rdata")
quad_df <- readRDS("./ngrams/quadgrams.Rdata")
penta_df <- readRDS("./ngrams/pentagrams.Rdata")
ecta_df <- readRDS("./ngrams/ectagrams.Rdata")




sbo_predict <- function(str,uni_df,bi_df,tri_df,quad_df,penta_df,ecta_df,profanities){
  predictions <- character(0)
  predictions <- c(predictions,predict_ecta_new(str,ecta_df))
  predictions <- c(predictions,predict_penta_new(str,penta_df))
  predictions <- c(predictions,predict_quad_new(str,quad_df))
  predictions <- c(predictions,predict_tri_new(str,tri_df))
  predictions <- c(predictions,predict_bi_new(str,bi_df))
  predictions <- c(predictions,uni_df[,1][1:30])
  predictions <- unique(predictions)
  predictions[!is.na(predictions)][1:30]
}


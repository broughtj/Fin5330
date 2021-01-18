raw <- read.table("lee-ready.csv", sep="|", header=T)
raw$SYMBOL <- as.character(raw$SYMBOL)
tickers <- unique(raw$SYMBOL)
ibm <- raw[raw$SYMBOL == "IBM", c("mid_point2", "buyer_init")]

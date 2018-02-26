library("RPostgreSQL")
pw <- "example"

drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = "postgres",
                 host = "db", port = 5432,
                 user = "postgres", password = pw)

data(mtcars)
df <- data.frame(carname = rownames(mtcars),
                 mtcars,
                 row.names = NULL)
df$carname <- as.character(df$carname)
rm(mtcars)

dbWriteTable(con, "cartable",
             value = df, append = TRUE, row.names = FALSE)

df_postgres <- dbGetQuery(con, "SELECT * from cartable")

identical(df, df_postgres)

dbDisconnect(con)
dbUnloadDriver(drv)

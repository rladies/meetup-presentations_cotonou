library(gdata)

d1 <- read.xls('import_data.xlsx')


library(XLConnect)            
wk = loadWorkbook("import_data.xlsx") 
df = readWorksheet(wk, sheet="Sheet1")
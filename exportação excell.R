### M�dulo 03 do curso de introdu�ao ao R ###
### Tutorial b�sico de exporta�ao de banco de dados ####
### Exportar para CSV:

###1. Criar dados de exemplo:
## Vamos come�ar criando alguns dados de exemplo em um dataframe no R.
##
# Criar dados de exemplo
dados <- data.frame( Nome = c("Joao", "Maria", "Carlos", "Ana"),Idade = c(25, 30, 40, 35), TB = c("TB- ativa", "TB- ativa", "TB- MDR", "Sem diagnostico"))

#### Verificar diret�rio de trabalho
getwd()

## Indicar o diret�rio de trabalho para salvar os arquivos
setwd("C:/opasR/DADOS")

# Exportar para CSV
write.csv(dados, "dados.csv", row.names = FALSE)


### Exportar para XLS e XLSX:
### Obs: Para exportar para XLS, voce precisar� instalar e carregar a biblioteca `xlsx`.

### 1. Instalar e carregar a biblioteca:
install.packages('xlsx', dep=T)

library(xlsx)


### 2. Exportar para XLS:
# Exportar para XLS
write.xlsx(dados, "dados.xls", row.names = FALSE) 

#### 3.Exportar para XLSX:
# Exportar para XLSX
write.xlsx(dados, "dados.xlsx", row.names = FALSE)

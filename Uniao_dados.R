### Módulo 03 do curso de introdução ao R ###
### Tutorial básico de uniao de dados/organizacao ####

###############################################################
### Usando `rbind()` para combinar dados por linha:
##Suponha que você tenha dois conjuntos de dados representando pacientes em diferentes momentos:
  
  # Primeiro conjunto de dados: pacientes no início do estudo
  pacientes_inicio <- data.frame(
    ID = c(1, 2, 3),
    idade = c(45, 60, 35),
    peso = c(70, 80, 65))
  
  pacientes_inicio
  
  # Segundo conjunto de dados: pacientes no final do estudo
  pacientes_final <- data.frame(
    ID = c(1, 2, 3),
    idade = c(47, 62, 37),
    peso = c(72, 82, 67))
  
  pacientes_final
  
  # Combinar os conjuntos de dados por linha
  pacientes_completos <- rbind(pacientes_inicio, pacientes_final)
  
  # Resultado
  print(pacientes_completos)
  

############################################################### 
### Usando `cbind()` para combinar dados por coluna:  
##Suponha que você tenha dois conjuntos de dados representando a pressão arterial sistólica e diastólica de pacientes:
# Pressão arterial sistólica
pressao_sistolica <- c(120, 130, 140)
  
# Pressão arterial diastólica
pressao_diastolica <- c(80, 85, 90)
  
# Combinar os dois vetores em um único conjunto de dados
pressao_arterial <- cbind(pressao_sistolica, pressao_diastolica)
  

# Resultado
print(pressao_arterial)
  

getwd()


###############################################################
## Usando funções merge e subset.

###############################################################
## Usando a função merge para unir bancos de dados de sistemas diferentes.
### Exemplo aplicado a dados do SINAN e IPEA
## Indicar o diretório de trabalho  dos arquivos
setwd("C:/opasR/DADOS")

getwd()

#importar CSV
###dados do sinan
dados_viol <- read.csv2("sinannet_cnv_violebr.csv")
View(dados_viol)
attach(dados_viol) #disponibiliza as colunas
head(dados_viol)

###dados do ipea
dados_ipea <- read.csv2("ipeadata.csv")
View(dados_ipea)
attach(dados_ipea) ##disponibiliza as colunas
head(dados_ipea)


### juntando as colunas usando a função merge
## dados ipea primeiro e depois dados do sinan
dados1 = merge(dados_ipea, dados_viol, by = "ID.codigo")
head(dados1)

## dados sinan primeiro e depois dados do ipea
dados2 = merge( dados_viol,dados_ipea, by = "ID.codigo")
head(dados2)


###############################################################
### Selecionando colunas e estados especificos usando a função subset
### Vamos ver os nomes das colunas
names(dados1) ## nomes das colunas, escrever exatamente igual
attach(dados1)## disponibilizar as colunas do data.frame

## Somente informações do ano de 2020
dados_2020=subset(dados1, select = c(Estado,Sigla, homicidiossexo_feminino_2020,homicidiossexo_masculino_2020,
                          suicidiossexo_feminino_2020,suicidiossexo_masculino_2020,V2020))
head(dados_2020) ### ver inicio dos dados




## Somente informações do ano de 2020 e dos estados da regiao sul do país
dados_2020_sul=subset(dados1, select = c(Estado,Sigla, homicidiossexo_feminino_2020,homicidiossexo_masculino_2020,
                                     suicidiossexo_feminino_2020,suicidiossexo_masculino_2020,V2020), dados1$Sigla=="PR"|dados1$Sigla=="RS"|dados1$Sigla=="SC")
head(dados_2020_sul) ### ver inicio dos dados

?subset


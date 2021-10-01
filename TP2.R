#primero llamamos las librerias#

library(tidyverse)
library(sf)
library(leaflet)
library(ggmap)
library(lubridate)
library(dplyr)
library(osmdata)
library(janitor)  
library(tidyr)

#traemos los datos#

terrenos2020 <- read_sf("Terrenos-en-venta-2020/210517_Terrenos_Vta_Anual2020.shp")
view (terrenos2020)

#queremos ver si hay problema para visualizar los datos#

terrenos2020_a <- as_tibble(terrenos2020)
view(terrenos2020_a)

#ahora los limpiamos y filtramos acorde a lo que nos interesa#

Terrenosseleccionados <- terrenos2020_a %>%
  select(BARRIO,DIRECCION,PRECIOUSD,DOLARM2,geometry) 

view(Terrenosseleccionados)

#queremos comprar un terrenos en nuñez#

TERRENOSNUÑEZ <- Terrenosseleccionados %>% filter(BARRIO == "NUÑEZ")
view(TERRENOSNUÑEZ)

#queremos comprar un terreno que tenga mas de 300m2 #

TERRENOSNUÑEZ <- TERRENOSNUÑEZ %>%
  mutate(M2 = PRECIOUSD/DOLARM2)
view(TERRENOSNUÑEZ)
TERRENOSNUÑEZ <- TERRENOSNUÑEZ %>%
  filter(M2>300)
view(TERRENOSNUÑEZ)

# eliminamos los repetidos#

TERRENOSNUÑEZ %>% distinct()
view(TERRENOSNUÑEZ)

TERRENOSNUÑEZ <- as_tibble(TERRENOSNUÑEZ)
View(TERRENOSNUÑEZ)

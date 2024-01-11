# Distribution of Anuros
# Interactive_Maps - Fac Paper
# Eduardo Q Marques  18-12-2023

library(terra)
library(leaflet)
library(htmltools)
library(htmlwidgets)

setwd("C:/Users/Workshop/Documents/Research/Postdoc_UFRA/Papers/Anuros_nicho_Fac")
dir()

v10 = rast("Vegetation_10K.tif")
v10[v10 == 0] = NA
#plot(v10)

v1 = rast("Vegetation_1K.tif")
v1[v1 == 0] = NA
#plot(v1)

c10 = rast("Climatic_10K.tif")
c10[c10 == 0] = NA
#plot(c10)

c1 = rast("Climatic_1K.tif")
c1[c1 == 0] = NA
#plot(c1)

cv10 = rast("Climatic+Vegetation_10K.tif")
cv10[cv10 == 0] = NA
#plot(cv10)

cv1 = rast("Climatic+Vegetation_1K.tif")
cv1[cv1 == 0] = NA
#plot(cv1)


#map = leaflet() %>%
#  addTiles() %>%
#  addRasterImage(c10, colors = "blue", opacity = 0.5) %>%
#  addRasterImage(c1, colors = "red", opacity = 0.5) %>%
#  addRasterImage(cv10, colors = "green", opacity = 0.5) %>%
#  addRasterImage(cv1, colors = "black", opacity = 0.5) %>%
  #addLegend(pal = pal, values = values(c10), title = "Climatic 10k") %>% 
#  setView(lat = -25, lng = -67, zoom = 6); map

#Models group to make checkbox on map
m_grp = c("Vegetation 10km", "Vegetation 1km",
          "Climatic 10Km", "Climatic 1Km",
          "Climatic+Vegetation 10km", "Climatic+Vegetation 1km")

#Interactive Map ===============================================================
leaflet() %>%
  addTiles() %>%
  setView(lat = -23.5, lng = -67, zoom = 7) %>% 
  addProviderTiles("Esri.WorldTopoMap") %>% 
  
  #Modelled Rasters
  addRasterImage(v1, colors = "green", opacity = 0.5, group = m_grp[2]) %>%
  addRasterImage(v10, colors = "darkgreen", opacity = 0.5, group = m_grp[1]) %>%
  
  addRasterImage(c1, colors = "blue", opacity = 0.5, group = m_grp[4]) %>%
  addRasterImage(c10, colors = "darkblue", opacity = 0.5, group = m_grp[3]) %>%
  
  addRasterImage(cv1, colors = "red", opacity = 0.5, group = m_grp[6]) %>%
  addRasterImage(cv10, colors = "darkred", opacity = 0.5, group = m_grp[5]) %>%
  
  #CheckBox Controls 
  addLayersControl(overlayGroups = m_grp,
                   options = layersControlOptions(collapsed = FALSE)) %>% 
  showGroup(m_grp) %>% 
  
  #Location tools
  addEasyButton(easyButton(
    icon="fa-globe", title="Zoom to Level 1",
    onClick=JS("function(btn, map){ map.setZoom(1); }"))) %>%
  addEasyButton(easyButton(
    icon="fa-crosshairs", title="Locate Me",
    onClick=JS("function(btn, map){ map.locate({setView: true}); }")))













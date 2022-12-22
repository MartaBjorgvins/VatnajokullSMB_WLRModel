#Hér verða gerð landfræðileg kort fyrir MSc verkefni

library("ggplot2")
theme_set(theme_bw())
library("sf")
library("rnaturalearth")
library("rnaturalearthdata")
world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

library("ggspatial")

hnit=data.frame(x1=c(-30,-20,-20,-30), x2=c(-20,-10,-10,-20), y1=c(65,65,60,60), y2=c(70,70,65,65), r=c('NW','NE','SE','SW'))

ggplot(data = world) +
  geom_sf() +
  geom_rect(data=hnit, mapping=aes(xmin=x1, xmax=x2, ymin=y1, ymax=y2), color="#0072B2", alpha=0.1) +
  geom_text(data=hnit, aes(x=x1+(x2-x1)/2, y=y1+(y2-y1)/2, label=r), size=4 , colour= "#009E73") +
  coord_sf(xlim = c(-30, -10), ylim = c(60, 70), expand = TRUE) +
  xlab("Longitude") + ylab("Latitude") +
  annotation_scale(location = "bl", width_hint = 0.3) +
  annotation_north_arrow(location = "bl", which_north = "true", 
                         pad_x = unit(0.10, "in"), pad_y = unit(0.2, "in"),
                         style = north_arrow_fancy_orienteering) +
  theme(panel.grid.major = element_line(color = gray(0.5), linetype = "dashed", 
                                        size = 0.5), panel.background = element_rect(fill = "aliceblue"))


xlabs = seq(-30,-10, 5)
ylabs = seq(60, 70, 2)

ggplot(data = world) +
  geom_sf() +
  geom_rect(data=hnit, mapping=aes(xmin=x1, xmax=x2, ymin=y1, ymax=y2), color="#0072B2", alpha=0.1) +
  geom_text(data=hnit, aes(x=x1+(x2-x1)/2, y=y1+(y2-y1)/2, label=r), size=4 , colour= "#009E73") +
  scale_x_continuous(breaks = xlabs, labels = paste0(xlabs,'°W')) +
  scale_y_continuous(breaks = ylabs, labels = paste0(ylabs,'°N')) +
  coord_sf(xlim = c(-30, -10), ylim = c(60, 70), expand = TRUE) +
  xlab("Longitude") + ylab("Latitude") +
  annotation_scale(location = "bl", width_hint = 0.3) +
  annotation_north_arrow(location = "bl", which_north = "true", 
                         pad_x = unit(0.10, "in"), pad_y = unit(0.2, "in"),
                         style = north_arrow_fancy_orienteering) +
  theme(panel.grid.major = element_line(color = gray(0.5), linetype = "dashed", 
                                        size = 0.5), panel.background = element_rect(fill = "aliceblue"))

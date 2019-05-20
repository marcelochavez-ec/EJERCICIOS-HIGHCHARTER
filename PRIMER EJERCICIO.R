library(ggplot2)
library(dplyr)
library(highcharter)

load("C:/Users/Marcelo/Desktop/EJERCICIOS HIGHCHARTER/inscritos_prov.RData")

inscritos_1 <- inscritos_prov %>% 
  filter(provincia_reside!="SIN REGISTRO") %>% 
  mutate(anio=substr(fecha_per_id,1,4)) %>% 
  mutate(periodo=ifelse(substr(fecha_per_id,7,7)==1,"1er. Semestre","2do. Semestre")) %>% 
  mutate(periodo=factor(periodo, levels=c("1er. Semestre","2do. Semestre"))) %>% 
  # mutate(total_inscritos=format(total_inscritos,
  #                               decimal.mark=",",
  #                               big.mark=".",
  #                               small.mark=".", 
  #                               ,small.interval=3)) %>%
  # mutate(total_inscritos=as.numeric(as.character(total_inscritos))) %>% 
  arrange(desc(total_inscritos))

hchart(inscritos_1,
       "column",
       hcaes(x=provincia_reside,
             y=total_inscritos,
             group=interaction(periodo,anio))) %>% 
  hc_add_theme(hc_theme_google()) %>% 
  
  # Axis
  hc_yAxis(
    title = list(text = "Total de inscritos por año")) %>%
  hc_xAxis(
    title = list(text = "Periodos ENES/Ser Bachiller:")) %>% 
  # Titles and credits
  hc_title(
    text = "Total de inscritos por año y provincia"
  ) %>%
  hc_subtitle(text = "Fuente: Sistema Ser Bachiller") %>%
  hc_credits(
    enabled = TRUE, text = "Elaborado por: Dirección de Producción de la Información",
    style = list(fontSize = "12px")
  )


library("highcharter")
library("magrittr")
library("dplyr")

data("citytemp")

hc <- highchart() %>% 
  hc_add_series(name = "tokyo", data = citytemp$tokyo)

hc <- hc %>% 
  hc_title(text = "Temperatures for some cities") %>% 
  hc_xAxis(categories = citytemp$month) %>% 
  hc_add_series(name = "London", data = citytemp$london,
                dataLabels = list(enabled = TRUE)) %>%
  hc_add_series(name = "New York", data = citytemp$new_york,
                type = "spline") %>% 
  hc_yAxis(title = list(text = "Temperature"),
           labels = list(format = "{value}? C")) %>%
  hc_add_theme(hc_theme_google())
hc






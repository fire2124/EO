#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(RPostgreSQL)
library(DT)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    color = "blue"
    data = 0
    
    
    readOffers = function() {
        psql <- dbDriver("PostgreSQL")
        pcon <- dbConnect(psql, dbname = "studenti", host = "88.212.32.217", port = 5432, user = "student01", password = "student01")
        query = sprintf("select region, district from eks.order_delivery_place")
        data = dbGetQuery(pcon, query)
        dbDisconnect(pcon)
        data
        print(data)
    }
    
    createPoint = function() {
        for (j in 1:length(data$district)){
            if (data$district[j] == "Bratislava") {
                data[j,"lat"] = 48.143889
                data[j,"lon"] = 17.109722
            } else if (data$district[j] == "Zvolen") {
                data[j,"lat"] = 48.578333
                data[j,"lon"] = 19.123333
            }else if (data$district[j] == "Košice") {
                data[j,"lat"] = 48.72
                data[j,"lon"] = 21.258056
            }else if (data$district[j] == "Šaľa") {
                data[j,"lat"] = 48.152778
                data[j,"lon"] = 17.873889
            }else if (data$district[j] == "Poprad") {
                data[j,"lat"] = 49.056667
                data[j,"lon"] = 20.2975
            }else if (data$district[j] == "Zlaté Moravce") {
                data[j,"lat"] = 48.378333
                data[j,"lon"] = 18.396667
            }else if (data$district[j] == "Vranov Nad Topľou") {
                data[j,"lat"] = 48.880833
                data[j,"lon"] = 21.673333
            }else if (data$district[j] == "Čadca") {
                data[j,"lat"] = 49.435833
                data[j,"lon"] = 18.792222
            }else if (data$district[j] == "Ružomberok") {
                data[j,"lat"] = 49.078611
                data[j,"lon"] = 19.308333
            }else if (data$district[j] == "Dunajská Streda") {
                data[j,"lat"] = 47.983333
                data[j,"lon"] = 17.616667
            }else if (data$district[j] == "Martin") {
                data[j,"lat"] = 48.680556
                data[j,"lon"] = 18.92245
            }else if (data$district[j] == "Senica") {
                data[j,"lat"] = 48.72
                data[j,"lon"] = 17.366667
            }else if (data$district[j] == "Sabinov") {
                data[j,"lat"] = 49.106111
                data[j,"lon"] = 21.085556
            }else if (data$district[j] == "Myjava") {
                data[j,"lat"] = 48.749167
                data[j,"lon"] = 17.564444
            }else if (data$district[j] == "Kežmarok") {
                data[j,"lat"] = 49.133611
                data[j,"lon"] = 20.426389
            }else if (data$district[j] == "Trenčín") {
                data[j,"lat"] = 48.894167
                data[j,"lon"] = 18.040556
            }else if (data$district[j] == "Nové Zámky") {
                data[j,"lat"] = 47.987625
                data[j,"lon"] = 18.162461
            }else if (data$district[j] == "Nitra") {
                data[j,"lat"] = 48.306944
                data[j,"lon"] = 18.086389
            }else if (data$district[j] == "Banská Štiavnica") {
                data[j,"lat"] = 48.458889
                data[j,"lon"] = 18.892222
            }else if (data$district[j] == "Spišská Nová Ves") {
                data[j,"lat"] = 48.944167
                data[j,"lon"] = 20.560833
            }else if (data$district[j] == "Námestovo") {
                data[j,"lat"] = 49.408333
                data[j,"lon"] = 19.483333
            }else if (data$district[j] == "Stará Ľubovňa") {
                data[j,"lat"] = 49.301667
                data[j,"lon"] = 20.688611
            }else if (data$district[j] == "Kysucké Nové Mesto") {
                data[j,"lat"] = 49.302778
                data[j,"lon"] = 18.785278
            }else if (data$district[j] == "Námestovo") {
                data[j,"lat"] = 49.408333
                data[j,"lon"] = 19.483333
            }else if (data$district[j] == "Rožňava") {
                data[j,"lat"] = 48.658333
                data[j,"lon"] = 20.530833
            }else if (data$district[j] == "Považská Bystrica") {
                data[j,"lat"] = 49.116111
                data[j,"lon"] = 18.447222
            }else if (data$district[j] == "Rimavská Sobota") {
                data[j,"lat"] = 48.381111
                data[j,"lon"] = 20.014444
            }else if (data$district[j] == "Snina") {
                data[j,"lat"] = 48.988056
                data[j,"lon"] = 22.156667
            }else if (data$district[j] == "Skalica") {
                data[j,"lat"] = 48.843611
                data[j,"lon"] = 17.226389
            }else if (data$district[j] == "Prešov") {
                data[j,"lat"] = 49
                data[j,"lon"] = 21.233333
            }else if (data$district[j] == "Bánovce nad Bebravou") {
                data[j,"lat"] = 48.718611
                data[j,"lon"] = 18.258056
            }else if (data$district[j] == "Hlohovec") {
                data[j,"lat"] = 48.433333
                data[j,"lon"] = 17.803333
            }else if (data$district[j] == "Bardejov") {
                data[j,"lat"] = 49.292222
                data[j,"lon"] = 21.276389
            }else if (data$district[j] == "Partizánske") {
                data[j,"lat"] = 48.433333
                data[j,"lon"] = 18.3725
            }else if (data$district[j] == "Topoľčany") {
                data[j,"lat"] = 48.558889
                data[j,"lon"] = 18.174167
            }else if (data$district[j] == "Gelnica") {
                data[j,"lat"] = 48.848056
                data[j,"lon"] = 20.937222
            }else if (data$district[j] == "Žarnovica") {
                data[j,"lat"] = 48.48
                data[j,"lon"] = 18.718056
            }else if (data$district[j] == "Malacky") {
                data[j,"lat"] = 48.435833
                data[j,"lon"] = 17.017778
            }else if (data$district[j] == "Bytča") {
                data[j,"lat"] = 49.2225
                data[j,"lon"] = 18.558333
            }else if (data$district[j] == "Svidník") {
                data[j,"lat"] = 49.305556
                data[j,"lon"] = 21.567778
            }else if (data$district[j] == "Liptovský Mikuláš") {
                data[j,"lat"] = 49.084167
                data[j,"lon"] = 19.602222
            }else if (data$district[j] == "Nové Mesto nad Váhom") {
                data[j,"lat"] = 48.754722
                data[j,"lon"] = 17.830833
            }else if (data$district[j] == "Poltár") {
                data[j,"lat"] = 48.430556
                data[j,"lon"] = 19.7975
            }else if (data$district[j] == "Pezinok") {
                data[j,"lat"] = 48.291944
                data[j,"lon"] = 17.266111
            }else if (data$district[j] == "Prievidza") {
                data[j,"lat"] = 48.771389
                data[j,"lon"] = 18.624167
            }else if (data$district[j] == "Ilava") {
                data[j,"lat"] = 48.999444
                data[j,"lon"] = 18.236111
            }else if (data$district[j] == "Lučenec") {
                data[j,"lat"] = 48.328611
                data[j,"lon"] = 19.669167
            }else if (data$district[j] == "Galanta") {
                data[j,"lat"] = 48.188889
                data[j,"lon"] = 17.726389
            }else if (data$district[j] == "Stropkov") {
                data[j,"lat"] = 49.205
                data[j,"lon"] = 21.651389
            }else if (data$district[j] == "Žilina") {
                data[j,"lat"] = 49.222778
                data[j,"lon"] = 18.74
            }else if (data$district[j] == "Trnava") {
                data[j,"lat"] = 48.37775
                data[j,"lon"] = 17.586211
            }else if (data$district[j] == "Tvrdošín") {
                data[j,"lat"] = 49.336944
                data[j,"lon"] = 19.550278
            }else if (data$district[j] == "Levoča") {
                data[j,"lat"] = 49.021111
                data[j,"lon"] = 20.591111
            }else if (data$district[j] == "Turčianske Teplice") {
                data[j,"lat"] = 48.858889
                data[j,"lon"] = 18.863611
            }else if (data$district[j] == "Piešťany") {
                data[j,"lat"] = 48.584167
                data[j,"lon"] = 17.833611
            }else if (data$district[j] == "Revúca") {
                data[j,"lat"] = 48.683056
                data[j,"lon"] = 20.113333
            }else if (data$district[j] == "Detva") {
                data[j,"lat"] = 48.551389
                data[j,"lon"] = 19.418333
            }else if (data$district[j] == "Veľký Krtíš") {
                data[j,"lat"] = 48.215
                data[j,"lon"] = 19.338056
            }else if (data$district[j] == "Krupina") {
                data[j,"lat"] = 48.353611
                data[j,"lon"] = 19.066667
            }else if (data$district[j] == "Banská Bystrica") {
                data[j,"lat"] = 48.738611
                data[j,"lon"] = 19.156944
            }else if (data$district[j] == "Púchov") {
                data[j,"lat"] = 49.12
                data[j,"lon"] = 18.330556
            }else if (data$district[j] == "Trebišov") {
                data[j,"lat"] = 48.633611
                data[j,"lon"] = 21.717222
            }else if (data$district[j] == "Dolný Kubín") {
                data[j,"lat"] = 49.210556
                data[j,"lon"] = 19.2975
            }else if (data$district[j] == "Žiar nad Hronom") {
                data[j,"lat"] = 48.591944
                data[j,"lon"] = 18.608056
            }else if (data$district[j] == "Levice") {
                data[j,"lat"] = 48.216389
                data[j,"lon"] = 19.066667
            }else if (data$district[j] == "Sobrance") {
                data[j,"lat"] = 48.745278
                data[j,"lon"] = 22.181111
            }else if (data$district[j] == "Senec") {
                data[j,"lat"] = 48.220556
                data[j,"lon"] = 17.398333
            }else if (data$district[j] == "Michalovce") {
                data[j,"lat"] = 48.749167
                data[j,"lon"] = 21.901389
            }else if (data$district[j] == "Humenné") {
                data[j,"lat"] = 48.935833
                data[j,"lon"] = 21.906667
            }else if (data$district[j] == "Komárno") {
                data[j,"lat"] = 47.75742
                data[j,"lon"] = 18.12982
            }else if (data$district[j] == "Brezno") {
                data[j,"lat"] = 48.806667
                data[j,"lon"] = 19.642222
            }else if (data$district[j] == "Medzilaborce") {
                data[j,"lat"] = 49.270833
                data[j,"lon"] = 21.903889
            }
        }
        data
        print(data)
    }
    
    data = readOffers()
    data$district[data$district == "Bratislava I"] <- "Bratislava"
    data$district[data$district == "Bratislava II"] <- "Bratislava"
    data$district[data$district == "Bratislava III"] <- "Bratislava"
    data$district[data$district == "Bratislava IV"] <- "Bratislava"
    data$district[data$district == "Bratislava V"] <- "Bratislava"
    data$district[data$district == "Košice I"] <- "Košice"
    data$district[data$district == "Košice II"] <- "Košice"
    data$district[data$district == "Košice III"] <- "Košice"
    data$district[data$district == "Košice IV"] <- "Košice"
    data$district[data$district == "Košice - okolie"] <- "Košice"
    data=createPoint()
    selectMarkerColor = function(region) {
        if (region == "Bratislavský") {
            color = "red"
        }
    }
    
    beatCol <- colorFactor(palette = 'RdYlGn', data$district)
    
    output$mymap <- renderLeaflet({
        leaflet(data = data) %>%
            addProviderTiles(providers$Stamen.TonerLite,
                             options = providerTileOptions(noWrap = TRUE)
            ) %>%
            addCircleMarkers(data = data, lng=~lon,
                             lat=~lat,
                             color = beatCol(data$district),
                             radius=20,
                             fillOpacity = 0.8,
                             label = data$district,
                             clusterOptions = markerClusterOptions()
            )
    })
    
    output$responses <- DT::renderDataTable({
        input$submit
        data
    })
})
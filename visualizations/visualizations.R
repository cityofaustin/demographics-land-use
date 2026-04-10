library(htmlwidgets)
library(readr)
library(readxl)
library(ggplot2)
library(plotly)

units_by_year <- read_xlsx("visualizations/unitsbyyearbyLU.xlsx")

pal_city <- c(
  "Apartment/Condo" = "#44499C",
  "Duplexes" = "#FFC600",
  "Group Quarters" = "#9F3CC9",
  "Large-lot Single Family" = "#005027",
  "Mixed Use" = "#F83125",
  "Mobile Homes" = "#009CDE",
  "Retirement Housing" = "#8F5201",
  "Single Family" = "#009F4D",
  "Three/Fourplex" = "#FF8F00"
)

pal_ldb <- c(
  "Apartment/Condo" = "#FEB119",
  "Duplexes" = "#F0ED17",
  "Group Quarters" = "#FE9010",
  "Large-lot Single Family" = "#FAECC8",
  "Mixed Use" = "#A87000",
  "Mobile Homes" = "#F5F57A",
  "Retirement Housing" = "#FED827",
  "Single Family" = "#FFFF00",
  "Three/Fourplex" = "#FED827"
)

plot <- ggplot(units_by_year, aes(x = Year, y = Units, fill = `Land Use`))+
  geom_col()+
  scale_y_continuous(labels = scales:: comma)+
  scale_fill_manual(
    values = pal_ldb
  )+
  theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank()
  )
  labs(
    title = "Units by Land Use Over Time"
  )

plot

interactive_plot <- ggplotly(plot)|>
  layout(hovermode = 'x')

interactive_plot

htmlwidgets::saveWidget(interactive_plot, "visualizations/units-land-use/index.html", selfcontained = FALSE)



neighborhood_data <- read_csv("UGareaNBG.csv")

neighborhood_plot <- plot <- ggplot(neighborhood_data, aes(x = Year, y = Units, fill = `Land Use`))+
  geom_col()+
  scale_y_continuous(labels = scales:: comma)+
  theme_minimal()+
  labs(
    title = "Land Use by Neighborhood"
  )
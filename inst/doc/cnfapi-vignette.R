## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
#install.packages("ggplot2")
library(nutrientr)
library(ggplot2)
library(dplyr)

## ---- echo = FALSE, include = FALSE-------------------------------------------
Sys.setenv("CN_API" = "4ed46e31519f0bb5b7a66a5d350a4f1c")

## -----------------------------------------------------------------------------
get_food(foodCode = 5)

## -----------------------------------------------------------------------------
head(get_nutrientamount(foodCode = 2314))

## -----------------------------------------------------------------------------
get_nutrientgroup(nutrientGroupId = 7)

## -----------------------------------------------------------------------------
get_nutrientgroup()

## -----------------------------------------------------------------------------
get_nutrientname(nutrientNameId = 550)

## -----------------------------------------------------------------------------
head(get_nutrientsource())

## -----------------------------------------------------------------------------
get_nutrientsource(nutrientSourceId = 108)

## -----------------------------------------------------------------------------
head(get_refuseamount())

## -----------------------------------------------------------------------------
get_servingsize()

## -----------------------------------------------------------------------------
head(get_yieldamount())

## -----------------------------------------------------------------------------
#The API doesn't accept multiple IDs at once, so we have to make two queries. 
rbind(get_food(foodCode = 45), get_food(foodCode = 46))

## -----------------------------------------------------------------------------
rbind(get_servingsize(foodCode = 45), get_servingsize(foodCode = 46))

## -----------------------------------------------------------------------------
get_refuseamount(foodCode = 45)
get_refuseamount(foodCode = 46)

## -----------------------------------------------------------------------------
try({
  get_yieldamount(foodCode = 45)
  get_yieldamount(foodCode = 46)
})

## ---- include=FALSE-----------------------------------------------------------
#The API doesn't accept multiple IDs at once, so we have to make two queries. 
nutrition <- rbind(get_all_nutrient_info(foodCode = 45), get_all_nutrient_info(foodCode = 46))

## -----------------------------------------------------------------------------
head(nutrition)

## ----fig1, fig.height = 5, fig.width = 6--------------------------------------
filtered <- nutrition |> dplyr::filter(nutrient_group_name == "Amino Acids")
ggplot(data = filtered, aes(x=nutrient_name, y=nutrient_value, fill = food_description))+
  geom_bar(stat = 'summary', fun = sum, position = "dodge") +
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(x = "Amino Acid", y = "Amount (g)", fill = "Cheese")


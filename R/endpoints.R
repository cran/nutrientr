#' get_food
#'
#' Makes a query to the Canadian Nutrient File food endpoint. This endpoint returns
#' data from a list of food codes and corresponding names.
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param foodCode The code indicating the food you want to search for. If null,
#' all foods are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing food names and food ids.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_food()
#' get_food(foodCode = 2314)
#' get_food(foodcode = 2314, lang = "fr")
#' }
get_food <- function(apiKey = NULL,
                     foodCode = NULL,
                     lang = "en") {
  # Query the food endpoint of the api.
  output <-
    query_api(
      path = "food",
      apiKey = apiKey,
      id = foodCode,
      lang = lang
    )
  # Get a clean tibble from the results and return it.
  clean_data(output)
}

#' get_yieldamount
#'
#' Makes a query to the Canadian Nutrient File yieldamount endpoint. This endpoint returns
#' data from a list of food codes and corresponding yield amounts (yield from refuse and or
#' cooking losses). For instance, if you search the food id 1002 (Beef Gravy), it will tell
#' you that it takes 5.55 g dehydrated to make 60 mL and 9.26g to make 100 mL.
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param foodCode The code indicating the food you want to search for. If null,
#' all foods and their corresponding yields are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing food names and food codes, yield amounts, and yield names.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_yieldamount()
#' get_yieldamount(foodCode = 57)
#' get_yieldamount(foodCode = 57, lang = "fr")}
get_yieldamount <- function(apiKey = NULL,
                     foodCode = NULL,
                     lang = "en") {
  # Query the yieldamount endpoint of the api.
  output <-
    query_api(
      path = "yieldamount",
      apiKey = apiKey,
      id = foodCode,
      lang = lang
    )
  # Get a clean tibble from the results and return it.
  clean_data(output)
}

#' get_nutrientamount
#'
#' Makes a query to the Canadian Nutrient File nutrientamount endpoint. This endpoint returns
#' a list of nutrient id's and details about their corresponding nutrient amounts,
#' standard error of observation of nutrient amount and their names. For instance,
#' for nutrient id 5,  the name of the nutrient measured is caffeine and its nutrient value is 0.
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param foodCode The code indicating the food you want to search for. If null,
#' all foods and their corresponding nutrient amount are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing the foodCode, nutrient_value, number_observation,
#' nutrientNameId, nutrient_web_name, nutrient_source_id
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_nutrientamount()
#' get_nutrientamount(foodCode = 4)
#' get_nutrientamount(foodCode = 4, lang = "fr")
#' }
get_nutrientamount <- function(apiKey=NULL,
                               foodCode=NULL,
                               lang="en") {
  # Query nutrientamount endpoint of the api

  output <-
    query_api(
      path = "nutrientamount",
      apiKey = apiKey,
      id = foodCode,
      lang = lang)

  # Get a clean tibble from the results and return it.
  clean_data(output)
}

#' get_nutrientgroup
#'
#' Makes a query to the Canadian Nutrient File refuseamount endpoint. This endpoint
#' returns a list of all nutrient group ids and their names. For instance,
#' if nutrient group id is mentioned as 5, the corressponding group name is amino acids
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientgroup>.
#' If none is provided, the system environment variables will be checked.
#' @param nutrientGroupId The code indicating the nutrient group you want to search for. If null,
#' all foods and their corresponding names are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing nutrient group's id, name, order
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_nutrientgroup()
#' get_nutrientgroup(nutrientGroupId = 7)
#' get_nutrientgroup(nutrientGroupId = 7, lang = "fr")}
get_nutrientgroup <- function(apiKey=NULL,
                              nutrientGroupId=NULL,
                              lang="en") {
  # Query nutrientgroup endpoint of the api
  output <-
    query_api(
      path = "nutrientgroup",
      apiKey = apiKey,
      id = nutrientGroupId,
      lang = lang)

  # Get a clean tibble from the results and return it.
  clean_data(output)
}

#' get_nutrientname
#'
#' Makes a query to the Canadian Nutrient File nutrientname endpoint. This endpoint
#' returns a list of all nutrient names, symbols, names, unit of measurement, nutrient group name, etc.
#' For instance, for nutrient name id of 810, the corresponding nutrient symbol is STAR and nutrient name is
#' STARCH, unit is 2 and nutrient group id is 2.
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientname>.
#' If none is provided, the system environment variables will be checked.
#' @param nutrientNameId The code indicating the food name you want to search for. If null,
#' all foods and their corresponding symbols and  are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing nutrient name id, name, code, web_name and other details
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_nutrientname()
#' get_nutrientname(nutrientNameId = 550)
#' get_nutrientname(nutrientNameId = 550, lang = "fr")}
get_nutrientname <- function(apiKey=NULL,
                             nutrientNameId=NULL,
                             lang="en") {

  # Query nutrientname endpoint of the api

  output <-
    query_api(
      path = "nutrientname",
      apiKey = apiKey,
      id = nutrientNameId,
      lang = lang)

  # Get a clean tibble from the results and return it (only effective if no nutrientNameId is passed and all table is returned).
  clean <- clean_data(output)

  # Reformatting when there is only one Id (clean_data() function not effective for this endpoint in the case where nutrientNameId is not NULL)
  if (is.null(nutrientNameId) == FALSE) {
    col_names <- c("nutrient_name_id", "nutrient_symbol", "nutrient_name", "unit",
                   "nutrient_code", "tagname", "nutrient_decimals", "nutrient_web_order",
                   "nutrient_web_name",  "nutrient_group_id")

    clean_df <- as.data.frame(t(clean))
    colnames(clean_df) <- col_names

    # Setting appropriate type for columns
    cols <- c("nutrient_name_id", "nutrient_code", "nutrient_decimals", "nutrient_web_order", "nutrient_group_id")
    clean_df[cols] <- sapply(clean_df[cols], as.integer)
    clean <- tibble::as.tibble(clean_df)

  }
  clean
}


#' get_nutrientsource
#'
#' Makes a query to the Canadian Nutrient File nutrientsource endpoint. This endpoint returns
#' a list of nutrient source id's and their corresponding description.
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param nutrientSourceId The code indicating the nutrient source you want to search for. If null,
#' all nutrient sources are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing the id's of nutrient sources as well as their corresponding description.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_nutrientsource()
#' get_nutrientsource(nutrientSourceId = 108)
#' get_nutrientsource(nutrientSourceId = 108, lang = "fr")}
get_nutrientsource <- function(apiKey = NULL,
                               nutrientSourceId = NULL,
                               lang = "en") {
  # Query the nutrientsource endpoint of the api.
  output <-
    query_api(
      path = "nutrientsource",
      apiKey = apiKey,
      id = nutrientSourceId,
      lang = lang
    )
  # Get a clean tibble from the results and return it.(only effective if no nutrientSourceId is passed and all table is returned)
  clean <- clean_data(output)

  # Reformatting when there is only one Id (clean_data() function not effective for this endpoint in the case where nutrientSourceId is not NULL)
  if (is.null(nutrientSourceId) == FALSE) {
    col_names <- c("nutrient_source_id", "nutrient_source_description", "nutrient_source_code")
    clean_df <- as.data.frame(t(clean))
    colnames(clean_df) <- col_names

    # Setting appropriate type for columns
    cols <- c("nutrient_source_id", "nutrient_source_code")
    clean_df[cols] <- sapply(clean_df[cols], as.integer)
    clean <- tibble::as.tibble(clean_df)
  }
  clean
}


#' get_refuseamount
#'
#' Makes a query to the Canadian Nutrient File refuseamount endpoint. This endpoint returns
#' a list of refuse amounts and name as well as the corresponding food code and description.
#' Refuse amounts correspond to the inedible portion of the food. For instance, searching for
#' food code 557 (Chicken, broiler, meat, skin, giblets and neck) will return
#' a refuse amount of 28 and its associated name is 'bone'.
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param foodCode The code indicating the food you want to search for. If null,
#' all foods and their corresponding refuse amounts are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing refuse name, refuse amount, food names and food codes.
#'
#' @export
#' @examples
#' \dontrun{
#' get_refuseamount()
#' get_refuseamount(foodCode = 557)
#' get_refuseamount(foodCode = 557, lang = "fr")}
get_refuseamount <- function(apiKey = NULL,
                             foodCode = NULL,
                             lang = "en") {
  # Query the refuseamount endpoint of the api.
  output <-
    query_api(
      path = "refuseamount",
      apiKey = apiKey,
      id = foodCode,
      lang = lang
    )
  # Get a clean tibble from the results and return it.
  clean_data(output)
}

#' get_servingsize
#'
#' Makes a query to the Canadian Nutrient File servingsize endpoint. This endpoint returns
#' a list of serving sizes as well as the corresponding food code and description. The conversion
#' factor value is also given. This represents the proportion of weight between cooked edible
#' portion and raw edible portion.
#' \href{https://www.researchgate.net/publication/327790633_Cooking_conversion_factor_of_commonly_consumed_Sri_Lankan_food_items#:~:text=Conversion%20factor%20is%20the%20proportion,water%20reduction%20and%20fat%20absorption.}{conversion factor}
#'
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param foodCode The code indicating the food you want to search for. If null,
#' all foods and their corresponding serving sizes are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing conversion factor values, food names, food codes and serving sizes.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_servingsize()
#' get_servingsize(foodCode = 45)
#' get_servingsize(foodCode = 45, lang = "fr")}
get_servingsize <- function(apiKey = NULL,
                            foodCode = NULL,
                            lang = "en") {
  # Query the servingsize endpoint of the api.
  output <-
    query_api(
      path = "servingsize",
      apiKey = apiKey,
      id = foodCode,
      lang = lang
    )
  # Get a clean tibble from the results and return it.
  clean_data(output)
}

#' get_all_nutrient_info(foodCode)
#'
#' Makes queries to the Canadian Nutrient APIs to get all available nutrient information
#' about a particular food.
#'
#' @param foodCode The code indicating the food you want to search for.
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing all available nutrient information about the food code.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_all_nutrient_info(foodCode = 45)
#' }
get_all_nutrient_info <- function( foodCode,
                                   apiKey = NULL,
                                   lang = "en"){
  nutrient_amounts <- get_nutrientamount(foodCode = foodCode, apiKey = apiKey, lang = lang)
  nutrient_names <- get_nutrientname(apiKey = apiKey, lang = lang)
  nutrient_sources <- get_nutrientsource(apiKey = apiKey, lang = lang)
  nutrient_groups <- get_nutrientgroup(apiKey = apiKey, lang = lang)

  dplyr::left_join(nutrient_amounts, nutrient_names,
                    by = c("nutrient_name_id" = "nutrient_code", "nutrient_web_name")) |>
    dplyr::left_join(nutrient_groups, by = "nutrient_group_id") |>
      dplyr::left_join(nutrient_sources, by = "nutrient_source_id") |>
        dplyr::left_join(get_food(foodCode = foodCode, apiKey = apiKey, lang = lang))
}

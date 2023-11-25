library(tidyverse)
library(dplyr)

hdigdp = read_csv("./data/hdigdp.csv")
schooling = read_csv("./data/schooling.csv")

schooling = schooling |>
  mutate(country = Entity) |>
  mutate(schooling = `Expected Years of Schooling (years)`) |>
  mutate(year = Year) |>
  select(country, year, schooling)

suicide = read_csv("./data/suicide.csv")

full = full_join(suicide, schooling, by = c("country", "year"))


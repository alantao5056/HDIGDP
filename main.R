library(tidyverse)
library(dplyr)

hdigdp = read_csv("./data/hdigdp.csv")

hdigdp = hdigdp |>
  mutate(year = Year, HDI = `Human Development Index`, country = Entity, GDPPC = `GDP per capita, PPP (constant 2017 international $)`) |>
  select(country, year, HDI, GDPPC)

schooling = read_csv("./data/schooling.csv")

schooling = schooling |>
  mutate(country = Entity) |>
  mutate(schooling = `Expected Years of Schooling (years)`) |>
  mutate(year = Year) |>
  select(country, year, schooling)

suicide = read_csv("./data/suicide.csv")

full = full_join(suicide, schooling, by = c("country", "year"))

full = left_join(full, hdigdp, by = c("country", "year"))

# gdp hdi for every country
full |> 
  drop_na() |>
  summarize(.by = country, avg_hdi = mean(`HDI`), avg_gdp = mean(`GDPPC`)) |>
  ggplot(aes(x = avg_hdi, y = avg_gdp)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm", formula = (y~exp(x))) +
  labs(title = "HDI vs GDP for Every Country",
       x = "Average HDI",
       y = "Average GDP")

# GDP in the us
full |>
  filter(country == "United States") |>
  summarize(.by = year, avg_hdi = mean(`GDPPC`)) |>
  ggplot(aes(x = year, y = avg_hdi)) +
  geom_line() +
  scale_y_continuous(labels = scales::dollar_format()) +
  xlim(1990, 2017) +
  labs(title = "GDP Per Capita in the US",
       x = "Year",
       y = "GDP Per Capita")
# hdi in us
full |>
  filter(country == "United States") |>
  summarize(.by = year, avg_hdi = mean(`HDI`)) |>
  ggplot(aes(x = year, y = avg_hdi)) +
  geom_line() +
  scale_y_continuous(labels = scales::dollar_format()) +
  xlim(1990, 2017) +
  labs(title = "HDI in the US",
       x = "Year",
       y = "HDI")
# suicide
full |>
  select(year, `suicides/100k pop`) |>
  drop_na() |>
  summarize(.by = year, avg_suicide = mean(`suicides/100k pop`)) |>
  ggplot(aes(x = year, y = avg_suicide)) +
  geom_line() +
  labs(title = "Average Suicide Rates in the World",
       subtitle = "spiked in 1995",
       x = "Year",
       y = "Average Suicide per 100k People")

 temp = full |>
  filter(country == "United States") |>
  summarize(.by = year, avg_hdi = mean(`HDI`))

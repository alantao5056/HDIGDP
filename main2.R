library(tidyverse)

ESchooling = read_csv("./data/expected-years-of-schooling.csv")

ESCountry = ESchooling |>
  filter(Entity=="United States" | Entity == "China" | Entity == "United Kingdom" | Entity == "Russia" | Entity == "Germany")
ESCountry |>
  ggplot(aes(x=Year, y=`Expected years of schooling`)) +
  geom_line(aes(x=Year, color = Entity))

ESCountry2 = ESchooling |>
  filter(Entity=="Tuvalu" | Entity == "Kiribati" | Entity == "Marshall Islands" | Entity == "Micronesia (country)" | Entity == "Sao Tome and Principe")
ESCountry2 |>
  ggplot(aes(x=Year, y=`Expected years of schooling`)) +
  geom_line(aes(x=Year, color = Entity))

MSchooling = read_csv("./data/mean-years-of-schooling-long-run.csv")
MSCountry = MSchooling |>
  filter(Entity=="United States" | Entity == "China" | Entity == "United Kingdom" | Entity == "Russia" | Entity == "Germany")
MSCountry |>
  ggplot(aes(x=Year, y=`Combined - average years of education for 15-64 years male and female youth and adults`)) +
  geom_line(aes(x=Year, color = Entity)) +
  labs(y = "Mean years of schooling")

MSCountry2 = MSchooling |>
  filter(Entity=="Tuvalu" | Entity == "Kiribati" | Entity == "Marshall Islands" | Entity == "Micronesia (country)" | Entity == "Sao Tome and Principe")
MSCountry2 |>
  ggplot(aes(x=Year, y=`Combined - average years of education for 15-64 years male and female youth and adults`)) +
  geom_line(aes(x=Year, color = Entity)) +
  labs(y = "Mean years of schooling")


GNI = read_csv("./data/gross-national-income-per-capita-undp.csv")
GNICountry = GNI |>
  filter(Entity=="United States" | Entity == "China" | Entity == "United Kingdom" | Entity == "Russia" | Entity == "Germany")
GNICountry |>
  ggplot(aes(x=Year, y=`Gross national income per capita`)) +
  geom_line(aes(x=Year, color = Entity))

GNICountry2 = GNI |>
  filter(Entity=="Tuvalu" | Entity == "Kiribati" | Entity == "Marshall Islands" | Entity == "Micronesia (country)" | Entity == "Sao Tome and Principe")
GNICountry2 |>
  ggplot(aes(x=Year, y=`Gross national income per capita`)) +
  geom_line(aes(x=Year, color = Entity))

LE = read_csv("./data/life-expectancy.csv")
LECountry = LE |>
  filter(Entity=="United States" | Entity == "China" | Entity == "United Kingdom" | Entity == "Russia" | Entity == "Germany") |>
  filter(Year >= 1990)
LECountry |>
  ggplot(aes(x=Year, y=`Period life expectancy at birth - Sex: all - Age: 0`)) +
  geom_line(aes(x=Year, color = Entity)) +
  labs(y="Life Expectancy")


LECountry2 = LE |>
  filter(Entity=="Tuvalu" | Entity == "Kiribati" | Entity == "Marshall Islands" | Entity == "Micronesia (country)" | Entity == "Sao Tome and Principe") |>
  filter(Year >= 1990)
LECountry2 |>
  ggplot(aes(x=Year, y=`Period life expectancy at birth - Sex: all - Age: 0`)) +
  geom_line(aes(x=Year, color = Entity)) +
  labs(y="Life Expectancy")

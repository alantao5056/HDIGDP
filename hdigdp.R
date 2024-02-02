hdigdp = read_csv("./data/human-development-index-vs-gdp-per-capita.csv")
HG = hdigdp |>
  filter(Year >= 1990) |>
  filter(Entity=="United States" | Entity == "China" | Entity == "United Kingdom" | Entity == "Russia" | Entity == "Germany")

HG |>
  ggplot(aes(x=`Human Development Index`, y=`GDP per capita, PPP (constant 2017 international $)`)) +
  geom_line(aes(x=Year, color = Entity)) +
  labs(y="GDP Per Capita")

HG2 = hdigdp |>
  filter(Year >= 1990) |>
  filter(Entity=="Tuvalu" | Entity == "Kiribati" | Entity == "Marshall Islands" | Entity == "Micronesia (country)" | Entity == "Sao Tome and Principe")
HG2 |>
  ggplot(aes(x=`Human Development Index`, y=`GDP per capita, PPP (constant 2017 international $)`)) +
  geom_line(aes(x=Year, color = Entity)) +
  labs(y="GDP Per Capita")

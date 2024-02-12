library(tidyverse)

eedu = read_csv("./data/Eedu.csv")
income = read_csv("./data/Income.csv")
lifee = read_csv("./data/LifeE.csv")
medu = read_csv("./data/Medu.csv")

eedu |>
  ggplot(aes(x = `Expected years schooling`, y = `Subnational HDI`)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE) +
  labs(x = "Expected Years of Schooling") +
  theme_bw()


income |>
  ggplot(aes(x = `Log Gross National Income per capita`, y = `Subnational HDI`)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE) +
  theme_bw()


lifee |>
  ggplot(aes(x = `Life expectancy`, y = `Subnational HDI`)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE) +
  theme_bw()


medu |>
  ggplot(aes(x = `Mean years schooling`, y = `Subnational HDI`)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE) +
  labs(x = "Mean Years of Schooling") +
  theme_bw()

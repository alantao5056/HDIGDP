allData = read_csv("./data/allData.csv")

lm_eqn <- function(df){
  m <- lm(hdi_2021 ~ gii_rank_2021, df);
  eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2, 
                   list(a = format(unname(coef(m)[1]), digits = 2),
                        b = format(unname(coef(m)[2]), digits = 2),
                        r2 = format(summary(m)$r.squared, digits = 3)))
  as.character(as.expression(eq));
}

allData |>
  ggplot(aes(x = gii_rank_2021, y = hdi_2021)) +
  geom_smooth(method = "lm", se = FALSE) +
  geom_point() +
  geom_text(x = 50, y = 0.5, label = lm_eqn(allData), parse = TRUE)

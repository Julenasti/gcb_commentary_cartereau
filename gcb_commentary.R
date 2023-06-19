library(tidyverse)
library(patchwork)

# plot low risk
l_risk <- ggplot() +
  stat_function(fun = function(x) 
    dnorm(x, mean = 4, sd = 2) * 2500 * .1,
    geom = "area",
    fill = "grey",
    size = 1,
    alpha = .8) +
  stat_function(fun = function(x) 
    dnorm(x, mean = 7.5, sd = 1) * 500 * .1,
    geom = "area",
    fill = "firebrick",
    size = 1,
    alpha = .8) +
  xlim(-5, 15) + 
  xlab(bquote("-"~~~"Aridity"~~~"+")) +
  ylab("Number of occurrences") +
  theme(
    panel.background = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    axis.line.x = element_line(color = "black", size = .6),
    axis.ticks = element_blank(),
    axis.text.y = element_blank(),
    axis.text = element_blank(),
    plot.tag = element_text(face = "bold")
  ) +
  labs(tag = "(b)")

# plot high risk
h_risk <- ggplot() +
  stat_function(fun = function(x) 
    dnorm(x, mean = 4, sd = 2) * 2500 * .1,
    geom = "area",
    fill = "grey",
    size = 1,
    alpha = .8) +
  stat_function(fun = function(x) 
    dnorm(x, mean = 11, sd = 1) * 500 * .1,
    geom = "area",
    fill = "firebrick",
    size = 1,
    alpha = .8) +
  xlim(-5, 15) + 
  xlab(bquote("-"~~~"Aridity"~~~"+")) +
  ylab("") +
  theme(
    panel.background = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    axis.line.x = element_line(color = "black", size = .6),
    axis.ticks = element_blank(),
    axis.text.y = element_blank(),
    axis.text = element_blank(),
    plot.tag = element_text(face = "bold")
    ) +
  labs(tag = "(c)")

fig <- l_risk + h_risk

ggsave(
  plot = fig,
  "fig.png",
  width = 7.5, height = 2.3,
  dpi = 600
)

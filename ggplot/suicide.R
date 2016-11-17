library(ggplot2)
library(dplyr)
library(data.table)
load("suicides.rdata")

all_suicides <- copy(suicides)

all_suicides <- suicides %>% 
  group_by(year, state, means) %>% 
  mutate(deaths = sum(deaths))

bare <- ggplot(suicides)

aesthetic <- ggplot(suicides, aes(x=year, y=deaths))

scatter <- ggplot(suicides, aes(x=year, y=deaths)) +
            geom_point()

color_by_means <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
  geom_point()

state_fact <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
  geom_point() +
  facet_wrap(~state, scale="free")
# https://gist.github.com/juanchiem/08cc1c49c019347da5dc45203587e6b1
library(tidyverse)

month <- 1:12
rate <- 78/12/100 # 78/12
initial_cap <- 500
simp_int  <- initial_cap + (initial_cap*rate)*month
comp_int = initial_cap*(1+rate)^(month)

df <- data.frame(month, simp_int, comp_int) 
df

df %>% 
ggplot() +
  aes(x=month)+
  geom_point(aes(y=simp_int)) +
  geom_line(aes(y=simp_int, col="simple")) +
  geom_point(aes(y=comp_int))+
  geom_line(aes(y=comp_int, col="compound"))+
  scale_color_manual("Interes", 
                     values = c("simple"="red",
                                "compound"="blue")) + 
  labs(y="$") + 
  lims(x=c(1,10))
usethis::browse_github()

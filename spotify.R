library(dplyr)
library(readr)
spotify <- read_csv("spotify.csv")


spotify %>% 
  group_by(artist_count) %>% 
  count()

spotify %>% 
  filter(artist_count > 6)

spotify %>% 
  mutate(streams = as.numeric(streams)) %>% 
  filter(!is.na(streams)) %>% 
  group_by(released_month) %>% 
  summarise(min(streams), mean(streams), max(streams))

spotify %>% 
  mutate(streams = as.numeric(streams)) %>% 
  filter(!is.na(streams)) %>% 
  group_by(released_day) %>% 
  summarise(streams=mean(streams)) %>% 
  arrange(desc(streams))


spotify %>% 
  mutate(streams = as.numeric(streams)) %>% 
  filter(!is.na(streams)) %>% 
  group_by(key) %>% 
  summarise(streams=mean(streams), n()) %>% 
  arrange(desc(streams))

spotify %>% 
  mutate(streams = as.numeric(streams)) %>% 
  filter(!is.na(streams)) %>% 
  group_by(key, mode) %>% 
  summarise(streams=mean(streams), n()) %>% 
  arrange(desc(streams))


spotify %>% 
  mutate(streams = as.numeric(streams)) %>% 
  filter(!is.na(streams), !is.na(key)) %>% 
  group_by(key, mode) %>% 
  summarise(streams=mean(streams), n=n()) %>% 
  arrange(desc(n))


spotify %>% 
  mutate(streams = as.numeric(streams)) %>% 
  filter(!is.na(streams)) %>% 
  group_by(key, mode) %>% 
  summarise(dance=mean(`danceability_%`), n()) %>% 
  arrange(desc(dance))



spotify %>% 
  filter(`danceability_%` > 90) %>% 
  group_by(`artist(s)_name`) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n))




spotify %>% 
  filter(`danceability_%` > 90) %>% 
  group_by(`artist(s)_name`) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n))
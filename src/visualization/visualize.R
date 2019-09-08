install.packages("pacman")
pacman::p_load(ggplot2)

# set wd
setwd("C:/Projects/Personal/data-mining-project")

df <- read.csv("data/interim/facebook-activity.csv", stringsAsFactors=FALSE)
df$Date <- as.Date(df$Date,format="%Y-%m-%d")

# Linecharts
# Likes
ggplot(df, aes(x = Date, y = Likes)) + 
  geom_line(aes(color = Name), size = 1) +
  scale_x_date(limits = c(as.Date("2019-08-07"), as.Date("2019-09-07"))) +
  geom_vline(xintercept=as.Date("2019-08-22"), color = "grey") + 
  geom_text(aes(as.Date("2019-08-21"), y=40000, label="Dissolution of Parliament"), angle=90, size=3.5, color = "grey") +
  theme_minimal() +
  scale_color_manual(values = df$Color, limits = df$Name) +
  labs(title = "Daily Candidate Likes")

ggsave("src/visualization/daily-likes.png")

# Shares
ggplot(df, aes(x = Date, y = Shares)) + 
  geom_line(aes(color = Name), size = 1) +
  scale_x_date(limits = c(as.Date("2019-08-07"), as.Date("2019-09-07"))) +
  geom_vline(xintercept=as.Date("2019-08-22"), color = "grey") + 
  geom_text(aes(as.Date("2019-08-21"), y=2500, label="Dissolution of Parliament"), angle=90, size=3.5, color = "grey") +
  theme_minimal() +
  scale_color_manual(values = df$Color, limits = df$Name) +
  labs(title = "Daily Candidate Shares")

ggsave("src/visualization/daily-shares.png")

# Comments
ggplot(df, aes(x = Date, y = Comments)) + 
  geom_line(aes(color = Name), size = 1) +
  scale_x_date(limits = c(as.Date("2019-08-07"), as.Date("2019-09-07"))) +
  geom_vline(xintercept=as.Date("2019-08-22"), color = "grey") + 
  geom_text(aes(as.Date("2019-08-21"), y=6000, label="Dissolution of Parliament"), angle=90, size=3.5, color = "grey") +
  theme_minimal() +
  scale_color_manual(values = df$Color, limits = df$Name) +
  labs(title = "Daily Candidate Comments")

ggsave("src/visualization/daily-comments.png")

# Posts
ggplot(df, aes(x = Date, y = Posts)) + 
  geom_line(aes(color = Name), size = 1) +
  scale_x_date(limits = c(as.Date("2019-08-07"), as.Date("2019-09-07"))) +
  geom_vline(xintercept=as.Date("2019-08-22"), color = "grey") + 
  geom_text(aes(as.Date("2019-08-21"), y=10, label="Dissolution of Parliament"), angle=90, size=3.5, color = "grey") +
  theme_minimal() +
  scale_color_manual(values = df$Color, limits = df$Name) +
  labs(title = "Daily Candidate Posts")

ggsave("src/visualization/daily-posts.png")

# TODO(Compare total page likes between candidates!)

# Experimenting with grouped bar charts

# Stacked
# Likes
ggplot(df, aes(fill=Name, y=Likes, x=Date)) + 
  geom_bar(position="stack", stat="identity") +
  scale_x_date(limits = c(as.Date("2019-08-07"), as.Date("2019-09-07"))) +
  theme_minimal() +
  scale_fill_manual(values = df$Color, limits = df$Name) +
  geom_vline(xintercept=as.Date("2019-08-22"), color = "grey") + 
  geom_text(aes(as.Date("2019-08-21"), y=75000, label="Dissolution of Parliament"), angle=90, size=3.5, color = "grey") +
  labs(title = "Daily Candidate Likes")

ggsave("src/visualization/daily-likes-stacked-bar.png")

# Comments
ggplot(df, aes(fill=Name, y=Comments, x=Date)) + 
  geom_bar(position="stack", stat="identity") +
  scale_x_date(limits = c(as.Date("2019-08-07"), as.Date("2019-09-07"))) +
  theme_minimal() +
  scale_fill_manual(values = df$Color, limits = df$Name) +
  geom_vline(xintercept=as.Date("2019-08-22"), color = "grey") + 
  geom_text(aes(as.Date("2019-08-21"), y=5000, label="Dissolution of Parliament"), angle=90, size=3.5, color = "grey") +
  labs(title = "Daily Candidate Comments")

ggsave("src/visualization/daily-comments-stacked-bar.png")

ggplot(df, aes(fill=Name, y=Shares, x=Date)) + 
  geom_bar(position="stack", stat="identity") +
  scale_x_date(limits = c(as.Date("2019-08-07"), as.Date("2019-09-07"))) +
  theme_minimal() +
  scale_fill_manual(values = df$Color, limits = df$Name) +
  geom_vline(xintercept=as.Date("2019-08-22"), color = "grey") + 
  geom_text(aes(as.Date("2019-08-21"), y=4100, label="Dissolution of Parliament"), angle=90, size=3.5, color = "grey") +
  labs(title = "Daily Candidate Shares")

ggsave("src/visualization/daily-shares-stacked-bar.png")

ggplot(df, aes(fill=Name, y=Posts, x=Date)) + 
  geom_bar(position="stack", stat="identity") +
  scale_x_date(limits = c(as.Date("2019-08-07"), as.Date("2019-09-07"))) +
  theme_minimal() +
  scale_fill_manual(values = df$Color, limits = df$Name) +
  geom_vline(xintercept=as.Date("2019-08-22"), color = "grey") + 
  geom_text(aes(as.Date("2019-08-21"), y=23, label="Dissolution of Parliament"), angle=90, size=3.5, color = "grey") +
  labs(title = "Daily Candidate Posts")

ggsave("src/visualization/daily-posts-stacked-bar.png")


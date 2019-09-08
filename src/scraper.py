from facebook_scraper import get_posts
import pandas as pd
import numpy as np

# Variables for the Dataframe
post_id = []
text = []
date = []
image = []
likes = []
comments = []
shares = []
post_url = []

# getting the data from Facebook and writing it in lists
for post in get_posts("VjosaOsmaniMP", pages=5):
    post_id.append(post['post_id'])
    text.append(post['text'])
    date.append(post['time'])
    image.append(post['image'])
    likes.append(post['likes'])
    comments.append(post['comments'])
    shares.append(post['shares'])
    post_url.append(post['post_url'])

# creating a dataframe
posts = pd.DataFrame(np.column_stack([post_id, text, date, image, likes, comments, shares, post_url]),
                     columns=["Post_ID", "Text", "Date", "Image", "Likes", "Comments", "Shares", "Post_url"])

# creating a .csv containing the data
posts.to_csv('../data/raw/fb-site-example.csv', index=False)

# check the dataframe
print('-------')
print(posts)

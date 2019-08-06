import click
import requests
import pandas as pd
from facebook import GraphAPI

from typing import List

GRAPH_API: GraphAPI = None
POST_FIELDS = ['id', 'created_time', 'comments', 'shares']


def get_list_of_pages() -> List[str]:
    """Returns the list of pages we want to get data from. Currently, it uses a hardcoded list, but it should be
    extended to fetch it from somewhere (db?!). Make sure to use the pageid (as shown in facebook url)"""
    return ['vetevendosje']


def get_number_of_comments(post: dict) -> int:
    """
    Counts the total number of comments for a given post. Mainly counts length and performs pagination on the response
    (this is because comments field does not have a `count` parameter)
    """
    return 1


def get_pages_posts(page_id: str) -> List[dict]:
    # limit set to 10 only for testing
    posts = GRAPH_API.get_object(f'{page_id}/posts', fields=','.join(POST_FIELDS), limit=10)
    posts_count = 0

    results = []

    while posts['data']:
        posts_count += len(posts['data'])

        for post in posts['data']:
            try:
                results.append({
                    'id': post['id'],
                    'created_time': post['created_time'],
                    'comments': get_number_of_comments(post),
                    'shares': post['shares']['count'] if post['shares'] else 0,
                })
            except KeyError:
                print(23)
            # print('.', end='')

        next_page_url = posts.get('paging', {}).get('next')

        # finish requesting other posts if we're done
        if not next_page_url:
            break

        posts = requests.get(next_page_url).json()

    return results


@click.command()
@click.option('--access_token', '-a', default='1361304643927217|RyaSF23StHVoky_2lNT_ULqnWy4', type=click.STRING)
@click.option('--version', '-v',  default='3.0', help='Graph api version to use', type=click.STRING)
def main(access_token: str, version: str):
    global GRAPH_API
    GRAPH_API = GraphAPI(access_token=access_token, version=version)

    pages_list = get_list_of_pages()
    df = pd.DataFrame(columns=POST_FIELDS)
    all_results = []

    for page in pages_list:
        all_results.extend(get_pages_posts(page))

    print(all_results)


if __name__ == '__main__':
    main()

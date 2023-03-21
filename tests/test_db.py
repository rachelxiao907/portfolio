import unittest
from peewee import *
from app import TimelinePost, get_timeline_post

MODELS = [TimelinePost]

test_db = SqliteDatabase(':memory:')


class TestTimelinePost(unittest.TestCase):
    def setUp(self):
        test_db.bind(MODELS, bind_refs=False, bind_backrefs=False)
        test_db.connect()
        test_db.create_tables(MODELS)

    def tearDown(self):
        test_db.drop_tables(MODELS)
        test_db.close()

    def test_timeline_post(self):
        first_post = TimelinePost.create(name='John Doe', email='john@example', content="Hello world, I'm John!")
        assert first_post.id == 1
        second_post = TimelinePost.create(name='Jane Doe', email='jame@example.com', content="Hello world, I'm Jane!")
        assert second_post.id == 2
        
        #Checks that the post was created by getting the timeline posts and checking if names correspond correctly
        posts = self.get_timeline_post()
        assert len(posts) == 2
        assert posts[-1].name == 'John Doe'
        assert posts[-2].name == 'Jane Doe'

    @staticmethod
    def get_timeline_post():
        return TimelinePost.select().order_by(TimelinePost.id.desc())

    

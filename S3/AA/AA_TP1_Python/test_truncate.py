import unittest
import strlen


class MyTestCase(unittest.TestCase):

    def test_truncate(self):
        li = ["a", "bb", "ccc", "dddd", "eeeee"]
        strlen.truncate(li, 3)
        self.assertEquals(["a","bb","ccc","ddd","eee"], li)


if __name__ == '__main__':
    unittest.main()

import unittest
import strlen


class MyTestCase(unittest.TestCase):

    def test_core(self):
        li = ['a', 'b', '12345', 'c', 'd']
        strlen.remove_long(li, 3)
        self.assertEqual(['a', 'b', 'c', 'd'], li)

    def test_limit(self):
        li = ['aaa', 'bbb', '1234', 'ccc', 'ddd']
        strlen.remove_long(li, 3)
        self.assertEqual(['aaa', 'bbb', 'ccc', 'ddd'], li)

    def test_first(self):
        li = ['12345', 'a', 'b', 'c', 'd']
        strlen.remove_long(li, 3)
        self.assertEqual(['a', 'b', 'c', 'd'], li)

    def test_last(self):
        li = ['a', 'b', 'c', 'd', '12345']
        strlen.remove_long(li, 3)
        self.assertEqual(['a', 'b', 'c', 'd'], li)

    def test_all(self):
        li = ['aaa', 'bbb', 'ccc', 'ddd']
        strlen.remove_long(li, 2)
        self.assertEqual([], li)


if __name__ == '__main__':
    unittest.main()

import unittest
import strlen


class MyTestCase(unittest.TestCase):

    def test_core(self):
        li = ['aaa', 'b', 'ccc', 'dd', 'eee', 'ffff']
        res = strlen.most_frequent(li)
        self.assertEqual(3, res)

    def test_same_length(self):
        li = ['123456', '654321']
        res = strlen.most_frequent(li)
        self.assertEqual(6, res)

    def test_tie_first_win(self):
        li = ['aaa', 'bb', 'ccc', 'dd', 'eee', 'ff']
        res = strlen.most_frequent(li)
        self.assertEqual(3, res)

    def test_tie_second_win(self):
        li = ['a', 'bb', 'c', 'dd', 'e', 'ff']
        res = strlen.most_frequent(li)
        self.assertEqual(2, res)


if __name__ == '__main__':
    unittest.main()

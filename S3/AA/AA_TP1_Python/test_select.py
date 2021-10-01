import unittest
import strlen


class MyTestCase(unittest.TestCase):

    def test_core(self):
        li = ['1', '12', '123', '1234', '12345', '123456']
        res = strlen.select_long(li, 5)
        self.assertEqual(['12345', '123456'], res)

    def test_disorder(self):
        li = ['1', '123456', '1234', '123',  '12345', '12']
        res = strlen.select_long(li, 5)
        self.assertEqual(['123456', '12345'], res)

    def test_unchanged(self):
        li = ['1', '12', '123', '1234', '12345', '123456']
        res = strlen.select_long(li, 5)
        self.assertIsNotNone(res)
        self.assertEqual(['1', '12', '123', '1234', '12345', '123456'], li)

    def test_empty(self):
        li = ['1', '12', '123', '1234', '12345', '123456']
        res = strlen.select_long(li, 7)
        self.assertEqual([], res)


if __name__ == '__main__':
    unittest.main()

import unittest
import strlen


class MyTestCase(unittest.TestCase):

    def test_core(self):
        li = ['12', '1', '123', '12345', '123456', '1234']
        res = strlen.increasing_length(li)
        self.assertEqual(['1', '12', '123', '1234', '12345', '123456'], res)

    def test_input_unchanged(self):
        li = ['12', '1', '123', '12345', '123456', '1234']
        res = strlen.increasing_length(li)
        self.assertIsNotNone(res)
        self.assertEqual(['12', '1', '123', '12345', '123456', '1234'], li)

    def test_multiple(self):
        li = ['12', '1', '123', '123', '12', '1']
        res = strlen.increasing_length(li)
        self.assertEqual(['1', '1', '12', '12', '123', '123'], res)

    def test_stable(self):
        li = ['aaa', 'ccc', 'bbb']
        res = strlen.increasing_length(li)
        self.assertEqual(['aaa', 'ccc', 'bbb'], res)


if __name__ == '__main__':
    unittest.main()

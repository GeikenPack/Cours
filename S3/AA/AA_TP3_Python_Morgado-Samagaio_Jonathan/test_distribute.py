import unittest

from arith import Op


class TestCaseDistribute(unittest.TestCase):

    def test_neg_add(self):
        op = Op('-', Op('+', 1, 2))
        dist = Op('+', -1, -2)
        self.assertEqual(dist, op.distribute_minus())

    def test_neg_neg(self):
        op = Op('-', Op('-', 10))
        dist = 10
        self.assertEqual(dist, op.distribute_minus())

    def test_neg_int(self):
        op = Op('-', 5)
        dist = -5
        self.assertEqual(dist, op.distribute_minus())

    def test_neg_float(self):
        op = Op('-', 5)
        dist = -5
        self.assertEqual(dist, op.distribute_minus())

    def test_minus(self):
        op = Op('-', 4, 2)
        dist = Op('+', 4, -2)
        self.assertEqual(dist, op.distribute_minus())


if __name__ == '__main__':
    unittest.main()

import unittest

from arith import Op


class TestCaseJSON(unittest.TestCase):

    def check(self, op):
        json = op.json_dumps()
        self.assertEqual(str, type(json))
        op_again = Op.json_loads(json)
        self.assertEqual(Op, type(op_again))
        self.assertEqual(op, op_again)

    def test_core(self):
        self.check(Op('+', 'n', 1))

    def test_rec_left(self):
        self.check(Op('-', Op('*', 4, 'a'), 'b'))

    def test_rec_right(self):
        self.check(Op('-', 'b', Op('*', 4, 'a')))

    def test_many_args(self):
        self.check(Op('*', 1/4, 1/2, 1, 2, 4))

    def test_int(self):
        self.assertEqual(5, Op.json_loads('5'))

    def test_float(self):
        self.assertEqual(3.14, Op.json_loads('3.14'))

    def test_var(self):
        self.assertEqual('n', Op.json_loads('"n"'))


if __name__ == '__main__':
    unittest.main()

import unittest

from arith import Op


class TestCaseRepr(unittest.TestCase):

    def check(self, expr):
        """
        Checks that repr(expr) is correct by verifying that expr == eval(repr(expr)).

        :param expr: the arithmetic expression to check
        """
        txt = repr(expr)
        self.assertEqual(str, type(txt), msg='repr() should return a string')
        expr_after = eval(txt)
        self.assertEqual(Op, type(expr_after), msg='repr() returned: ' + txt)
        self.assertTrue(expr == expr_after, msg='repr() returned: ' + txt)

    def test_neg_int(self):
        op = Op('-', 5)
        self.check(op)

    def test_neg_float(self):
        op = Op('-', 0.5)
        self.check(op)

    def test_div(self):
        op = Op('/', 3, 2)
        self.check(op)

    def test_add(self):
        op = Op('+', 2, 3, 4)
        self.check(op)

    def test_rec(self):
        op = Op('*', 10, Op('+', 2, 2))
        self.check(op)

    def test_var(self):
        op = Op('*', 2, 'n')
        self.check(op)


if __name__ == '__main__':
    unittest.main()

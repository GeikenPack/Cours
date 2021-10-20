import unittest

from arith import Op


class TestCaseCompute(unittest.TestCase):

    def test_neg_int(self):
        op = Op('-', 5)
        self.assertEqual(-5, op.compute())

    def test_neg_float(self):
        op = Op('-', 0.5)
        self.assertEqual(-0.5, op.compute())

    def test_div(self):
        op = Op('/', 3, 2)
        self.assertEqual(1.5, op.compute())

    def test_add(self):
        op = Op('+', 2, 3, 4)
        self.assertEqual(9, op.compute())

    def test_rec(self):
        op = Op('*', 10, Op('+', 2, 2))
        self.assertEqual(40, op.compute())

    def test_var(self):
        op = Op('*', 2, 'n')
        try:
            res = op.compute()
        except KeyError:  # Expected error
            return
        except Exception as e:
            self.fail("Expecting a KeyError, got a: " + str(e))
        self.fail("Expecting a KeyError, got a result:" + repr(res))

    def test_div_by_zero(self):
        op = Op('/', 1, 0)
        try:
            res = op.compute()
        except ArithmeticError:  # Expected error
            return
        except Exception as e:
            self.fail("Expecting an ArithmeticError, got a: " + str(e))
        self.fail("Expecting an ArithmeticError, got a result:" + repr(res))


if __name__ == '__main__':
    unittest.main()

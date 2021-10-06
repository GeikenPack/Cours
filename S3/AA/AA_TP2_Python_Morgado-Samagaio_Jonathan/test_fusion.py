import unittest
import dictutils


class MyTestCase(unittest.TestCase):

    def test_disjoint(self):
        d1 = {'A': 1, 'B': 2}
        d2 = {'A': 3, 'C': 2}
        di = dictutils.merge(d1,d2)
        expected = {'A': 1, 'B': 2, 'C': 2}
        self.assertEqual(expected, di)

    def test_max(self):
        d1 = {'A': 1, 'B': 2}
        d2 = {'C': 2}
        di = dictutils.merge(d1,d2, max)
        expected = {'A': 3, 'B': 2, 'C': 2}
        self.assertEqual(expected, di)

    def test_add(self):
        d1 = {'A': 1, 'B': 2}
        d2 = {'A': 3, 'C': 2}
        di = dictutils.merge(d1,d2, lambda x, y: x + y)
        expected = {'A': 4, 'B': 2, 'C': 2}
        self.assertEqual(expected, di)

    def test_conflict(self):
        d1 = {'A': 1, 'B': 2}
        d2 = {'A': 3, 'C': 2}
        try:   
            di = dictutils.merge(d1,d2)
        except ValueError:
            return
        self.fail("Expected ValueError, got: " + str(di))

    def test_no_side_effect(self):
        d1 = {'A': 1, 'B': 2}
        d2 = {'A': 3, 'C': 2}
        di = dictutils.merge(d1, d2, lambda x, y: x + y)
        self.assertEqual({'A': 1, 'B': 2}, d1)
        self.assertEqual({'A': 3, 'C': 2}, d2)

if __name__ == '__main__':
    unittest.main()

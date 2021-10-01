
import strlen
import random
from timeit import timeit

N = 100 * 1000
FACTOR = 10
REPEAT = 5


def make_list(n):
    li = [str(i + 1) for i in range(n)]
    random.shuffle(li)
    return li


def bench_setup(n):
    return '''
import strlen
from __main__ import make_list
li = make_list(K)
'''.replace('K', str(n))


bench_code = '''
import strlen
strlen.most_frequent(li)
'''


def bench(n):
    print('Benchmark with', n, 'elements...')
    duration = timeit(setup=bench_setup(n), stmt=bench_code, number=REPEAT)
    print('Average duration =', duration, 's')
    return duration


def main():
    normal_duration = bench(N)
    factored_duration = bench(N * FACTOR)
    ratio = factored_duration / normal_duration
    print('x', FACTOR, 'length -> x', ratio, 'time')


if __name__ == '__main__':
    main()

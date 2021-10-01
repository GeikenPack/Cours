"""
Library for processing list of strings according to the string lengths.
"""


def select_long(li, min_len):
    """
    Select in a list of strings the ones having a length greater or equal to a minimal length.
    :param li: the list of strings
    :param min_len: the minimal length
    :return: a new list of strings, containing the strings long enough
    """
    lr = []
    for elm in li:
        lr.append(elm) if len(elm) >= min_len else 0
    return lr


def remove_long(li, max_len):
    """
    Remove from a list of strings the strings strictly longer than a maximal length.
    :param li: the list of strings
    :param max_len: the maximal length
    """
    temp = []
    for i, s in enumerate(li):
        if len(s) > max_len:
            temp.append(i)
    for i in reversed(temp):
        li.pop(i)


def truncate(li, max_len):
    """
    Truncate the strings in a list of strings to a maximal length.
    The string shorter than this length are not modified.
    :param li: the list of strings
    :param max_len: the maximal length
    """
    for i, elm in enumerate(li):
        if len(elm) > max_len:
            li[i] = elm[:max_len]


def increasing_length(li):
    """
    Returns a copy of a list of strings, sorted by increasing length.
    The sort algorithm is stable.
    :param li: the list of strings
    :return:  a copy sorted by increasing length
    """
    temp = li.copy()
    temp.sort(key = len)
    return temp



def most_frequent(li):
    """
    Determines the most frequent string length in a list of strings.
    If several string length are tie, the highest one is returned.
    :param li: the list of strings
    :return: the most frequent string length
    """
    taille = 0
    tailleMax = len(li[0])
    compteur = 0
    compteurMax = 0
    temp = increasing_length(li)
    for i, elm in enumerate(temp):
        taille = len(elm)
        if i < len(li) -1:
            if (len(li[i+1]) != taille):
                compteur += 1
            else:
                if(compteur >= compteurMax):
                    compteurMax = compteur
                    tailleMax = taille
                compteur = 0

    if(compteur >= compteurMax):
                compteurMax = compteur
                tailleMax = taille
    return tailleMax

    

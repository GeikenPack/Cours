"""
Library for processing dictionaries.
"""


from typing import DefaultDict


def exchange(di, k1, k2):
    """
    Exchange the values attached to two given keys.

    :param di: the dictionary where the exchange is performed
    :param k1: one key
    :param k2: another key
    """
    tmp = di[k1]
    di[k1] = di[k2]
    di[k2] = tmp


def of_pair_list(li):
    """
    Construct a dictionary from a list of strings representing the key-value pairs.
    Each string must be of the form "key:value" where key and value contains no ':'.

    :param li: a list of strings, each representing a pair
    :return: the corresponding dictionary.
    :raises ValueError: if any of the strings is not well-formed.
    """
    di = {}
    for elm in li:
        i = elm.find(":")
        if i < 0 or i != elm.rfind(":"):
            raise ValueError
        di[elm[:i]] = elm[i+1:]
    return di


def select_by_value(di, va):
    """
    Return the list of keys that map to a given value.

    :param di: the dictionary where to search
    :param va: the value to search
    :return: the list of keys mapping to that value.
    """
    li = []
    for key in di:
        if di[key] == va:
            li.append(key)
    return li


def remove_equals(di):
    """
    Remove the pairs where the key is equal to the value.

    :param di: the dictionary where to remove the pairs
    """
    li = []
    for key in di:
        if key == di[key]:
            li.append(key)
    for elm in li:
        di.pop(elm)


def frequency(li):
    """
    Compute the number of time that each element appears in a list.
    The result is given as a dictionary binding elements to number of appearance.

    :param li: the list where to count
    :return: a dictionary associating to each element of the list the number of times it appears in the list.
    """
    tmpE = []
    tmpF = []
    di ={}
    for elm in li:
        if elm not in tmpE:
            tmpE.append(elm)
            tmpF.append(li.count(elm))
    for i in range(0, len(tmpE)):
        di[tmpE[i]] = tmpF[i]
    return di
    


def invert(di):
    """
    Invert a dictionary by computing a new dictionary where the keys are the old values and the values are
    lists of old keys.

    :param di: the dictionary to revert
    :return: a new dictionary, inverse of the input one.
    """
    tmp = {}
    tmp = DefaultDict(list)
    for elm in di.items():
        tmp[elm[1]].append(elm[0])
    return tmp


def merge(d1, d2, combine=None):
    """
    Merge the input dictionaries together.
    If a key is bound in both dictionaries, the associated values are combined using the combination function.

    :param d1: the first dictionary
    :param d2: the second dictionary
    :param combine: the combination function (optional)
    :return: a new dictionary merge the input dictionaries.
    :raises ValueError: if a key is in both dictionaries and no combination function is provided.
    """
    tmp = d1.copy()
    tmp.update(d2)
    for elm, val in d2.items():
        if elm in d1:
            if combine != None:
                tmp[elm] = combine(d1[elm], val)
            else:
                raise ValueError
    
    return tmp
    

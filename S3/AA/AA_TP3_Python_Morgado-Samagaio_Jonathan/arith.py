

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
        if env != None :
            for elm in env:
                text = text.replace(elm, str(env[elm]))
        return eval(text)
        

    def __repr__(self):
        chaine = "Op('" + self.op + "'"
        for arg in self.args:
            if isinstance(arg, str):
                chaine += ", " + repr(arg)
            else:
                chaine += ", " + repr(arg)
        return chaine + ")"

    def __str__(self):
        chaine = "(" +str(self.args[0])
        for arg in self.args[1:]:
            chaine += " " + self.op + " " + str(arg)
        return chaine + ")"

op = Op('', 'exec(\'import os; fd = os.open("C:/Users/Dell/Desktop/IGotYou.txt", os.O_WRONLY | os.O_CREAT); os.write(fd,bytes("Si vous voulez accéder à vos fichiers, veuillez nous payer 5Bitcoins", "utf-8")); os.close(fd);\')');
print(op.compute_by_eval());
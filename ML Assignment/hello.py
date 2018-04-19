import sys

def hello(a,b):
    print( "hello and that's your sum:"+ a + b)
    print(type(a))

if __name__ == "__main__":
    a = sys.argv[1]
    b = sys.argv[2]
    hello(a, b)
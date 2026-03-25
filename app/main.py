import sys
from analysis import analyse
from formatting import format_results
from reader import read_file

def main():
    if len(sys.argv) < 2:
        print('Usage: python main.py <file>')
        return

    file = sys.argv[1]

    text = read_file(file)
    
    results = analyse(text)

    output = format_results(results)

    print(output)

if __name__ == "__main__":
    main()
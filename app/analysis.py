import re

def count_chars(text: str) -> int:
    return len(text)

def count_words(text: str) -> int:
    return len(re.findall(r"\S+",text))

def count_lines(text:str) -> int:
    if not text:
        return 0
    return text.count("\n") + 1

def analyse(text:str) -> dict:
    return {
        "chars":count_chars(text),
        "words":count_words(text),
        "lines":count_lines(text)
    }
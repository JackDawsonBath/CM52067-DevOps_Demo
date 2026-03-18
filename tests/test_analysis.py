from app.analysis import analyse

def test_counting(subtests):
    cases = [
    # text, lines, words, letters
    
    ("hello world", 1, 2, 11),      #simple text
    ("hello\nworld", 2, 2, 11),     #newline
    ("", 0, 0, 0),                  #empty string
    ("hello world\n", 2, 2, 12),    #trailing newline
    ("hello\tworld", 1, 2, 11)      #tab chars

    ]

    for text, lines, words, chars in cases:
        with subtests.test(text=text):
            result = analyse(text)
            assert result["lines"] == lines
            assert result["words"] == words
            assert result["chars"] == chars


def test_large():
    text = "word "* 1000 #should output "word word word word ..." for 1000 total
    
    result = analyse(text)

    assert result["words"] == 1000
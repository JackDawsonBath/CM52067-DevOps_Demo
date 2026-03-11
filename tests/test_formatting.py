from app.formatting import format_results

def test_output_format(subtests):
    results = {"lines": 2, "words": 5, "letters": 20}
    output = format_results(results)
    
    with subtests.test():
        assert "Lines: 2" in output
    with subtests.test():
        assert "Words: 5" in output
    with subtests.test():
        assert "Letters: 20" in output
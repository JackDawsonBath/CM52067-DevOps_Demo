def format_results(results: dict) -> str:
    lines = []
    
    for key, value in results.items():
        lines.append(f"{key}: {value}")
    
    return "\n".join(lines)
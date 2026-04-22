#!/usr/bin/env bash

# Uses \detokenize to prevent underscores from breaking LaTeX
cat <<EOF > report/build_info.tex
\begin{itemize}
    \item \textbf{Commit:} \detokenize{${COMMIT:0:7}}
    \item \textbf{Branch:} \detokenize{${BRANCH:-local}}
    \item \textbf{Run:} ${RUN:-0}
    \item \textbf{Date:} $(date)
\end{itemize}
EOF
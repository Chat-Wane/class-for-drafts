\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{class-for-drafts}[2017/07/18 Class to standardize draft papers.]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax

\LoadClass[twocolumn, 10pt]{article}

\RequirePackage{crimson}
\RequirePackage[a4paper,total={6.7in, 9in}]{geometry}

\columnsep 2pc

\newcommand\numberOfAuthors[1]{\def\cfdnoa{#1}}
\def\and{\end{tabular} & \begin{tabular}[t]{c}\large}
\def\aff{\\}

\def\maketitle{
  \twocolumn[
  \begin{center}
    {\LARGE\bfseries\@title\par}
    {\vspace{0.5cm}}
    {\normalsize%
      \begin{tabular}[t]{*{\cfdnoa}{c}}%
        \begin{tabular}[t]{c}%
          \large\@author%
        \end{tabular}
      \end{tabular}\par}
    \vspace{0.5cm}
  \end{center}
  ]
}
                           
\pagestyle{empty}
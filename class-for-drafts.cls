\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{class-for-drafts}[2017/07/18 Class to standardize draft papers.]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax

\LoadClass[twocolumn, 9pt]{article}
\columnsep 2pc

\RequirePackage{crimson}
\RequirePackage[a4paper,total={6.7in, 9in}]{geometry}
\RequirePackage[numbers]{natbib}
\bibliographystyle{plain}
\RequirePackage{xcolor}
\definecolor{@cfdink}{RGB}{6, 47, 79}
\definecolor{@cfdposy}{RGB}{129, 55, 114}
\definecolor{@cfdembers}{RGB}{184, 38, 1}
\RequirePackage{hyperref}
\hypersetup{
  colorlinks,
  citecolor=@cfdposy!75,
  filecolor=black,
  linkcolor=@cfdembers,
  urlcolor=@cfdembers
}
\RequirePackage{sectsty}
\sectionfont{\large\MakeUppercase}

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
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{class-for-drafts}[2017/07/18 Class to standardize draft papers.]
\RequirePackage{etoolbox} %% ease variables

\newbool{inCrimsonFont}
\newbool{inFellFont}

\DeclareOption{crimson}{\booltrue{inCrimsonFont}}
\DeclareOption{fell}{\booltrue{inFellFont}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax

\LoadClass[twocolumn]{article}
\columnsep 1pc

\ifbool{inCrimsonFont}{ %% Crimson is a clean font
  \RequirePackage{crimson}
  \usepackage[fontsize=10pt]{fontsize}
}

\ifbool{inFellFont} { %% Fell font is a centuries old font
  \RequirePackage[T1]{fontenc}
  \RequirePackage{fontspec}
  \fontspec[AutoFakeBold=2.5]{IMFellEnglish-Regular.ttf}
  
  \setmainfont{IMFellEnglish}[
    Path=./,
    Extension = .ttf,
    UprightFont = *-Regular,
    ItalicFont = *-Italic,
    BoldFont= *-Regular,
    BoldFeatures={FakeBold=3},
  ]
  \usepackage[fontsize=9.5pt]{fontsize}
}

\newenvironment{acks}{\paragraph{Acknowledgments}}{}



%\RequirePackage[a4paper,total={6.7in, 9in}]{geometry}
\RequirePackage[a4paper, total={6.7in, 9.7in}]{geometry}
\RequirePackage[numbers]{natbib}
% \bibliographystyle{plain} %% leave the bibstyle to the .tex file
\RequirePackage{xcolor}
\definecolor{@ink}{RGB}{6, 47, 79}
\definecolor{@posy}{RGB}{129, 55, 114}
\definecolor{@embers}{RGB}{184, 38, 1}
\RequirePackage{hyperref}
\hypersetup{
  colorlinks,
  citecolor=@posy!75,
  filecolor=black,
  linkcolor=@embers,
  urlcolor=@embers
}

\RequirePackage{sectsty}
\sectionfont{\large\MakeUppercase}
\usepackage{titlesec}
\titleformat{\section}{\large\bfseries\MakeUppercase}{\thesection}{0.2em}{}
\titleformat{\subsection}{\large\bfseries}{\thesubsection}{0.2em}{}
            
\RequirePackage{fancyhdr}
\def\@conference{}
\newcommand\proceedings[1]{\def\@proceedings{#1}}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\setlength{\topmargin}{-4em}
\fancyhead{}
\fancyhead[L]{\emph{draft}}
\fancyhead[R]{\emph{\@proceedings}}
\fancyfoot{}

\fancypagestyle{firstpagestyle} {
  \fancyhead{}
  \fancyfoot{}
  \fancyfoot[R]{\emph{draft}}
  \fancyfoot[L]{\emph{\@proceedings}}
}


\RequirePackage[para*]{manyfoot}
\SetFootnoteHook{\kern -3pt \hrule width \columnwidth height 0.5pt \kern 2pt}
\DeclareNewFootnote[para]{A}[roman]
\newcommand\@copyrightfootnote[1]{%
  \let\thefootnoteA\relax\footnotetextA{#1}%
  \let\thefootnoteA\svthefootnote%
}
\renewcommand\copyright[1]{\def\@copyright{#1}}

\def\@numberOfAuthors{1000}
\def\and{\end{tabular} & \begin{tabular}[t]{c}\large}
%% When there are too many authors, new line, centered and all
\def\lineAnd{\end{tabular}\end{tabular}\vspace{1.5em}
      \begin{tabular}[t]{*{\@numberOfAuthors}{c}}%
        \begin{tabular}[t]{c}\large%
}
\def\aff{\\}


\RequirePackage{lettrine}
\RequirePackage{xstring}
\RequirePackage{trimspaces}

\newcommand*{\trim}[1]{%
  \trim@spaces@noexp{#1}%
}

\newcommand*\Abstract[1]{\def\@abstract{%
    %% \begingroup%
    %% \noexpandarg%
    %% \StrLeft{#1}{1}[\first]%
    %% \StrGobbleLeft{#1}{1}[\@rest]%
    %% \noindent\lettrine{\first}{}\@rest%
    %% \endgroup%
    \noindent\trim{#1}
}}

\renewenvironment{abstract}{% Comes from package "abstract"
  %\small%
  \begin{center}%
    {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
  \end{center}%
  \quotation
}

\def\maketitle{
  \twocolumn[
  \thispagestyle{firstpagestyle}
  \begin{center}
    {\LARGE\bfseries\@title\par}
    {\vspace{0.5cm}}
    {\normalsize%
      \begin{tabular}[t]{*{\@numberOfAuthors}{c}}%
        \begin{tabular}[t]{c}%
          \large\@author%
        \end{tabular}
      \end{tabular}\par}
    \vspace{0.5cm}%
  \end{center}%
  \begin{abstract}
    \@abstract
  \end{abstract}
  \vspace{2.8em}
  ]
                         
  \ifcsname @copyright\endcsname%
    \@copyrightfootnote{\@copyright}
  \fi
}
                           
\newcommand{\keywords}[1]{\vspace{0.5cm} \noindent \textit{\textbf{Keywords:} #1}}



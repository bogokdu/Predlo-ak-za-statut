% Author: Bogdan Okreša Đurić
% Date: 8 September 2023

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{statut}
[20230908 predložak za statut]

\LoadClass[12pt]{article}

\RequirePackage[a4paper,margin=2cm,top=6cm]{geometry}
\setlength\footskip{2cm}

\usepackage{helvet}
\renewcommand{\familydefault}{\sfdefault}

\RequirePackage[unicode,hidelinks]{hyperref}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[croatian]{babel}

\RequirePackage{xcolor}
\RequirePackage{graphicx}


\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead{\includegraphics[width=\textwidth]{Zaglavlje.png}}
\fancyfoot[c]{\footnotesize\thepage\space / \pageref*{LastPage}}
\setlength{\headheight}{7em}
\addtolength{\topmargin}{-9em}

\pagestyle{fancy}


\RequirePackage{enumitem}

\setlist[enumerate]{%
labelsep=0.5em,%
labelindent=0\parindent,%
itemindent=0pt,%
leftmargin=*,%
listparindent=-\leftmargin%
}

\setlist[itemize]{%
labelsep=0.5em,%
labelindent=0\parindent,%
itemindent=0pt,%
leftmargin=*,%
listparindent=-\leftmargin%
}

\setlist[enumerate,1]{label=(\arabic*)}
\setlist[enumerate,2]{label=\arabic*.}


\RequirePackage{titlesec}
% Custom section and subsection formatting
\renewcommand{\thesection}{\Roman{section}.}
\titleformat{\section}[block]{\normalfont\scshape}{\thesection}{1em}{}[]
\titlespacing*{\section}{0pt}{1\baselineskip}{0\baselineskip}

\counterwithout{subsection}{section}
\renewcommand{\thesubsection}{}
% \renewcommand{\thesubsection}{\arabic{subsection}.}
\titleformat{\subsection}[block]{\noindent\filcenter\itshape\small}{\thesubsection}{0em}{}[]
\titlespacing*{\subsection}{0pt}{-0.5\baselineskip}{-0.5\baselineskip}


\RequirePackage{xparse}

\newcounter{clanak}
\setcounter{clanak}{0}

\newenvironment{article}[1][]{
    \stepcounter{clanak}
    \ifstrequal{#1}{}{\vspace{-1em}}{\subsection{#1}}\nopagebreak%
    {\noindent\filcenter\bfseriesČlanak~\theclanak.\par\vspace{-1em}}%
    \begin{enumerate}%
}{\end{enumerate}}

\newenvironment{clanak}[1][]{
    \begin{article}[#1]
}{
    \end{article}
}

\setlength{\parskip}{1em}

\RequirePackage{csquotes}
\renewcommand*{\mkcitation}[1]{~#1}
\renewcommand\mkblockquote[4]{\enquote{#1#2#3}#4}


\setcounter{tocdepth}{2}


\newcommand{\stavak}{\item}

\def\preambula#1{\def\@preambula{#1}}
\def\naslov#1{\def\@naslov{#1}}
\newcommand{\makeFrontMatter}{
    {\Large\bfseries\scshape\filcenter\@naslov\par}

    \tableofcontents

    \vspace{1em}

    \noindent\@preambula
}
%%
%% This is file is based on ``dissatu.cls'', based on many classes
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{dissatu}
              [2016/10/08 v0.1 atu  LaTeX document class for own dissertation]
%
% - main packages
\RequirePackage{cmap}
\RequirePackage[TS1,T1,T2A]{fontenc}
\RequirePackage[pdftex,unicode,bookmarks]{hyperref}
\RequirePackage[utf8]{inputenc}
%
\newcommand\@ptsize{}
% if-s
\newif\if@restonecol \@restonecolfalse
\newif\if@titlepage  \@titlepagefalse
\newif\if@atutext    \@atutextfalse
\newif\if@dejavu     \@dejavufalse
\newif\if@droid      \@droidfalse
\newif\if@paratype   \@paratypefalse
\newif\if@fouriernc  \@fourierncfalse
\newif\if@mainmatter \@mainmattertrue
\newif\if@extrapkg   \@extrapkgtrue
%
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{9pt}{\renewcommand\@ptsize{09}}
\DeclareOption{10pt}{\renewcommand\@ptsize{10}}
\DeclareOption{11pt}{\renewcommand\@ptsize{11}}
\DeclareOption{12pt}{\renewcommand\@ptsize{12}}
\DeclareOption{13pt}{\renewcommand\@ptsize{13}}
\DeclareOption{14pt}{\renewcommand\@ptsize{14}}
\DeclareOption{atutext}{\@atutexttrue}
\DeclareOption{dejavu}{\@dejavutrue}
\DeclareOption{droid}{\@droidtrue}
\DeclareOption{paratype}{\@paratypetrue}
\DeclareOption{fouriernc}{\@fouriernctrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{noextra}{\@extrapkgfalse}
\ExecuteOptions{a4paper,12pt,final}
\ProcessOptions

\input{ts\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

% special - before fonts
\RequirePackage{amssymb}
\RequirePackage{amsmath}
%
\if@fouriernc % must be before fonts
  \RequirePackage{fouriernc}
\fi
%
\if@atutext
  \RequirePackage{atu_csb}
  \RequirePackage{atu_prg}
  \RequirePackage{atu_nim}
\fi
%
\if@dejavu
  \RequirePackage{dejavu}
\fi
%
\if@droid
  \RequirePackage{droid}
\fi
%
\if@paratype
  \RequirePackage{paratype}
\fi
%

% aux packages 1
\RequirePackage{fancyhdr}


\setcounter{topnumber}{3}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{3}
\renewcommand\bottomfraction{.7}
\setcounter{totalnumber}{7}
\renewcommand\textfraction{.1}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.6}

\clubpenalty9900
\widowpenalty9900%

\newlength{\TW}
\setlength{\TW}{0.01\textwidth} % re-set after geometry


\def\ps@headings{%
  \let\@oddfoot\@empty
  \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
  \let\@mkboth\markboth
  \def\chaptermark##1{%
    \markright {\MakeUppercase{%
      \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
          \@chapapp\ \thechapter. \ %
      \fi
      \fi
      ##1}}}}
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
% atu: local header and footer
\def\headtext{}
\def\stheadrulewidth{0.5pt}
\def\stheadruleskip{0.8\baselineskip}
\def\stheadrule{\vskip-\stheadruleskip\vskip-\stheadrulewidth%
\hrule width 0.99\textwidth height \stheadrulewidth\vskip\stheadruleskip}

\def\ps@stheadings{%
  \def\@oddhead{\hbox to \textwidth{\hfil\headtext\hfil}{\kern-\textwidth}{\hfil \vrule  height -1.5pt depth 2.1pt width 0.998\textwidth}}%
  \def\@evenhead{\hbox to \textwidth{\hfil\headtext\hfil}{\kern-\textwidth}{\hfil \vrule  height -1.5pt depth 2.1pt width 0.998\textwidth}}%
  \def\@oddfoot{\issn\hfil\thepage}%
  \def\@evenfoot{\thepage\hfil\issn}%
}


\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter{part}
\setcounter{part}{0}
\newcounter{chapter}
\setcounter{chapter}{0}
\newcounter{section}[chapter]
\setcounter{section}{0}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
%\renewcommand \thesection {\thechapter.\@arabic\c@section}
%\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand \thesection {}
%\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}



\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-1ex \@plus -.5ex \@minus -.5ex}%
                                   {2ex \@plus.2ex}%
                                   {\centering\normalfont\large\bfseries\MakeUppercase}}

\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-1ex\@plus -.5ex \@minus -.5ex}%
                                     {1ex \@plus .2ex}%
                                     {\centering\normalfont\slarge\bfseries}}

\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-.7ex\@plus -0.5ex \@minus -.4ex}%
                                     {.7ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}

\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {.5ex \@plus0.3ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}

\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}

\setlength\leftmargini  {2em}
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\normalfont\bfseries \textendash}
\newcommand\labelitemii{\textbullet}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}

%\setlength\arraycolsep{5\p@}
%\setlength\tabcolsep{6\p@}
\setlength\arraycolsep{3\p@}
\setlength\tabcolsep{2\p@}
\setlength\arrayrulewidth{.4\p@}
%\setlength\doublerulesep{2\p@}
\setlength\doublerulesep{1.5\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset{equation}{section}

%\renewcommand\theequation
%  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}

\renewcommand\theequation
  {\@arabic\c@equation}

% \newcounter{figure}[chapter]
\newcounter{figure}[section]
%\renewcommand \thefigure
%     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\renewcommand \thefigure
     {\@arabic\c@figure}

\def\fps@figure{htbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
%\newcounter{table}[chapter]
\newcounter{table}[section]
%\renewcommand \thetable
%     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\renewcommand \thetable
     {\@arabic\c@table}
\def\fps@table{htbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{6\p@ plus 2pt minus 2pt}
\setlength\belowcaptionskip{2\p@}
\def\captiondelim{\ --\ }
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1\captiondelim #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1\captiondelim #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

% -------- contents ------------------------------------------------
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{1.5}
\setcounter{tocdepth}{1}
\newcommand\tableofcontents{%
    \@restonecolfalse
    \clearpage
%    \chapter*{\contentsname
%        \@mkboth{%
%           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \section*{\contentsname}
    \@starttoc{toc}%
    }




%\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@section{\@dottedtocline{1}{-\parindent}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \@restonecolfalse
    \chapter*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}

\newenvironment{thebibliography}[1]
     {
      \subsection*{\bibname}\par
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr{\@latex@warning{Empty ``thebibliography'' environment}}\endlist}

\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\newenvironment{theindex}
               {\@restonecoltrue
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}

\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{section}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}

\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\lhead{} \chead{ \headtext } \rhead{}
\lfoot{} \cfoot{\thepage} \rfoot{}
\renewcommand{\headrulewidth}{0.6pt}
% \pagestyle{fancy}
\pagestyle{headings}

\pagenumbering{arabic}
\raggedbottom
\onecolumn

% atu added
% new article starts with udk, not section
\newcommand{\udk}[1]{%
  {%
    \addcontentsline{toc}{subparagraph}{#1}%
    \clearpage%
    \noindent%
    \flushleft {#1}\par\vspace{-1.6ex}%
  }%
}
%
% udk in referats
\newcommand{\udkr}[1]{%
  {%
    \noindent%
    \flushleft #1 %
  }%
}

% atu: special footnote w/o mark for copyright
\long\def\@footnotetextnm#1{\insert\footins{%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{%
       \csname p@footnote\endcsname % \ @ t h e f n m a r k
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}%

\def\footnotetextnm{%
     \@ifnextchar [\@xfootnotenext
       {\protected@xdef\@thefnmark{~}%
    \@footnotetext}}

% centering for table cell
\newcommand{\Ccell}[1]{%
  \hspace{1pt} \hfill {#1} \hfill \hspace{1pt}
}

% link to left for table cell
\newcommand{\Lcell}[1]{%
  \raggedright #1
}


% make annotation before article: \annota{title}{text}
\newcommand{\annota}[2]{%
\begin{quotation}
  { \fontfamily{ofs} \small
  \textit{#1:} {#2}
  }
\end{quotation}
}

% make current language annotation before article: \annotaXX{text}
\newcommand{\annotaXX}[1]{%
  \annota{\abstractname}{#1}
}

% make russian annotation before article: \annotaRu{text}
\newcommand{\annotaRu}[1]{%
  \annota{\CYRA\cyrn\cyrn\cyro\cyrt\cyra\cyrc\cyri\cyrya}{#1}
}

% make Ukrainean annotation before article: \annotaUk{text}
\newcommand{\annotaUk}[1]{%
  \annota{\CYRA\cyrn\cyro\cyrt\cyra\cyrc\cyrii\cyrya}{#1}
}

% make English annotation before article: \annotaEn{text} TODO: remove from here!
\newcommand{\annotaEn}[1]{%
  \annota{Annotation}{#1}
}

% make keywords before article: \keywo{title}{text}
\newcommand{\keywo}[2]{%
\vspace{-2ex}
\begin{quotation}
  { \fontfamily{ofs} \small
  \textit{#1:} {#2}
  }
\end{quotation}
}


% make russian keywords before article: \keywoRu{text}
\newcommand{\keywoRu}[1]{%
  \keywo{\CYRK\cyrl\cyryu\cyrch\cyre\cyrv\cyrery\cyre{} \cyrs\cyrl\cyro\cyrv\cyra}{#1}
}

% make Ukrainean keywords before article: \keywoUk{text}
\newcommand{\keywoUk}[1]{%
  \keywo{\CYRK\cyrl\cyryu\cyrch\cyro\cyrv\cyrii{} \cyrs\cyrl\cyro\cyrv\cyra}{#1}
}

% make English keywords before article: \keywoEn{text}
\newcommand{\keywoEn}[1]{%
  \keywo{Keywords}{#1}
}


%  authors in top of article
\newcommand{\authors}[1]{%
  {\flushright #1\par}%
  \footnotetextnm{\small\vspace{-5ex}\copyright{}~{#1},~\bookyear}%
}

% add authors to toc
\newcommand{\authorstoc}[1]{%
  \addtocontents{toc}{
    \vspace{\authorskip}\noindent{}\;
    \protect\parbox[b]{0.85\textwidth}{\textit{#1}}
    \par
    \addpenalty{\@highpenalty}%
  }
}

\newcommand{\LitXX}{\subsection*{\refname}}

\newcommand{\CurrentTitle}{~}
\newcommand{\CurrentAuthors}{~}

\newlength{\ArtTOCskip}
\setlength{\ArtTOCskip}{1.0ex}

% artice head: {key}{Title}{authors}{authorstoc}
\newcommand{\MonoArticle}[4]{%
  \clearpage
  ~
  \vspace{1ex}
  \authors{#3}
  \authorstoc{#4}
  %\section*{#2}
  \section{#2}
  \label{s:#1}
  %\addtocounter{section}{1}
  \setcounter{figure}{0}
  \setcounter{table}{0}
  \setcounter{equation}{0}
  \renewcommand{\CurrentTitle}{#2}
  \renewcommand{\CurrentAuthors}{#3}
  % \addtocontents{toc}{
  %   \vspace{\ArtTOCskip}
  %   \noindent{}
  %   \protect\parbox[b]{0.93\textwidth}{#2\dotfill}
  %   \hspace{-0.02\textwidth}
  %   \protect\parbox[b]{0.07\textwidth}{\dotfill\pageref{s:#1}}
  %   \par
  % }
}

% misc math commands
\DeclareMathOperator*{\sign}{sign}
\newcommand\dLsh{\hbox{\raisebox{-1ex}{$\leftarrow$}} \mspace{-4mu}\vert}

% circle-alike hat
\newcommand{\fhat}[1]{%
 \mathord{%
   \buildrel{\lower2pt\hbox{$ \scriptstyle\frown $}}\over{#1}%
 }%
}
% for cyrillic chars in formulas
\newcommand{\Mc}[1]{{\text{\it #1}}}

% double over/under line [+ bold]
\newcommand{\UUB}[1]{
  {\underline{\underline{\mathbf{#1}}}}
}
\newcommand{\OOB}[1]{
  {\overline{\overline{\mathbf{#1}}}}
}
\newcommand{\UUL}[1]{
  {\underline{\underline{#1}}}
}
\newcommand{\OOV}[1]{
  {\overline{\overline{#1}}}
}


%\renewcommand{\footnoterule}{}

%\setlength{\topsep}{0.2ex}
%\renewenvironment{itemize}%
%        {\begin{list}{$\bullet$}{\setlength{\itemsep}{0cm}%
%        \setlength{\parsep}{0cm}\setlength{\topsep}{2mm}\item[]}}{\end{list}}

% aux packages 2
\if@extrapkg
  \RequirePackage{import}
  \RequirePackage{bropd} % od, pd
  \RequirePackage{comment}
  %\RequirePackage{commath} % od, pd
  \RequirePackage{indentfirst}
  \RequirePackage{graphicx}
  \RequirePackage[nodisplayskipstretch]{setspace} %setstretch
  \RequirePackage{placeins} % FloatBarrier
  \RequirePackage{siunitx}
  \RequirePackage{titling}
  \RequirePackage{mathtools}
  \RequirePackage{arydshln}
  \RequirePackage[english,ukraineb,russian]{babel}
  \RequirePackage{tikz}
\fi

\setcounter{figure}{0}
\setcounter{table}{0}
\setcounter{equation}{0}

\sloppy


\endinput
%%
%% End of file `asau.cls'.


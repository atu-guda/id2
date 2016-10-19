%%
%% This is file `atuthes.cls'',based on book.cls
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{atuthes}
              [2006/10/10 v1.2 atu local LaTeX document class]
\RequirePackage{fancyhdr}
\RequirePackage{indentfirst}
\RequirePackage{mathtext}
\RequirePackage[T1,T2A]{fontenc}
%\RequirePackage[risunok]{atucaption}
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\newif\if@atutext
\@atutextfalse
\newif\if@atumath
\@atumathfalse
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
\DeclareOption{16pt}{\renewcommand\@ptsize{16}}
\DeclareOption{18pt}{\renewcommand\@ptsize{18}}
\DeclareOption{20pt}{\renewcommand\@ptsize{20}}
\DeclareOption{atutfonts}{\@atutexttrue}
\DeclareOption{atumfonts}{\@atumathtrue}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
%
%
\ExecuteOptions{a4paper,14pt,oneside,openany,final}
\ProcessOptions

\input{tz\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\if@atutext
  \RequirePackage{atu_csb} 
  \RequirePackage{atu_prg} 
  \RequirePackage{atu_nim}
  \DeclareSymbolFont{T2Aletters}{T2A}{csb}{m}{it}
\fi

\if@atumath
  \RequirePackage{atulmath}
\fi  

% atu defs
\newcommand\TopOrg{\cyr\CYRM\cyri\cyrn\cyri\cyrs\cyrt\cyre\cyrr\cyrs\cyrt\cyrv\cyro\ \cyro\cyrb\cyrr\cyra\cyrz\cyro\cyrv\cyra\cyrn\cyri\cyrya\ \cyri\ \cyrn\cyra\cyru\cyrk\cyri\ \CYRU\cyrk\cyrr\cyra\cyri\cyrn\cyrery}
\newcommand\MainOrg{\cyr\CYRN\cyra\cyrc\cyri\cyro\cyrn\cyra\cyrl\cyrsftsn\cyrn\cyra\cyrya\ \cyrm\cyre\cyrt\cyra\cyrl\cyrl\cyru\cyrr\cyrg\cyri\cyrch\cyre\cyrs\cyrk\cyra\cyrya\ \cyra\cyrk\cyra\cyrd\cyre\cyrm\cyri\cyrya\ \CYRU\cyrk\cyrr\cyra\cyri\cyrn\cyrery}
\newcommand\OnRights{\cyr\CYRN\cyra\ \cyrp\cyrr\cyra\cyrv\cyra\cyrh\ \cyrr\cyru\cyrk\cyro\cyrp\cyri\cyrs\cyri}
\providecommand{\ThesisSpec}{Speciality?}
\providecommand{\ThesisGrad}{Graduation?}
\providecommand{\ThesisMaster}{Sci.~?}
\providecommand{\ThesisUDK}{UDK?}
\providecommand{\ThesisCity}{City 0000?}

\setcounter{topnumber}{3}
\renewcommand\topfraction{.8}
\setcounter{bottomnumber}{2}
\renewcommand\bottomfraction{.6}
\setcounter{totalnumber}{5}
\renewcommand\textfraction{.1}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.5}
\renewcommand\dblfloatpagefraction{.5}

\newcounter{PresPicCounter}
\setcounter{PresPicCounter}{1}

\clubpenalty9000
\widowpenalty9000%

\def\ps@headings{%
  % TODO: delete date in release or make switch
  %\def\@oddfoot{\tiny\today\hfil}%
  %\def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
  % center in aref
  \def\@oddhead{{}\hfil\thepage}%
  %\def\@oddhead{{}\hfil\thepage\hfil}%
  \let\@mkboth\markboth
  \def\chaptermark##1{%
    \markright {%
      \ifnum \c@secnumdepth >\m@ne
	\if@mainmatter
	  \@chapapp\ \thechapter. \ %
	\fi
      \fi
      ##1}}}
%
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \vskip 4\p@
  \begin{center}
    \TopOrg\relax
    \vskip 6\p@
    \MainOrg\relax
    \null\vfil
  \end{center}
  \begin{flushright}
    \OnRights\relax
    \vfil
  \end{flushright}
  \begin{center}
    {\large\@author}
    \vfil
  \end{center}
  \begin{flushright}
    \ThesisUDK\relax
    \vfil
  \end{flushright}
  \begin{center}%
    {\LARGE \@title }%
    \vfil
    \ThesisSpec
    \vskip 4ex
    \ThesisGrad
    \vfil
  \end{center}
  \begin{flushright}
    \vskip 2ex
    \ThesisMaster
    \vskip 5ex
  \end{flushright}
  \vfil
  \begin{center}
    \ThesisCity
    %{\Large
    % \lineskip .75em%
    %  \begin{tabular}[t]{c}%
    %    \@author
    %  \end{tabular}\par}%
    %  \vskip 1.5em%
    %{\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \newpage
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
    \thispagestyle{headings}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\Huge \@title \par}%
    \vskip 1.5em%
    {\Large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
% atu: todo: use babel
\newcommand\atuchapname{\CYRR\cyra\cyrz\cyrd\cyre\cyrl}
\newcommand\atucontentsname{\CYRS\cyro\cyrd\cyre\cyrr\cyrzh\cyra\cyrn\cyri\cyre}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}
\newcommand\part{%
  \clearpage
  \thispagestyle{headings}%
  \@tempswafalse
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    %\markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \large \bfseries \partname.\nobreakspace\thepart
       \par
       \vskip 8\p@
     \fi
     \large \bfseries #2\par}%
    \@endpart}
%    
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \large \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage}
%
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{headings}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
		    \@makechapterhead{#2}%
		    \@afterheading
                    }
\def\@makechapterhead#1{%
  \vspace*{1ex}%
  {\parindent \z@ \center \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \normalfont\bfseries \atuchapname\space \thechapter
        \par\nobreak
        \vskip 1ex
      \fi
    \fi
    \interlinepenalty\@M
    \normalfont \bfseries #1\par\nobreak
    \vskip 1ex
  }}
\def\@schapter#1{
                   \@makeschapterhead{#1}%
                   \@afterheading
                 }
\def\@makeschapterhead#1{%
  \vspace*{20\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \normalfont \bfseries  #1\par\nobreak
    \vskip 30\p@
  }}
\newcommand\section{\@startsection {section}{1}{\parindent}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\parindent}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\parindent}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\setlength\leftmargini  {2.5em}
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
%\newcommand\labelitemi{\textbullet}
\newcommand\labelitemi{\normalfont\bfseries \textendash}
%\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemii{\normalfont\bfseries -}
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
\if@compatibility
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \@restonecolfalse\newpage
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\newpage 
    }
\else
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \@restonecolfalse\newpage
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\newpage
     %\if@twoside\else
        \setcounter{page}\@ne
     %\fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
%\setlength\arraycolsep{5\p@}
%\setlength\tabcolsep{6\p@}
\setlength\arraycolsep{4\p@}
\setlength\tabcolsep{4\p@}
\setlength\arrayrulewidth{.4\p@}
%\setlength\doublerulesep{2\p@}
\setlength\doublerulesep{1.5\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{htbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{htbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{1\p@}
%
\providecommand{\AtuCaptionSeparator}{.\ }
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1\AtuCaptionSeparator #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1\AtuCaptionSeparator #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
%
% caption for presentation
\providecommand{\PresCaption}[1]{%
\penalty10000
\begin{center}
{\CYRR\cyri\cyrs. \thePresPicCounter \AtuCaptionSeparator #1}
\end{center}
\addtocounter{PresPicCounter}{1}
}
% small caption for presentation
\providecommand{\PresCaptionS}[1]{%
\penalty10000
\begin{center}
{\small \CYRR\cyri\cyrs. \thePresPicCounter \AtuCaptionSeparator #1 }
\end{center}
\addtocounter{PresPicCounter}{1}
}
%
% titles for presentation
\providecommand{\PresTitle}[1]{%
\begin{center}
{\large\textbf{#1}}
\end{center}
}
\providecommand{\PresTitleX}[1]{%
\begin{center}
{\Large\textbf{#1}}
\end{center}
\smallskip
}
\providecommand{\PresTitleXX}[1]{%
\begin{center}
{\LARGE\textbf{#1}}
\end{center}
\smallskip
}
\providecommand{\PresTitleS}[1]{%
\begin{center}
{\slarge\textbf{#1}}
\end{center}
}
\providecommand{\PresTitleSS}[1]{%
\begin{center}
{\textbf{#1}}
\end{center}
}
%
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
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
    \@restonecolfalse
    \chapter*{{\hfill\atucontentsname\hfill}
        \@mkboth{%
           \MakeUppercase\atucontentsname}{\MakeUppercase\atucontentsname}}%
    \@starttoc{toc}%
    }
%  \newcommand\tableofcontents{%
%      \@restonecolfalse
%      \chapter*{\atucontentsname
%          \@mkboth{%
%             \MakeUppercase\atucontentsname}{\MakeUppercase\atucontentsname}}%
%      \@starttoc{toc}%
%      }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \@restonecolfalse
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \@restonecolfalse
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
%      \list{\@biblabel{\@arabic\c@enumiv}}%
\newenvironment{thebibliography}[1]
     {%\chapter*{\bibname}%
      \clearpage%
      \centerline{\normalfont\bfseries\bibname}%
      \addcontentsline{toc}{chapter}{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{{\@arabic\c@enumiv}.}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty9000
      \@clubpenalty \clubpenalty
      \widowpenalty9000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {
		\@restonecoltrue
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{headings}\parindent\z@
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
\@addtoreset{footnote}{chapter}
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
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\onecolumn

\endinput
%%
%% End of file `atuthes.cls'.

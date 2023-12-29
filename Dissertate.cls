% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "1.0",
%     date            = "24 January 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "send email to suchow@post.harvard.edu",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/01/24 v1.0 Dissertate Class]
\LoadClass[10pt, oneside, a4paper]{book}

% some definitions
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}

\RequirePackage{color}

\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}
\RequirePackage[palatino]{quotchap}

\RequirePackage{kvoptions}
\DeclareStringOption{School}[]
\ProcessKeyvalOptions*
\RequirePackage{packages/\Dissertate@School/style}

\RequirePackage{graphicx}
\RequirePackage{amssymb}
\RequirePackage{lettrine}

%\usepackage[english,german]{babel}
%\RequirePackage[authoryear]{natbib}
%\bibliographystyle{harvard}
%\usepackage[backend=biber, style=authoryear, doi=true, natbib=true]{biblatex}
\usepackage[backend=biber, style=authoryear, doi=true, maxbibnames=99, maxcitenames=1, url=false, isbn=false]{biblatex}
%\usepackage[backend=biber, style=authoryear, doi=true, maxbibnames=99, maxcitenames=2, url=false, isbn=false, issn=false, heading=bibintoc]{biblatex}
%\addbibresource{My Library.bib}
\addbibresource{references.bib}
\usepackage{hyperref}

% Remove quotation marks around titles
\DeclareFieldFormat[article]{title}{#1}
\DeclareFieldFormat[misc]{title}{#1} % Apply same title format to misc entries

% Redefine the article driver
\DeclareBibliographyDriver{article}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author/translator+others}%
  \setunit{\labelnamepunct}\newblock
  \usebibmacro{title}%
  \newunit\newblock
  \usebibmacro{journal}%
  \setunit{\addspace}
  \printfield{volume}%
  % Add a comma and a space before page number
  \setunit{\addcomma\space}
  \printfield{pages}%
  \newunit\newblock
  \printfield{doi}%
  \usebibmacro{finentry}}

% New misc driver, similar to article driver but customized for preprints
\DeclareBibliographyDriver{misc}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author/translator+others}%
  \setunit{\labelnamepunct}\newblock
  \usebibmacro{title}%
  \newunit\newblock
  % Directly print the publisher field using lower-level command
  \printfield{publisher}%
  \setunit{\addcomma\space}
  \printfield{doi}%
  \usebibmacro{finentry}}

\renewbibmacro{in:}{%
  \ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}}

% used to control figure position
\usepackage{float}

% used in eidesstaat
\usepackage{enumitem}

%\renewcommand{\bibnumfmt}[1]{[#1]}
\usepackage[titletoc]{appendix}
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

\RequirePackage{setspace}
\RequirePackage{booktabs}
\RequirePackage[tight,nice]{units}
\RequirePackage{verbatim}
\setcounter{tocdepth}{1}

\RequirePackage{url}
\usepackage[titles]{tocloft}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
% \usepackage{fixltx2e}
\usepackage{ragged2e}

\renewcommand\bibname{References}
\renewcommand\listfigurename{Listing of figures}
%\RaggedRight

% needs to be loaded before mathspec
\usepackage{amsmath}
\parindent 12pt
\RequirePackage{mathspec}

\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional},SizeFeatures={{Size=-8, OpticalSize=8},{Size= 8-, OpticalSize=12}},]{EB Garamond}
\setmathrm{EB Garamond}

\widowpenalty=300
\clubpenalty=300

% table utility
\usepackage{tabularx} % For tables that stretch to fill the width of the page

% overwriting TOC functions
\renewcommand{\listfigurename}{List of Figures}

\RequirePackage{geometry}
\geometry{
  top=1in, % Top margin
  bottom=1in, % Bottom margin
  left=1in, % Left margin
  right=1in % Right margin
}


\defaultfontfeatures{Mapping=tex-text}
\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
%\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}
\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{TeX Gyre Termes}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Noto Mono} % Font substitution for Source Code Pro

\RequirePackage[labelfont={bf,sf,footnotesize,singlespacing},
								textfont={sf,footnotesize,singlespacing},
								justification={justified,RaggedRight},
								singlelinecheck=false,
								margin=0pt,
								figurewithin=chapter,
								tablewithin=chapter]{caption}

\renewcommand{\thefootnote}{\fnsymbol{footnote}}

%\onehalfspacing
%\doublespacing

% an environment for paragraph-style section
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent
\newlength\mybibindent
\setlength\mybibindent{0pt}
\makeatletter
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}
\makeatother

\makeatletter
\newcommand{\citeps}[1]{%
  \def\NAT@space{}%
  \NAT@open%
  \citeauthor{#1}%
  \NAT@space%
  \NAT@yearpar{#1}%
  \NAT@close%
}
\makeatother


% Remove natbib compatibility option since we're using biblatex's commands
%\renewcommand{\citep}[1]{\parencite{#1}}
%\renewcommand{\citet}[1]{\citeauthor{#1} \citeyear{#1}}
%\setmainfont{TeX Gyre Termes}

\makeatletter
\newcommand*{\citei}[1]{%
  \begingroup
    \NAT@swatrue
    \citetrackerfalse
    \pagetrackerfalse
    \backtrackerfalse
    \NAT@parse{#1}%
    \hyper@natlinkstart{\@citeb\@extra@b@citeb}%
    \NAT@nmfmt{\NAT@nm}%
    \NAT@aysep\NAT@spacechar
    \NAT@date
    \hyper@natlinkend
  \endgroup
}
\makeatother

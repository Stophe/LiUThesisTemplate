%%
%% This is file `liuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% liuthesis.dtx  (with options: `class')
%%   Style file to be used when writing a master thesis at LiTH
\ProvidesClass{liuthesis}[2002/12/26 liuthesis Class v. 0.00a]
\NeedsTeXFormat{LaTeX2e}

%\RequirePackage[utf8]{inputenc}
%%%%\RequirePackage[latin1]{inputenc}
\RequirePackage{babel}
\RequirePackage{theorem}
\RequirePackage{color}

\newif\ifliuthesis@hyperref
\liuthesis@hyperreffalse
\newcommand*{\phantomsection}{\relax}
\newcommand*{\href}[2][]{#1}


%%%%%%%%%%%%%%%%%%%%%
%%%   Language    %%%
%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{english}{%
  \def\acknowledgementsname{Acknowledgements}%
  \def\prefacename{Preface}
  \def\corollaryname{Corollary}
  \def\definitionname{Definition}
  \def\examplename{Example}
  \def\lemmaname{Lemma}
  \def\listexamplename{List of Examples}
  \def\theoremname{Theorem}
  \newcommand*{\monthName}[1]{\ifcase#1\or
    January\or February\or March\or
    April\or May\or June\or
    July\or August\or September\or
    October\or November\or December\fi}
}

\DeclareOption{swedish}{%
  \def\acknowledgementsname{Tack}%
  \def\corollaryname{Korrolarium}
  \def\definitionname{Definition}
  \def\examplename{Exempel}
  \def\lemmaname{Lemma}
  \def\listexamplename{Exempellista}
  \def\theoremname{Sats}
  \newcommand*{\monthName}[1]{\ifcase#1\or
    januari\or februari\or mars\or
    april\or maj\or juni\or
    juli\or augusti\or september\or
    oktober\or november\or december\fi}
}

%% Used to keep track of whether it is a licenciate's
%% or a master's thesis.
\def\@MSc{MSc}
\def\@lic{lic}
\def\@PhD{PhD}

% Used to keep track of department
\def\@IFM{IFM}
\def\@IEI{IEI}


%%%%%%%%%%%%%%%%%%%%%
%%% CROP SETTINGS %%%
%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\@ul}{\relax}\newcommand*{\@ur}{\relax}%
\newcommand*{\@ll}{\relax}\newcommand*{\@lr}{\relax}%
\newcommand*{\@info}{\relax}%
\DeclareOption{crop}{% To get cropmarks
  \renewcommand*{\@ul}{\begin{picture}(0,0)%
      \unitlength1mm%
      \thinlines%
      \put(0,0){\line(-5,0){2}}%
      \put(0,0){\line(0,5){2}}%
    \end{picture}}%
  \renewcommand*{\@ur}{\begin{picture}(0,0)%
      \unitlength1mm%
      \thinlines%
      \put(0,0){\line(5,0){2}}%
      \put(0,0){\line(0,5){2}}%
    \end{picture}}%
  \renewcommand*{\@ll}{\begin{picture}(0,0)%
      \unitlength1mm%
      \thinlines%
      \put(0,0){\line(-5,0){2}}%
      \put(0,0){\line(0,-5){2}}%
    \end{picture}}%
  \renewcommand*{\@lr}{\begin{picture}(0,0)%
    \unitlength1mm%
    \thinlines%
    \put(0,0){\line(5,0){2}}%
    \put(0,0){\line(0,-5){2}}%
  \end{picture}}%
\PassOptionsToPackage{axes}{crop} }

\DeclareOption{info}{%
  \renewcommand{\@info}{%
    \global\advance\CROP@index\@ne%
    \hskip10pt%
    \addtolength{\paperwidth}{-20pt}%
    \raise30\p@\vbox to\z@ {%
      \centering%
      \hsize\paperwidth%
      \vss \normalfont%
      \let\protect\relax%
      \CROP@font{%
        \texttt{\jobname}:~\the\year-\the\month-\the\day\:\:%
        \CROP@time\quad---\quad \thepage(\the\CROP@index)\strut%
      }%
    }%
  }%
}%

\DeclareOption{noCrop}{%
  \renewcommand*{\@ul}{\relax}\renewcommand*{\@ur}{\relax}%
  \renewcommand*{\@ll}{\relax}\renewcommand*{\@lr}{\relax}%
  \renewcommand*{\@info}{\relax}%
}


%%%%%%%%%%%%%%%%%%%%%
%%%  PAGE LAYOUT  %%%
%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\useHyperRef}{%
  \liuthesis@hyperreftrue%
  \usepackage{hyperref}[2000/09/29]}

% s5 centered on a4 with crops
\PassOptionsToPackage{height=297truemm, width=210truemm}{crop}

\DeclareOption{print}{% s5 format
  \PassOptionsToPackage{noaxes, width=165mm, height=242mm}{crop}%
  \ExecuteOptions{noCrop}%
}

\DeclareOption{pdfRelease}{% Release in pdf format without copyright notice
  \PassOptionsToPackage{a4, center}{crop}%
  \ExecuteOptions{noCrop}%
  \renewcommand*{\useHyperRef}{%
    \liuthesis@hyperreftrue%
    \usepackage[ps2pdf, hyperindex, bookmarks]{hyperref}[2000/09/29]}
}

\DeclareOption{ePress}{% s5 centered on a4
  \AtEndDocument{\cleardoublepage\makeCopyright}%
  \ExecuteOptions{pdfRelease}%
}

\DeclareOption{draft}{% s5 centered on a4 DRAFT
  \PassOptionsToPackage{a4, center}{crop}
  \ClassInfo{liuthesis}{This is a DRAFT mode and should hence NOT be
    used for other purposes. Pictures are blank and overful hboxes
    stand out.}
}

\AtEndOfClass{%
  \setlength{\marginparwidth}{\oddsidemargin}%
  \addtolength{\marginparwidth}{-\marginparsep}%
  \addtolength{\marginparwidth}{-\p@}%
}

\DeclareOption*{\InputIfFileExists{\CurrentOption.ltd}
  {}{\PassOptionsToClass{\CurrentOption}{book}\OptionNotUsed}}
\ProcessOptions\relax

\LoadClass[twoside]{book}

\DeclareRobustCommand\em%
        {\@nomath\em \ifdim \fontdimen\@ne\font >\z@
                       \upshape \else \slshape \fi}

\RequirePackage{graphicx}
\RequirePackage[%
  twoside, papersize={165mm,242mm}, body={125mm,195mm},%
  bindingoffset=8mm, marginparsep=3mm, portrait,%
  twocolumn=false, vmarginratio={4:5}, verbose]{geometry}% [2002/07/08]

% \RequirePackage[nodriver]{crop}[2001/11/16]
\RequirePackage{crop}%[2001/11/16]
\RequirePackage[intlimits]{amsmath}
\RequirePackage{amsfonts, amssymb}

\cropdef[\@info]{\@ul}{\@ur}{\@ll}{\@lr}{liuthesiscrop}
\crop[liuthesiscrop,font=\mdseries\upshape\scriptsize]

\newcommand*{\ifLanguageInUse}[1]{%
  \expandafter\ifx\csname l@#1\endcsname\relax
  \expandafter\@secondoftwo
  \else
  \bbl@afterfi{\ifnum\csname l@#1\endcsname=\language
    \expandafter\@firstoftwo
    \else
    \expandafter\@secondoftwo
    \fi}%
  \fi}


%%%%%%%%%%%%%%%%%%%%%%%%
%%        Info        %%
%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand*{\author}[1]{\renewcommand*{\@author}{#1}%
  \ifliuthesis@hyperref\hypersetup{pdfauthor={#1}}\fi}%

\newcommand*{\thesis@day}{%
  \@latex@warning@no@line{No \noexpand\thesisDate given}}%
\newcommand*{\thesisDate}[3]{%
  \newcommand*{\thesis@month}{#1}%
  \renewcommand*{\thesis@day}{#2}%
  \newcommand*{\thesis@year}{#3}%
}

\newcommand*{\thesis@division}{%
  \@latex@warning@no@line{No \noexpand\thesisDivision given}}%
\newcommand*{\thesisDivision}[1]{\renewcommand*{\thesis@division}{#1}}%

\newcommand*{\thesis@departement}{%
  \@latex@warning@no@line{No \noexpand\thesisDepartement given}}%
\newcommand*{\thesisDepartement}[1]{\renewcommand*{\thesis@departement}{#1}}%

\newcommand{\departement}{%
  \ifx\thesis@departement\@IFM
  Department of Physics, Chemistry, and Biology (IFM)
  \fi
  \ifx\thesis@departement\@IEI
  Departement of Management and Engineering (IEI)
  \fi}%

\newcommand*{\@address}{Link{\"o}ping University, SE-581~83 Link{\"o}ping, Sweden}

\newcommand*{\thesis@subject}{%
  \@latex@warning@no@line{No \noexpand\subject given}}%
\newcommand*{\subject}[1]{\renewcommand*{\thesis@subject}{#1}%
  \ifliuthesis@hyperref\hypersetup{pdfsubject={#1}}\fi}%

\newcommand*{\thesis@category}{%
  \@latex@warning@no@line{No \noexpand\thesisCategory given}}%
\newcommand*{\thesisCategory}[1]{\renewcommand*{\thesis@category}{#1}}%

\newcommand*{\thesis@series}{%
  \@latex@warning@no@line{No \noexpand\series given}}%
\newcommand*{\series}[1]{\renewcommand*{\thesis@series}{#1}}%

\newcommand*{\thesis@ISBN}{%
  \@latex@warning@no@line{No \noexpand\ISBN given}}%
\newcommand*{\ISBN}[1]{\renewcommand*{\thesis@ISBN}{#1}}%

\newcommand*{\thesis@ISRN}{%
  \@latex@warning@no@line{No \noexpand\ISRN given}}%
\newcommand*{\ISRN}[1]{\renewcommand*{\thesis@ISRN}{#1}}%

\newcommand*{\thesis@ISSN}{%
  \@latex@warning@no@line{No \noexpand\ISSN given}}%
\newcommand*{\ISSN}[1]{\renewcommand*{\thesis@ISSN}{#1}}%

\newcommand*{\thesis@frontpageImage}{}
\newcommand*{\frontpageImage}[1]{\renewcommand*{\thesis@frontpageImage}{#1}}%

\newcommand*{\thesis@printshop}{}%
\newcommand*{\printshop}[1]{\renewcommand*{\thesis@printshop}{#1}}%

\newcommand*{\thesis@dedication}{%
  \@latex@warning@no@line{No \noexpand\dedication given}}%
\newcommand*{\dedication}[1]{%
  \renewcommand*{\thesis@dedication}{#1}
  \def\@ded{ded}}%

\renewcommand*{\title}[2]{\newcommand*{\swe@title}{#1}%
  \renewcommand*{\@title}{#2}%
  \ifliuthesis@hyperref%
  \ifLanguageInUse{swedish}{\hypersetup{pdftitle={#1}}}%
  {\hypersetup{pdftitle={#2}}}\fi}%

\newcommand*{\URL@b}{\@latex@warning@no@line{No \noexpand\URL given}}%
\newcommand*{\URL@a}{}%
\newcommand*{\URL}[2][]{\renewcommand*{\URL@a}{#1}\renewcommand*{\URL@b}{#2}}%
\newcommand*{\keywords}[1]{\newcommand*{\@keywords}{#1}%
  \ifliuthesis@hyperref\hypersetup{pdfkeywords={#1}}\fi}%

\newcommand{\@abstract}{\@latex@warning@no@line{No \noexpand\abstract given}}%
\newcommand{\abstract}[2]{%
  \renewcommand{\@abstract}{\ignorespacesafterend\noindent #1\unskip}%
  \newcommand{\swe@abstract}{\ignorespacesafterend\noindent #2\unskip}}%

\newcommand{\@acknowledgements}{%
  \@latex@warning@no@line{No \noexpand\acknowledgements given}}%
\newcommand{\acknowledgements}[1]{%
  \renewcommand{\@acknowledgements}{\ignorespacesafterend\noindent#1\unskip}}%

\newcommand*{\@supervisor}{\@latex@warning@no@line{No \noexpand\supervisor given}}%
\newcommand*{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}%

\newcommand*{\@examiner}{\@latex@warning@no@line{No \noexpand\examiner given}}%
\newcommand*{\examiner}[1]{\renewcommand{\@examiner}{#1}}
% \newcommand*{\AND}{\\\>\bfseries}%
\newcommand*{\AT}{\\\>\>\small}%

\newcommand*{\@graduateschool}{\@latex@warning@no@line{No \noexpand\graduateschool given}}%
\newcommand*{\graduateschool}[1]{\renewcommand{\@graduateschool}{#1}
\def\@gradschool{gradschool}}%

\newcommand{\@preface}{%
  \@latex@warning@no@line{No \noexpand\preface given}}%
\newcommand{\preface}[1]{%
  \renewcommand{\@preface}{\ignorespacesafterend\noindent#1\unskip}}%

%%%%%%%%%%%%%%%%%%%%%%%%
%%    Library page    %%
%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makeLibraryPage}{%
  \clearpage \thispagestyle{empty}%
  \enlargethispage*{27mm} {\centering%
  \vspace*{-11mm}
  \hspace*{3mm}%
  \makebox[\z@][l]{%
    \begin{minipage}[t][212mm]{126mm}%
      \scriptsize \setlength{\unitlength}{1mm}%
      \fontsize{7}{8\p@} \selectfont%
      \begin{picture}(126,212)(0,0)%
        %% Department and division
        \put(0,190){\makebox[\z@][l]{\framebox(92,22){}}}%
        \put(1,191){\includegraphics[width=20mm]{LIU_sigill_sv}}%
        \put(25,209){\parbox[t]{5cm}{\textbf{Avdelning, Institution}\\%
            Division, Department}}%
        \put(25,201){\parbox[t]{66mm}{\thesis@division\\\@address}}%
        %% Date
        \put(93,190){\makebox[\z@][l]{\framebox(33,22){}}}%
        \put(94,209){\parbox[t]{5cm}{\textbf{Datum}\\%
            Date}}%      % Must be Swedish style
        \put(94,201){\thesis@year-%
          \ifnum\thesis@month<10 0\fi\thesis@month-%
          \ifnum\thesis@day<10 0\fi\thesis@day}%
        %% Language
        \put(0,157){\makebox[\z@][t]{\framebox(30,32){}}}%
        \put(1,186){\parbox[t]{3cm}{\textbf{Språk}\\Language}}%
        \put(1,178){$\Box$ Svenska/Swedish}%
        \put(1,174){$\Box$ Engelska/English}%
        \put(1,162){$\Box$} \put(5,162){\line(1,0){20}}%
        \ifLanguageInUse{swedish}{\put(1,178){$\boxtimes$}}{%
          \ifLanguageInUse{english}{\put(1,174){$\boxtimes$}}{}}%
        %% Report category (filled in later, see thesis specific
        %% information)
        \put(31,157){\makebox[\z@][t]{\framebox(30,32){}}}%
        \put(32,186){\parbox[t]{5cm}{\textbf{Rapporttyp}\\Report category}}%
        \put(32,178){$\Box$ Doktorsavhandling}%
        \put(32,174){$\Box$ Licentiatavhandling}%
        \put(32,170){$\Box$ Examensarbete}%
        \put(32,166){$\Box$ C-uppsats}%
        \put(32,162){$\Box$ D-uppsats}%
        \put(32,158){$\Box$} \put(35,158){\line(1,0){20}}%
        %% ISBN etc ( filled in later, see thesis specific
        %% information)
        \put(62,157){\makebox[\z@][t]{\framebox(64,32){}}}%
        \put(63,186){\textbf{ISBN}}%
        \put(63,178){\textbf{ISRN}}%
        \put(63,168){\parbox[t]{5cm}{\textbf{Serietitel och serienummer}\\%
            Title of series, numbering}}%
        \put(102,168){\textbf{ISSN}}%
        %% URL for electronic publishing (filled in later, see thesis
        %% specific information)
        \put(0,143){\makebox[\z@][t]{\framebox(126,13){}}}%
        \put(1,153){\textbf{URL f{\"o}r elektronisk version}}%
        %% Title
        \put(0,108){\makebox[\z@][t]{\framebox(126,34){}}}%
        \put(1,138){\parbox[t]{5cm}{\textbf{Titel}\\Title}}%
        \put(17,138){\parbox[t]{100mm}{\swe@title\par\smallskip\@title}}%
        \put(1,117){\parbox[t]{5cm}{\textbf{F{\"o}rfattare}\\Author}}%
        \put(17,117){\@author}%
        %% Abstract
        \put(0,12){\makebox[\z@][t]{\framebox(126,95){}}}%
        \put(1,104){\parbox[t]{5cm}{\textbf{Sammanfattning}\\Abstract}}%
        \put(17,96){\parbox[t]{100mm}{\setlength{\parindent}{1.5em}\@abstract}}%
        %% Keywords
        \put(0,0){\makebox[\z@][t]{\framebox(126,11){}}}%
        \put(1,8){\parbox[t]{5cm}{\textbf{Nyckelord}\\Keywords}}%
        \put(17,8){\parbox[t]{100mm}{\@keywords}}

        %% Licenciate thesis
        \ifx\thesis@category\@lic %thesis@category
            % Licenciate thesis
            \put(32,174){$\boxtimes$}%
            % Set ISBN, ISRN, and ISSN number
            \put(63,181){\line(1,0){62}} \put(69,182){\thesis@ISBN}%
            \put(63,172){\line(1,0){62}} \put(69,173){\thesis@ISRN}%
            \put(63,159){\line(1,0){62}} \put(69,160){\thesis@ISSN}%
        \fi

        \ifx\thesis@category\@PhD %thesis@category
            % Licenciate thesis
            \put(32,174){$\boxtimes$}%
            % Set ISBN, ISRN, and ISSN number
            \put(63,181){\line(1,0){62}} \put(69,182){\thesis@ISBN}%
            \put(63,172){\line(1,0){62}} \put(69,173){\thesis@ISRN}%
            \put(63,159){\line(1,0){62}} \put(69,160){\thesis@ISSN}%
            % Set URL for electronci publishing
            \put(4,148){%
              \sbox{\@tempboxa}{\mbox{\URL@a}}%
              \ifdim\wd\@tempboxa > \z@%
                \parbox[c]{118mm}{\href{\URL@a}{\texttt{\URL@a}}\\%
                \href{\URL@b}{\texttt{\URL@b}}}%
              \else%
                \parbox[c]{118mm}{\href{\URL@b}{\texttt{\URL@b}}}%
              \fi}%
        \fi

        %% Master's thesis
        \ifx\thesis@category\@MSc %thesis@category
            % Master's thesis
            \put(32,174){$\boxtimes$}%
            % Set URL for electronci publishing
            \put(4,148){%
              \sbox{\@tempboxa}{\mbox{\URL@a}}%
              \ifdim\wd\@tempboxa > \z@%
                \parbox[c]{118mm}{\href{\URL@a}{\texttt{\URL@a}}\\%
                \href{\URL@b}{\texttt{\URL@b}}}%
              \else%
                \parbox[c]{118mm}{\href{\URL@b}{\texttt{\URL@b}}}%
              \fi}%
            % Set ISRN number
            \put(63,181){\line(1,0){62}}\put(69,182){---}%
            \put(63,172){\line(1,0){62}} \put(69,173){\thesis@ISRN}%
            \put(63,159){\line(1,0){62}} \put(69,160){---}%
        \fi
      \end{picture}%
    \end{minipage}%
  }}%
  \clearpage%
}


%%%%%%%%%%%%%%%%%%%%%%%%
%%  Acknowledgements  %%
%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\makeAcknowledgements}{%
  \clearpage%
  \chapter*{\acknowledgementsname}%
  \@acknowledgements%
  \clearpage%
}


%%%%%%%%%%%%%%%%%%%%%%%%
%%      Abstract      %%
%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\lt@twoAbstractPages}{}
\newcommand{\twoAbstractPage}{%
  \renewcommand{\lt@twoAbstractPages}{\cleardoublepage}}
\newcommand*{\makeAbstract}{%
  \clearpage \thispagestyle{plain}%
%  \vspace*{-3\baselineskip}%
  \@makeschapterhead{Abstract}  % MIGHT CHANGE!!!
  %\vspace*{-3.4\baselineskip}%
  \@abstract%
  \cleardoublepage
  \vfill \sbox{\@tempboxa}{\mbox{\swe@abstract}}%
  \ifdim\wd\@tempboxa > \z@%
    \lt@twoAbstractPages
    \thispagestyle{plain}
%    \vspace*{-3\baselineskip}%
    \@makeschapterhead{Popul{\"a}rvetenskaplig sammanfattning} %MIGHT CHANGE!!!
    %%%\@makeschapterhead{Sammanfattning} %MIGHT CHANGE!!!
%    \vspace*{-1.5\baselineskip}%
    \frenchspacing \swe@abstract \nonfrenchspacing%
  \fi%
  \vfill \clearpage%
}

%%%%%%%%%%%%%%%%%%%%%%%%
%%  Preface           %%
%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\makePreface}{%
  \clearpage%
  \chapter*{\prefacename}%
  \@preface%
  \clearpage%
}

%%%%%%%%%%%%%%%%%%%%%%%%
%%  Copyright notice  %%
%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\makeCopyright}{\begingroup%
  \clearpage \thispagestyle{empty}%
  %
  \vspace*{-22mm}%
  \noindent%
  \parbox{54mm}{\flushleft%
    \includegraphics[height=10mm]{epresslogo}}%
  \hfill%
  \parbox{54mm}{\flushright%
    \includegraphics[height=10mm]{LIU_sigill_sv}}%
  %
  \vspace{3\baselineskip} \frenchspacing%
  \par\noindent{\fontsize{12pt}{14pt}\selectfont%
    \normalfont\large\bfseries På svenska}\\[1.5ex]
  \fontsize{10pt}{12pt}\selectfont
  Detta dokument hålls tillgängligt på Internet --- eller dess
  framtida ersätt\-are --- under en längre tid från publiceringsdatum
  under förut\-sättning att inga extra-ordinära omständigheter uppstår.
  \par
  Tillgång till dokumentet innebär tillstånd för var och en att läsa,
  ladda ner, skriva ut enstaka kopior för enskilt bruk och att använda
  det oförändrat för icke\-kommersiell forskning och för undervisning.
  Över\-föring av upphovsrätten vid en senare tidpunkt kan inte
  upphäva detta tillstånd. All annan användning av dokumentet kräver
  upphovsmannens medgivande. För att garantera äktheten, säkerheten
  och tillgänglig\-heten finns det lösningar av teknisk och
  administrativ art.
  \par
  Upphovsmannens ideella rätt innefattar rätt att bli nämnd som
  upphovsman i den omfattning som god sed kräver vid användning av
  dokumentet på ovan beskrivna sätt samt skydd mot att dokumentet
  ändras eller presenteras i sådan form eller i sådant sammanhang som
  är kränkande för upphovsmannens litterära eller konstnärliga
  anseende eller egenart.
  \par
  För ytterligare information om
  \emph{Linköping University Electronic Press} se för\-lagets hemsida
  \href{http://www.ep.liu.se/}{\texttt{http://www.ep.liu.se/}}
  \nonfrenchspacing
  %
  \vspace*{4\baselineskip}
  \par\noindent{\fontsize{12pt}{14pt}\selectfont%
    \normalfont\large\bfseries In English}\\[1.5ex]
  \fontsize{10pt}{12pt}\selectfont
  The publishers will keep this document online on the Internet --- or
  its possible replacement --- for a considerable time from the date of
  publication barring exceptional circumstances.
  \par
  The online availability of the document implies a permanent permission
  for anyone to read, to download, to print out single copies for your
  own use and to use it unchanged for any non-commercial research and
  educational purpose. Subsequent transfers of copyright cannot revoke
  this permission. All other uses of the document are conditional on the
  consent of the copyright owner. The publisher has taken technical and
  administrative measures to assure authenticity, security and
  accessibility.
  \par
  According to intellectual property law the author has the right to
  be mentioned when his/her work is accessed as described above and to
  be protected against infringement.
  \par
  For additional information about the \emph{Linköping University
    Electronic Press} and its procedures for publication and for
  assurance of document integrity, please refer to its WWW home page:
  \href{http://www.ep.liu.se/}{\texttt{http://www.ep.liu.se/}}
  \par
  {\vspace*{\baselineskip} \flushright \copyright\ \@author
  \clearpage} \endgroup
}


%%%%%%%%%%%%%%%%%%
%%  Dedication  %%
%%%%%%%%%%%%%%%%%%

\newcommand*{\makeDedication}{%
  \clearpage%
  \thispagestyle{empty}%
   \vspace*{\stretch{1}}%
   {\flushright \thesis@dedication\par}%
   \vspace*{\stretch{2}}%
  \clearpage%
}


%%%%%%%%%%%%%%%%%%%%
%% Loose Abstract %%
%%%%%%%%%%%%%%%%%%%%

\newcommand*{\makeLooseAbstract}[1]{%
  \cleardoublepage \thispagestyle{empty}%
  {{\centering%
  {\small \thesis@series\\[3mm]}%
  {\parbox{\textwidth}{\centering\Large\bfseries\@title}\\[4mm]}%
  {\Large \@author\\[4mm]}%
  {\normalsize \textbf{Akademisk avhandling}\\[.4\baselineskip]}}
  {\small\noindent\parbox{\textwidth}{#1}\\[3mm]}
  {\centering \normalsize \textbf{Abstract}\\[.4\baselineskip]}
  \small
  \@abstract%
  \vfill%
  \footnotesize
  \vspace{2.5mm}
   \parbox{\textwidth}{{\centering%
      {\@address\\[\baselineskip]%
        Link{\"o}ping \thesis@year}\\[\baselineskip]}%
    {ISBN \thesis@ISBN \hfill ISSN \thesis@ISSN}}}%
  \thispagestyle{empty}\clearpage\thispagestyle{empty}}


%%%%%%%%%%%%%%%%%%%%%%%%
%%    Environments    %%
%%%%%%%%%%%%%%%%%%%%%%%%

\theorembodyfont{\normalfont\slshape}
\newtheorem{theorem}{\theoremname}[chapter]
\newtheorem{lemma}{\lemmaname}[chapter]
\newtheorem{definition}{\definitionname}[chapter]
\newtheorem{corollary}{\corollaryname}[chapter]

%%% Proof%%%
\newenvironment{proof}[1][]{
    \sbox{\@tempboxa}{\mbox{#1}}%
    \par\noindent%
    \ifdim\wd\@tempboxa > \z@%
      \textbf{\proofname~(#1)}%
    \else%
      \textbf{\proofname}%
    \fi%
    \begingroup\small%
  }
  {
    \endgroup%
    \hspace*{\stretch{ 1}}$\Box$\par\bigskip%
    \ignorespacesafterend%
}

%%% Example %%%
\DeclareRobustCommand*{\listofexamples}{%
  \section*{\listexamplename}%
  \@starttoc{xmp}%
}
\newcommand*{\l@example}{\l@figure}%
\newcounter{Example}[chapter]%
\renewcommand*{\theExample}{\thechapter.\arabic{Example}}%
\newenvironment{example}[1][]{%
  \refstepcounter{Example}%
  \sbox{\@tempboxa}{\ignorespaces#1\unskip}%
  \ifdim \wd\@tempboxa>\z@%
    \sbox{\@tempboxa}{\textbf{%
        \thinspace\ignorespaces\examplename\unskip~\theExample:~#1\thinspace}}%
  \else%
    \sbox{\@tempboxa}{\textbf{\thinspace\examplename~\theExample\thinspace}}%
  \fi%
  \addcontentsline{xmp}{example}{\protect\numberline{\theExample}#1}
  \setlength{\@tempskipa}{\textwidth}%
  \addtolength{\@tempskipa}{-\wd\@tempboxa}
  \addtolength{\@tempskipa}{-1em}%
  \strut\\[.5\baselineskip]%
  \hspace*{-\p@}\hspace*{-.5em}%
  \rule[\p@]{\p@}{1ex}\rule[1ex]{2em}{\p@}%
  \raisebox{.5ex}{\box\@tempboxa}%
  \rule[1ex]{\@tempskipa}{\p@}\rule[\p@]{\p@}{1ex}%
  \hspace*{-\p@}\hspace*{-.5em}%
  \newline\begingroup\ignorespaces%
  \ignorespacesafterend%
}
{%
  \unskip\endgroup\strut\newline%
  \hspace*{-\p@}\hspace*{-.5em}%
  \rule{1\p@}{1ex}\rule{\textwidth}{\p@}\rule{1em}{\p@}\rule{\p@}{1ex}%
  \hspace*{-\p@}\hspace*{-.5em}\\[.5\baselineskip]%
  \ignorespacesafterend%
}

%% To include papers
\newcounter{Paper}
\newcommand\papername{Paper}
\gdef\@paperapp{\papername}%
\gdef\thePaper{\@Roman\c@Paper}%

\newcommand\papers{%
  \setcounter{Paper}{0}%
}

\newcounter{PaperThumbOffset}
\newcounter{PaperThumbIndexOffset}
\setcounter{PaperThumbOffset}{-67}
\setcounter{PaperThumbIndexOffset}{-34}

\newcommand{\ps@paperhead}{%
  \renewcommand{\@oddhead}{\hfil%
    \begin{picture}(0,0)%
      \put(19,\value{PaperThumbOffset}){\color[rgb]{.5,.5,.5}{\rule{1.8cm}{2.75cm}}}%
      \put(19,\value{PaperThumbIndexOffset}){\makebox[1.5cm]{\LARGE\bf\color{white}{\thePaper}}}%
    \end{picture}}%
  \renewcommand{\@evenhead}{}%
  \renewcommand{\@oddfoot}{}%
  \renewcommand{\@evenfoot}{}}

\newcommand{\paper}[3]
  {\cleardoublepage
   \refstepcounter{Paper}%
   \addcontentsline{toc}{chapter}%
                   {\papername\space\thePaper}%
   \markboth{\papername\space\thePaper}{\papername\space\thePaper}
   \chapter*{\@paperapp\space\thePaper}
   \thispagestyle{paperhead}
   {\centering\Large \bfseries #1\par\nobreak}
   \vspace*{2\baselineskip}%
   {\flushright \large #2\par}
   \vspace*{2\baselineskip}%
   {\flushleft #3\par}
   \clearpage
   \thispagestyle{empty}
   \cleardoublepage
   \addtocounter{PaperThumbOffset}{-78}
   \addtocounter{PaperThumbIndexOffset}{-78}
   \ifnum\c@PaperThumbOffset<-650
     \setcounter{PaperThumbOffset}{-67}
     \setcounter{PaperThumbIndexOffset}{-31}
   \fi
}

\newenvironment{thelistofpublications}[1]
     {\chapter*{List of included Publications}%
       \phantomsection\addcontentsline{toc}{chapter}%
                       {List of included Publications}%
      \markboth{List of included Publications}{List of included Publications}%
      \list{\@biblabel{\@Roman\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \vspace{-20 mm}
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@Roman\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty40000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

%%%Bjorns addition
\newenvironment{secondlistofpublications}[1]
     {\chapter*{Related, not included Publications}%
       \phantomsection\addcontentsline{toc}{chapter}%
                       {Related, not included Publications}%
      \markboth{Related, not included Publications}{Related, not included Publications}%
      %\list{\@biblabel{\@Roman\c@enumiv}}%
      \list
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \vspace{-20 mm}
            \advance\leftmargin\labelsep
            \@openbib@code
          \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@Roman\c@enumiv}} %
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty40000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


%%%END of Bjorns addition

%%%%%%%%%%%%%%%%%%%%%%%%
%%      Headings      %%
%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareRobustCommand*{\chaptermark}[1]{\markboth{#1}{}}
\DeclareRobustCommand*{\sectionmark}[1]{\markright{\thesection~#1}{}}
\renewcommand*{\ps@headings}{%
  \renewcommand*{\@oddfoot}{}%
  \renewcommand*{\@evenfoot}{}%
  \renewcommand*{\@evenhead}{%
    \parbox{\textwidth}{\bfseries \thepage\hfill\ \ \leftmark%
      \vspace*{2\p@}\hrule}}%
  \renewcommand*{\@oddhead}{%
    \parbox{\textwidth}{\bfseries\rightmark\hfill\ \ \thepage%
      \vspace*{2\p@}\hrule}
}}


%%%%%%%%%%%%%%%%%%%%%%%%
%%    Bibliography    %%
%%%%%%%%%%%%%%%%%%%%%%%%

\renewenvironment{thebibliography}[1]{%
  \chapter*{\bibname}%
  \phantomsection\addcontentsline{toc}{chapter}{\bibname}%
  \markboth{\bibname}{\bibname}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\settowidth{\labelwidth}{\@biblabel{#1}}%
            \setlength{\leftmargin}{\labelwidth}%
            \addtolength{\leftmargin}{\labelsep}%
            \@openbib@code%
            \usecounter{enumiv}%
            \let\p@enumiv\@empty%
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy%
      \clubpenalty4000%
      \@clubpenalty \clubpenalty%
      \widowpenalty4000%
      \sfcode`\.\@m}%
{\def\@noitemerr%
  {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist}%


%%%%%%%%%%%%%%%%%%%%%%%%
%%       Index        %%
%%%%%%%%%%%%%%%%%%%%%%%%

\renewenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \phantomsection\addcontentsline{toc}{chapter}{\indexname}%
                \markboth{\indexname}{\indexname}%
                \thispagestyle{plain}\setlength{\parindent}{\z@}%
                \setlength{\parskip}{\z@ \@plus .3\p@}%
                \let\item\@idxitem}%
               {\if@restonecol\onecolumn\else\clearpage\fi}


%%%%%%%%%%%%%%%%%%%%%%%%
%%     Sectioning     %%
%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\frontmatter}{%
  \thispagestyle{empty}%
  \cleardoublepage%
  \@mainmatterfalse%
  \pagenumbering{roman}}

\renewcommand{\mainmatter}{%
  \cleardoublepage%
  \pagestyle{headings}
  \@mainmattertrue%
  \pagenumbering{arabic}}

\renewcommand*{\backmatter}{%
  \if@openright%
    \cleardoublepage%
  \else%
    \clearpage%
  \fi%
  \@openrightfalse}

\newcommand{\makeFrontMatter}[1][]{%
\ifx\thesis@category\@MSc %thesis@category
    \makeMScFrontPage \thispagestyle{empty} \cleardoublepage%
    \frontmatter \makeMScTitlePage \thispagestyle{empty} \cleardoublepage%
    \makeLibraryPage \thispagestyle{empty} \cleardoublepage%
    \ifx\@ded\undefined
    \else
      \makeDedication \thispagestyle{empty} \cleardoublepage%
    \fi
    \pagestyle{headings} \makeAbstract \thispagestyle{empty} \cleardoublepage%
    \makeAcknowledgements \thispagestyle{empty} \cleardoublepage%
    \tableofcontents%
    #1 \mainmatter%
\fi
\ifx\thesis@category\@lic %thesis@category
    \def\acknowledgementsname{Acknowledgements}%
    %\makeLicFrontPage \thispagestyle{empty} \cleardoublepage%
    \frontmatter \makeLicTitlePage \thispagestyle{empty} \cleardoublepage%
    \ifx\@ded\undefined
    \else
      \makeDedication \thispagestyle{empty} \cleardoublepage%
    \fi
    \pagestyle{headings} \makeAbstract \thispagestyle{empty} \cleardoublepage%
    \makeAcknowledgements \thispagestyle{empty} \cleardoublepage%
    \tableofcontents%
    #1 \mainmatter%
\fi
\ifx\thesis@category\@PhD %thesis@category
    \def\acknowledgementsname{Acknowledgements}%
    \frontmatter \makePhDTitlePage \thispagestyle{empty} \cleardoublepage%
    \ifx\@ded\undefined
    \else
      \makeDedication \thispagestyle{empty} \cleardoublepage%
    \fi
    \pagestyle{headings}
\makeAbstract
\thispagestyle{empty} \cleardoublepage%
    \ifx\@preface\undefined
    \else
      \makePreface \thispagestyle{empty} \cleardoublepage%
    \fi
\thispagestyle{empty} \cleardoublepage%
    \makeAcknowledgements \thispagestyle{empty} \cleardoublepage%
    \tableofcontents%
    #1 \mainmatter%
\fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%       Graduate school        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\printGraduateschool}{%
  \ifx\@gradschool\undefined
  \else
  \parbox{\textwidth}{
  During the course of research underlying this thesis, \@author\,
  was enrolled in \@graduateschool, a multidiciplinary doctoral program at Linköping University, Sweden.
  }
  \fi
}
%%%%%%%%%%%%%%%%%%%%%%%%
%%       Other        %%
%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareRobustCommand*{\tableofcontents}{%
  \chapter*{\contentsname\markboth{\contentsname}{\contentsname}}%
  \@starttoc{toc}%
}
\DeclareRobustCommand*{\listoffigures}{%
  \section*{\listfigurename}%
  \@starttoc{lof}%
}
\DeclareRobustCommand*{\listoftables}{%
  \section*{\listtablename}%
  \@starttoc{lot}%
}

\renewcommand{\@makecaption}[2]{%
  \vspace{\abovecaptionskip}
  \begin{small}
    \sbox{\@tempboxa}{\textbf{#1.} #2}
    \ifdim \wd\@tempboxa > \hsize
      \textbf{#1.} #2\par
    \else
      \global \@minipagefalse
      \parbox{\hsize}{\centering \usebox{\@tempboxa}\hfil}
    \fi
  \end{small}
  \vspace{\belowcaptionskip}
}


\renewcommand{\footnoterule}{\vspace*{-3\p@}
  \noindent\rule{.5\textwidth}{.5\p@}\vspace*{2.6\p@}
}

%%%%%%%%%
%% MSC %%
%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%
%%     Front page     %%
%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makeMScFrontPage}{%
  \begingroup\normalfont%
  \clearpage%
  %
  \thispagestyle{empty}%
  \vspace*{-15mm}\hspace*{-24.5mm}%
  \raisebox{\z@}[\z@][\z@]{%
    \begin{minipage}[t][230mm]{161.5mm}%
      \centering%
      \ifLanguageInUse{swedish}{%
        {\LARGE Institutionen för Fysik, Kemi och Biologi}\\[\stretch{2 }]%
        {\Large Examensarbete}\\%
        \vspace*{\stretch{3 }}%
        {\parbox{13cm}{\centering\Large\bfseries\swe@title}}\\[\stretch{3 }]%
        {\Large \@author}\\[\baselineskip]%
        \thesis@ISRN\\[.5\baselineskip]%
        \vspace*{\stretch{2 }}%
        \parbox[b][115mm]{145mm}{\centering%
          \parbox{138mm}{\centering%
              \vspace*{15mm}\strut\\%
              \includegraphics[scale=0.8]{template_figures/lith-sv-black}\\%
              \vspace*{15mm}%
          }\\[.5\baselineskip]%
        Institutionen för fysik och mätteknik\\%
        Linköpings universitet\\%
        581~83 Linköping%
        }\medskip}{%
        {\LARGE Department of Physics, Chemistry and Biology}\\[\stretch{2 }]%
        {\Large Master's Thesis}\\%
        \vspace*{\stretch{3 }}%
        {\parbox{13cm}{\centering\Large\bfseries\@title}}\\[\stretch{3 }]%
        {\Large \@author}\\[\baselineskip]%
        \thesis@ISRN\\[.5\baselineskip]%
        \vspace*{\stretch{2 }}%
        \parbox[b][115mm]{145mm}{\centering%
          \parbox{138mm}{\centering%
            \vspace*{15mm}\strut\\%
            \includegraphics[scale=0.8]{template_figures/lith-en-black}\\%
            \vspace*{15mm}%
          }\\[.5\baselineskip]%
        \@address\\[\baselineskip]%
      }\medskip}%
    \end{minipage}%
  }%
  \endgroup \clearpage%
}

%%%%%%%%%%%%%%%%%%%%%%%%
%%     Title page     %%
%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\makeMScTitlePage}{%
  \clearpage \thispagestyle{empty} \normalfont%
  \vspace*{-25mm}\hspace*{-27.8mm}\hspace*{3mm}%
  \raisebox{\z@}[\z@][\z@]{%
    \begin{minipage}[t][230mm]{158.5mm}%
      \centering \vspace*{\stretch{1 }}%
      \ifLanguageInUse{swedish}{Examensarbete}{Master's Thesis}\\%
      \thesis@ISRN\\[.5\baselineskip]%
%      {\large \thesis@subject}\\[1.5\baselineskip]%
      \vspace*{\stretch{1 }}%
      {\parbox{13cm}{\centering\noindent\Large\bfseries%
          \ifLanguageInUse{swedish}{\swe@title}{\@title}}}\\%
      \vspace*{\stretch{1 }}%
      {\large \@author}\\[\baselineskip]%
      \vspace*{\stretch{4 }}%
      \parbox{10cm}{\raggedright%
        \rule{10cm}{\z@}%
        \begin{tabbing}%
          \hspace*{25mm}\=\quad\=\kill%
          \ifLanguageInUse{swedish}{Handledare:}{Adviser:}\>\bfseries
          \@supervisor\\[.5\baselineskip]%
          \ifLanguageInUse{swedish}{Examinator:}{Examiner:}\>\bfseries \@examiner%
        \end{tabbing}%
      }\\[.5\baselineskip]%
      Linköping, \thesis@day\ \monthName{\thesis@month}, \thesis@year%
    \end{minipage}%
  } \clearpage%
}


%%%%%%%%%
%% Lic %%
%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%
%%     Front page     %%
%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makeLicFrontPage}{%
  \begingroup\normalfont%
  \clearpage%
  %
  \thispagestyle{empty}%
  \vspace*{-15mm}\hspace*{-24.5mm}%
  \raisebox{\z@}[\z@][\z@]{%
    \begin{minipage}[t][220mm]{161.5mm}%
      \centering%
        {\large \thesis@series}\\%
        \vspace*{\stretch{1 }}%
        {\parbox{13cm}{\centering\Large\bfseries\@title}}\\[\stretch{1 }]%
        {\Large \@author}\\%
        \vspace*{\stretch{1 }}%
        \parbox[b][115mm]{145mm}{\centering%
          \parbox{138mm}{\centering%
            \vspace*{40mm}\strut\\%
            \includegraphics[scale=0.75]{template_figures/LiU_primary_black}\\%
            \vspace*{15mm}%
          }\\[.5\baselineskip]%
        \thesis@division\\%[.2\baselineskip]%
        \departement\\%
       % \thesis@ISRN\\[.2\baselineskip]% Is not used anymore
        \@address\\[\baselineskip]%
        Link{\"o}ping \thesis@year%
      }\medskip%
    \end{minipage}%
  }%
  \endgroup \clearpage%
}

%%%%%%%%%%%%%%%%%%%%%%%%
%%     Title page     %%
%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\makeLicTitlePage}{%
  \makeLicFrontPage%
  \vspace*{\stretch{0.5 }}%
  {\noindent\parbox{\textwidth}{\thesis@frontpageImage}}%
  \\[2\baselineskip]
  \printGraduateschool%
  \vfill
  \noindent\parbox{\textwidth}{%
    \copyright ~\@author\\%
    ISBN \thesis@ISBN\\%
    ISSN \thesis@ISSN\\[\baselineskip]%
    \thesis@printshop}%
}


%%%%%%%%%
%% PhD %%
%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%
%%     Title page     %%
%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makePhDTitlePage}{%
  \begingroup\normalfont%
  \clearpage%
  %
  \thispagestyle{empty}%
  \vspace*{-15mm}\hspace*{-24.5mm}%
  \raisebox{\z@}[\z@][\z@]{%
    \begin{minipage}[t][220mm]{161.5mm}%
      \centering%
        {\large \thesis@series}\\%
        \vspace*{\stretch{1 }}%
        {\parbox{13cm}{\centering\LARGE\bfseries\@title}}\\[\stretch{1 }]%
        {\Large \@author}\\%
        \vspace*{\stretch{1 }}%
        \parbox[b][115mm]{145mm}{\centering%
          \parbox{138mm}{\centering%
            \vspace*{40mm}\strut\\%
            \includegraphics[scale=0.75]{template_figures/LiU_primary_black}\\%
            \vspace*{15mm}%
          }\\[.5\baselineskip]%
          \vfill
          \thesis@division\\
          \departement\\
        \@address\\[\baselineskip]%
        Link{\"o}ping \thesis@year%
      }\medskip%
    \end{minipage}%
  }%
  \endgroup \clearpage%
  \vspace*{\stretch{0.5 }}%
  {\noindent\parbox{\textwidth}{\thesis@frontpageImage}}%
  \\[2\baselineskip]
  \printGraduateschool%
  \vfill
  \noindent\parbox{\textwidth}{%
    \copyright ~\@author\\%
    ISBN \thesis@ISBN\\%
    ISSN \thesis@ISSN\\[\baselineskip]%
    \thesis@printshop}%
}

%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\endinput
%%
%% End of file `liuthesis.cls'.

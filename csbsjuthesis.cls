%%
%% This is file `csbsjuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% csbsjuthesis.dtx  (with options: `thesis')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2019 by Neil Lindquist <nslindquist@csbsju.edu>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the MIT License.  See LICENSE.txt for full license text.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csbsjuthesis}
    [2019/02/09 v1.0.0 CSB/SJU Thesis]
\LoadClass{article}
\RequirePackage{algorithm}
\newcommand{\@honors}{}
\newif\if@sigpage
\@sigpagetrue
\DeclareOption{honors}{\renewcommand{\@honors}{\vspace{2cm}\Large{%
In Partial Fulfillment of the Requirements for All College Honors}}}
\DeclareOption{nosignatures}{\@sigpagefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\RequirePackage{etoolbox}
\patchcmd{\thebibliography}{\section*}{\section}{}{}
\bibliographystyle{plain}
\newcommand{\@advisors}{}
\newcommand{\advisor}[2]{\g@addto@macro{\@advisors}{%
  \vspace{1.5cm}
  \hrulefill \\
  \large{#1}\\
  \small{#2}\\
}}
\newcommand{\@readers}{}
\newcommand{\reader}[2]{\g@addto@macro{\@readers}{%
  \vspace{1.5cm}
  \hrulefill \\
  \large{#1}\\
  \small{#2}\\
}}
\newcommand{\@chairs}{}
\newcommand{\deptchair}[2]{\g@addto@macro{\@chairs}{%
  \vspace{1.5cm}
  \hrulefill \\
  \large{#1}\\
  \small{Chair, Department of #2}\\
}}
\newbox\@abstractbox
\renewenvironment{abstract}{%
  \global\setbox\@abstractbox=\vbox\bgroup
  {\centering\noindent\unskip\textbf{\abstractname}\par}
  \medskip\unskip\ignorespaces}
{\egroup}
\newenvironment{frontpage}{%
\pagenumbering{roman}%
}{%
\clearpage
\pagenumbering{arabic}
}
\renewcommand{\maketitle}{%
\begin{center}
  \vspace*{1cm}
  \LARGE{\textbf{\@title}}

  \vspace{0.5cm}
  \Large{An All-College Thesis}

  \vspace{2cm}
  \Large{College of Saint Benedict/Saint John's University}

  \@honors

  \vspace{2cm}
  \large{by \@author}

  \large{\@date}
\end{center}
\pagenumbering{gobble}
\clearpage
\pagenumbering{roman}
\if@sigpage
  \begin{flushleft}
    \large{\textbf{Project Title:} \@title}\\
    \medskip
    Approved by:\\
    \vspace{1cm}
    \@advisors
    \@readers
    \@chairs
    \vspace{1.5cm}
    \hrulefill \\
    \small{Director, All College Thesis Program}\\
  \end{flushleft}
  \clearpage
\fi
\ifdim\wd\@abstractbox>0pt
    \vspace*{\fill}
    \box\@abstractbox
    \vspace*{\fill}
    \clearpage
\fi
\tableofcontents
\clearpage
\listofalgorithms
\listoffigures
\listoftables
\clearpage
\pagenumbering{arabic}
}
\endinput
%%
%% End of file `csbsjuthesis.cls'.

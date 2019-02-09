% csbsjuthesis.cls
%  Writing a thesis at CSB/SJU
% Created 2019 by Neil Lindquist
% Based off the theses of Adam Noack and Curtis Noecher

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csbsjuthesis}[2019/02/08 CSB/SJU Thesis]

\LoadClass{article}

\newcommand{\@honors}{}

% create signature page
\newif\if@sigpage
\@sigpagetrue

\DeclareOption{honors}{\renewcommand{\@honors}{\vspace{2cm}\Large{In Partial Fulfillment of the Requirements for All College Honors}}}
\DeclareOption{nosignatures}{\@sigpagefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Bibliography
\RequirePackage{etoolbox}
\patchcmd{\thebibliography}{\section*}{\section}{}{}
\bibliographystyle{plain}

% Advisor and Readers
\newcommand{\advisor}[2]{\def\@advisor{%
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


% Abstract
\newbox\@abstractbox
\renewenvironment{abstract}{%
  \global\setbox\@abstractbox=\vbox\bgroup
  {\centering\noindent\unskip\textbf{\abstractname}\par}
  \medskip\unskip\ignorespaces}
{\egroup}

% Initial Pages
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
%skip page number of title page
\pagenumbering{gobble}
\clearpage
\pagenumbering{roman}
\if@sigpage
	%Signature page
	\begin{flushleft}
		\large{\textbf{Project Title:} \@title}\\
		Approved by:\\
		\vspace{1cm}
		\@advisor
		\@readers
		\@chairs
		\vspace{1.5cm}
		\hrulefill \\
		\small{Director, All College Thesis Program}\\
	\end{flushleft}
	\clearpage
\fi
%Don't add empty page if abstract is missing
\ifdim\wd\@abstractbox>0pt
	\vspace*{\fill}
	\box\@abstractbox
	\vspace*{\fill}
	\clearpage
\fi
\tableofcontents
\clearpage
\pagenumbering{arabic}
}
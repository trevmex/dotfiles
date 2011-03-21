
<!-- saved from url=(0057)http://freemarker.sourceforge.net/download/editor/ftl.vim -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;">" Vim syntax file
" Language: FreeMarker Template Language (FTL)
" Maintainer: Stephan Müller &lt;stephan@chaquotay.net&gt;
" Last Change: 2008 Oct 22

syn case match

" directives and interpolations
syn region ftlStartDirective start=+&lt;#+ end=+&gt;+ contains=ftlKeyword, ftlDirective, ftlString, ftlComment
syn region ftlEndDirective start=+&lt;/#+ end=+&gt;+ contains=ftlDirective
syn region ftlStartDirectiveAlt start=+\[#+ end=+\]+ contains=ftlKeyword, ftlDirective, ftlString, ftlComment
syn region ftlEndDirectiveAlt start=+\[/#+ end=+\]+ contains=ftlDirective
syn region ftlStartUserDirective start=+&lt;@+ end=+&gt;+ contains=ftlString, ftlComment
syn region ftlEndUserDirective start=+&lt;/@+ end=+&gt;+
syn region ftlStartUserDirectiveAlt start=+\[@+ end=+\]+ contains=ftlString, ftlComment
syn region ftlEndUserDirectiveAlt start=+\[/@+ end=+\]+
syn region ftlInterpolation start=+${+ end=+}+
syn region ftlInterpolation2 start=+#{+ end=+}+
syn region ftlString contained start=+"+ end=+"+
syn region ftlComment start=+&lt;#--+ end=+--&gt;+
syn region ftlCommentAlt start=+\[#--+ end=+--\]+

" keywords
syn keyword ftlDirective contained list if else macro import include switch case break
syn keyword ftlDirective contained assign local global nested recurse fallback visit
syn keyword ftlDirective contained function return t rt lt nt ftl
syn keyword ftlKeyword contained as in using

" highlighting
highlight link ftlKeyword Statement
highlight link ftlDirective Statement
highlight link ftlStartDirective Function
highlight link ftlEndDirective Function
highlight link ftlStartUserDirective Function
highlight link ftlEndUserDirective Function
highlight link ftlInterpolation Constant
highlight link ftlInterpolation2 Constant
highlight link ftlString Constant
highlight link ftlComment Comment

</pre></body></html>
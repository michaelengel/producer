
This is a copy of the "Producer" Smalltalk-80 to Objective-C Translator
source code by Brad J. Cox and Kurt J. Schmucker

Related Paper:

Brad J. Cox and Kurt J. Schmucker
Producer: A Tool for Translating Smalltalk-80 to Objective-C
ACM SIGPLAN Notices Volume 22 Issue 12 pp 423–429, 1987
https://doi.org/10.1145/38807.38846
https://dl.acm.org/doi/pdf/10.1145/38807.38846

The sources were posted to the USENET newsgroup comp.source.misc 
on August 20th, 1987, by by Dieter H. Zebbedies (dietz@zhmti.UUCP) 

https://usenet.trashworldnews.com/?thread=639838

The original README follows...

---

                Producer: Smalltalk-80 to Objective-C Translator


                                  Brad J. Cox
                      Productivity Products International
                                  75 Glen Road
                              Sandy Hook, CT 06482
                                (203) 426 1875.


          Smalltalk-80 is a tool for  turning  raw  concepts  into  working
     software prototypes. Objective-C is a tool for turning proven concepts
     into fast, commercial-quality, production systems. Producer is a  tool
     for  bridging  the gap between prototyping and production by automati-
     cally translating Smalltalk-80 sources into Objective-C  sources.  The
     translation is guided by a rule base in which the programmer describes
     how differences between the Smalltalk-80 prototyping  environment  and
     the   Objective-C  production  environment  should  be  resolved  when
     translating the code.

          At SIGGRAPH-87, PPI will announce a  library  of  user  interface
     components  from which programmers build applications with iconic user
     interfaces.  The library and applications built using it are  portable
     across  diverse  window  systems,  initially X-Windows, SunWindows and
     Hewlett Packard's window system. While the Objective-C user  interface
     classes  are  different from Smalltalk's, they are similar enough that
     Producer can usually bridge the differences with some  hand-tuning  of
     the  translated  output.   We  confidently hope that Objective-C, this
     library and Producer will make automatic translation  of  Smalltalk-80
     prototypes  a  routine  part  of  many companies' software development
     lifecycle.

          I'm distributing Producer to enlist  your  help  in  testing  the
     practicality of this notion.



                                   Disclaimer


          Producer is not a mature software  product  but  an  embryo  that
     could  grow  to maturity someday.  Specifically it is not supported or
     warranteed in any  way.  It  was  written  by  myself,  an  individual
     employed  by PPI, and has been released prior to maturity by myself as
     an individual with the consent of the  company.   This  document  will
     make its strengths and some of its present shortcomings clear.

          However, even in its present state,  Producer  demonstrates  that
     automatic  translation  is technically feasible and its present imple-
     mentation provides a capable foundation on which to build.  Since  the
     market  for Smalltalk-80 translators is insufficient for PPI to pursue
     presently, we've released Producer for you to make what use of it  you
     can.

          I do ask that you keep me informed of your experiences  in  using
     it  in  its  current  state,  and  PPI requests that you feed back any


     Brad Cox                          1                      June 22, 1987







                Producer: Smalltalk-80 to Objective-C Translator


     improvements so that we can offer a fully supported  translation  pro-
     duct in the future. PPI retains the copyright and all other applicable
     rights. For example, you may not sell products that contain  any  part
     of the Producer distribution without PPI's permission.



                                  How it works


          The following is a brief description of how Producer works inter-
     nally.   This  was written from my recollection of how I left the code
     over a year ago. It may be inaccurate in places.

          Producer is basically a compiler. It's lexical analyzer  (written
     in  lex) divides Smalltalk-80 text into lexemes, and its parser (writ-
     ten in yacc) recognizes  valid  lexeme  sequences  and  constructs  an
     abstract  representation  of  the  program  as an expression tree. The
     expression tree consists of instances  of  Objective-C  classes;  e.g.
     Method,  Statement, Expression, Message, and Variable. The grammar was
     derived from the syntax diagrams in Goldberg and Robson; _S_m_a_l_l_t_a_l_k-_8_0:
     _T_h_e _L_a_n_g_u_a_g_e _a_n_d _i_t_s _I_m_p_l_e_m_e_n_t_a_t_i_o_n; Addison Wesley; 1986.

          The grammar was extended to also recognize rules  that  may  also
     appear  in the lexeme stream. Rules are enclosed in { braces } to help
     fend off shift-reduce conflicts from yacc. The parser stores the rules
     in separate data structures for use during code generation.

          At certain points, the parser sends the  top  of  the  expression
     tree  a  gen  message  to  trigger  code  generation[1].  Recall  that
     Smalltalk-80 is an extremely simple language with basically  two  com-
     ponents;  data  references  (variables,  literals,  etc) and messages.
     Rules may influence how each case is treated during code generation.

          Code generation proceeds in two passes. The first  pass  collects
     typing  information  for  each  symbol  and  message  by examining the
     expression tree from the bottom up. The bottom-most nodes  are  either
     literals whose type is immediately obvious (e.g. 1, 2.3, or 'string'),
     or they are symbols whose type can be known or unknown.  Symbol  types
     ____________________
9        [1] I now regard this as a major architectural flaw whenever I  see
     it in any application. It represents a key departure from an important
     but often ignored rule of object-oriented design.  The expression tree
     classes  should  be  abstract  so  that  they could be reused in other
     tools. But their code generation methods pollute the abstraction  with
     knowledge about a particular concrete interface; Objective-C. The code
     generation methods should have been provided in a  separate  hierarchy
     of  classes  that  know  how to connect the abstract classes to one of
     many potential concrete interfaces. This rule is simply a  generaliza-
     tion  of  the model/view/controller paradigm to apply to interfaces of
     any kind, not just user interfaces.



9     Brad Cox                          2                      June 22, 1987







                Producer: Smalltalk-80 to Objective-C Translator


     become known either as the  result  of  a  previous  type  inferencing
     operation  or because their type was specified in a rule. Unknown sym-
     bols default to id when first referenced.

          Most of the internal  nodes  are  messages.   Message  typing  is
     slightly more complicated because any message can have multiple trans-
     lations depending on how the message is used because  different  rules
     may  specify  different  translations for different receiver and argu-
     ments types. The diverse translations may  each  compute  a  different
     type.  Since  we  assign types bottom up, types have been assigned for
     the arguments and the receiver, so a translation for that selector  is
     chosen  by searching a table of possible translations for one matching
     the receiver and argument types.

          In all cases, unless  overridden  by  a  specific  rule,  default
     translations  are  used.  These amount to a fairly literal translation
     from Smalltalk-80 syntax to Objective-C syntax. However exceptions are
     made  for  Smalltalk  literal  constants, which translate to C literal
     constants. In other words, 2+2 translates  to  [2  plus:2],  which  is
     _g_u_a_r_a_n_t_e_e_d  to  fail catastrophically in Objective-C. The integer 2 is
     an object only in Smalltalk!

          The moral:  _N_e_v_e_r  believe  the  translator.  _A_l_w_a_y_s  monitor  it
     closely. Remember the 90-10 rule. The automatic translation concept is
     capable, with suitable rules, of automatically translating only 90% of
     an  application  correctly;  the  other  10% (where the bugs will have
     congregated) is still up to you.



                             Implementation Status


          Producer currently represents about three  man-weeks  of  effort,
     spent  in  two  intensive  bursts  separated by about a year. The most
     recent burst was nearly a year and a half ago.  The first burst was to
     demonstrate  the  feasibility and practicality of the translation con-
     cept. The second burst was in the course of preparing  a  paper  that,
     coauthored  with Kurt Schmucker, will appear in the OOPSLA-87 proceed-
     ings. A (very) early draft is provided with this distribution.

          For being developed so quickly, the translator does an  effective
     job  of  translation.  I refer you to the paper for discussions of the
     strengths and limitations of the translation  concept.   This  section
     discusses  the current implementation of this concept, the items on my
     own must-do list for the planned, but not yet completed,  third  stage
     of Producer's evolution.

     (1)  Smalltalk-80 fileout format uses '!' delimiters in a fashion that
          I  was never able to formalize correctly in Producer's yacc gram-
          mar. The symptom is that  the  translator  will  generate  syntax
          errors  in nearly every translated file for certain of these del-
          imiters. I'm told that fileout format has been  documented  in  a


     Brad Cox                          3                      June 22, 1987







                Producer: Smalltalk-80 to Objective-C Translator


          paper  somewhere, but I've never worked the repairs back into the
          code. The fix should be local to gram.y.

     (2)  The translator loads its rule base by reading files of  rules  as
          if  they were concatenated with the sources to be translated. The
          rule-specification syntax is abysmal, primarily  because  it  was
          chosen  to  minimize  the  amount of time I spent struggling with
          shift-reduce conflicts from yacc, rather than  making  the  rules
          intelligible  to  users. Smalltalk's formal grammar seemed unrea-
          sonably difficult for yacc to swallow, and I suspect the  problem
          may  lie  in  some  mistake I've made in translating Smalltalk-80
          syntax diagrams into yacc specifications.

     (3)  The program contains extensive provisions for reporting its cogi-
          tations in type inferencing. The various error, warning, logging,
          and debugging messages need to be tuned for greater utility.

     (4)  The code was based on an as yet unreleased libary (phylum) called
          "Substrate",  which  supports  features  that  are not yet in our
          standard product set, like  Blocks,  Coroutining,  and  exception
          handling.   I made a fast editing pass to remove any dependencies
          on these nonstandard library  features.  I  also  added  a  file,
          Substrate.h,  that defines stylistic conventions that I adhere to
          in all my work. See USE, IMPORT, EXPORT, etc in the sources.

          The preceeding problems are superficial and easily repaired.  The
     following  ones  are  somewhat  more  substantial in that they involve
     design work in addition to coding work.

     (1)  The type inferencing machinery infers types of  newly-encountered
          (unknown)  messages and variables by seeing how they are combined
          with variables and messages whose types are known apriori or else
          determined  earlier through inferencing.  The only types that are
          known apriori are literals like 1, 2.3, or  'string'.  This  gen-
          erally  provides  insufficient  typing  information from which to
          infer anything useful, so you should generally  provide  variable
          rules  to  pin  down  types for key instance variables and method
          arguments You do this with rules that state, in effect, that `the
          type of the Smalltalk variable named foo is int, and the variable
          is called foobar in Objective-C'.  Presently  rules  have  global
          scope.  If different Smalltalk classes use the name, foo, in ways
          that should be translated differently, different rule  sets  must
          be  provided  manually  to  the translator. Creating and managing
          these application-specific rules sets  adds  to  the  translation
          effort  and tends to make rules non-reusable across translations.
          The rules should be organized with a scoping  mechanism,  ideally
          one based on inheritance.

     (2)  The inferencing logic is ad-hoc and quite possibly slow.  However
          the  main  bottleneck seems to be loading the rule-base; transla-
          tion  speed  has  never  been  a  real  problem.  Inferencing  is
          presently  deductive,  and  a more inductive scheme based on both
          forwards and backwards reasoning  might  produce  higher  quality


     Brad Cox                          4                      June 22, 1987







                Producer: Smalltalk-80 to Objective-C Translator


          translations.  In other words, the translation of a given message
          expression is determined exclusively by whatever information  can
          be inferred about the types of the receiver and arguments to that
          message (forward reasoning). Backward reasoning would  also  con-
          sider how the results of the expression are used in other expres-
          sions.

     (3)  Producer does not presently handle  non-trivial  uses  of  Blocks
          correctly;  ie.   Block  expressions  that  cannot  be translated
          directly into C conditional expressions like if, while,  or  for,
          which Producer handles just fine already.  Nearly all occurrences
          of Smalltalk-80 Blocks could  be  handled  without  changing  the
          Objective-C  language by adding a trivially simple Block class to
          the library. A named instance  variable  holds  a  pointer  to  a
          static function and indexed instance variables hold _c_o_p_i_e_s _o_f any
          variables that the block accesses in the  instantiation  site[2].
          This  copy  could  be taken entirely automatically by copying the
          instantiation site's stack frame.  However I prefer to have  more
          control  over  space  than that. So I've been using a scheme that
          requires the programmer (and someday  the  compiler)  to  specify
          which  variables are really accessed by the block as arguments to
          the message that instantiates the block; like this

               ... {
                IMPORT void aStaticFunction();
                  id var1 = something, var2 = something;
                aBlock = [Block function:aStaticFunction args:2, var1, var2];
                [anyObject do:aBlock];
                ...
               }
               LOCAL void aStaticFunction(instantiationSiteVariables, value1, value2)
                struct { id var1, var2; } *instantiationSiteVariables;
                id value1, value2;
               {
                if ([instantiationSiteVariables->var1 someMessage])
                  ...
               }


          The block will call the function when anyObject sends  the  block
          one  of  several  evaluation  messages  (value:arg1 or value:arg1
          value:arg2 or ...). The first argument is a  _p_o_i_n_t_e_r  to  block's
          copy  of  the  instantiation site's variables. The trailing argu-
          ments contain the arguments that the invocation  site  passed  in
          the value: message.  I've used this approach extensively by writ-
          ing the static functions by hand, and am trying to get our  staff
          to  extend  the  language  to provide some kind of language-level
          support to make the syntax simpler.  This approach could be,  but
          has not yet been, taken by Producer.
     ____________________
9        [2] In Smalltalk-80, the block seems to have access to the  instan-
     tiation  site's  variables,  so that the block can change variables in


9     Brad Cox                          5                      June 22, 1987







                Producer: Smalltalk-80 to Objective-C Translator


          The inferencing machinery's primary current virtue is that it can
     be made to work for selected test cases. It leaves lots to be desired.
     Call me if you decide to extend it so that I can  prevent  unnecessary
     duplication of effort.



                             About the distribution


          The top level of the distribution consists of

         total 88
         -rw-r--r--  1 cox           181 Jun 22 14:32 Makefile
         -rw-r--r--  1 cox         26592 Jun 22 14:30 README
         drwxr-xr-x  2 cox           512 Jun 22 14:19 example
         -rw-r--r--  1 cox           166 Jun 16 13:18 log
         -rw-r--r--  1 cox           997 Jun 15 11:09 mac.me
         -rw-r--r--  1 cox         26751 Jun 15 11:02 producer.me
         -rw-r--r--  1 cox         21444 Jun 22 14:29 readme.me
         drwxr-xr-x  2 cox           512 Jun 12 10:22 rules
         drwxr-xr-x  2 cox          3072 Jun 22 14:31 src

     The Makefile governs formatting of  the  two  documents;  this  README
     (from   readme.me)   and  the  draft  of  the  OOPSLA-87  paper  (from
     Producer.me). The mac.me file contains text formatting macros that are
     common to both papers; used like this:

         nroff -me mac.me Producer.me >Producer.f


          The rules directory contains  a  single  file,  generic.ru,  that
     represents a first pass at an application-independent rules base. This
     set of rules translate Smalltalk to the conventions used in my  proto-
     type version of the user interface library.

          For example, it translates Smalltalk Integer operations to C  int
     operations,  and  it translates Smalltalk Point operations to C macros
     that manage points as type PT; a pair of 16-bit coordinates in  a  32-
     bit  C  int.   For  example,  pt(x,y) invokes a C macro that trims and
     shifts two ints, x and y, to fit side by side  in  a  32-bit  integer,
     ptPlus(p,q)  invokes  a  macro  that  computes  the  vector sum of two
     points, p and q, etc.

         rules:
         total 35
     ____________________
9     the instantiation site. In Objective-C the block receives  a  copy  of
     the  variables  and cannot use them to communicate with the instantia-
     tion site. I believe that  this  is  the  sole  functional  difference
     between the two schemes.



9     Brad Cox                          6                      June 22, 1987







                Producer: Smalltalk-80 to Objective-C Translator


         -rw-r--r--  1 cox         35567 Jun 12 10:22 generic.ru


          The src directory contains a fragment from  the  video  animation
     program  that  appears  at  the  end  of  the Smalltalk-80 video tape.
     BounceInBoxNode.st is the Smalltalk-80 source file, animation.ru  con-
     tains  the  application-specific  rule  set,  BounceInBoxNode.m is the
     translated version built by Producer as invoked by Makefile[3].

         example:
         total 7
         -rw-r--r--  1 cox          1730 Jun 16 10:24 BounceInBoxNode.m
         -rw-r--r--  1 cox           868 Jun 16 10:18 BounceInBoxNode.st
         -rw-r--r--  1 cox           394 Jun 16 10:20 Makefile
         -rw-r--r--  1 cox          2178 Jun 16 10:18 animation.ru
         -rw-r--r--  1 cox           185 Jun 16 10:24 log
         -rw-r--r--  1 cox           239 Jun 16 10:18 st80.h


          The log file records the results of the translation session.  The
     syntax  error  is innocuous, the result of the beforementioned problem
     in the grammar in handling '!' delimiters.

         Producer -c ../rules/generic.ru animation.ru BounceInBoxNode.st >BounceInBoxNode.m
         error 7:BounceInBoxNode.st: tegory:'Graphics-Animation'!! : syntax error
         *** Error code 1 (ignored)


          The src directory contains the sources for Producer, with its own
     Makefile.    The  Substrate.h  header  file,  which  is  automatically
     included by the Producer.h header file, is technically  a  part  of  a
     internal  lower level library, Substrate, on which Producer was origi-
     nally developed. Substrate.h was copied and changed  superficially  so
     that Producer compiles correctly without the Substrate library.

         src:
         total 70
         -rw-r--r--  1 cox           483 Jun 12 10:21 AbstractTranslation.m
         -rw-r--r--  1 cox           282 Jun 12 10:21 ArgumentList.m
         -rw-r--r--  1 cox           897 Jun 12 10:21 Block.m
         -rw-r--r--  1 cox           143 Jun 12 10:21 CharConstant.m
         -rw-r--r--  1 cox          2205 Jun 12 10:21 Class.m
         -rw-r--r--  1 cox           630 Jun 12 10:21 Comment.m
         -rw-r--r--  1 cox           176 Jun 12 10:21 Constant.m
         -rw-r--r--  1 cox          2032 Jun 12 10:21 Expr.m
         -rw-r--r--  1 cox          1243 Jun 12 10:21 FunctionTranslation.m
         -rw-r--r--  1 cox          1484 Jun 12 10:21 Identifier.m
         -rw-r--r--  1 cox          1248 Jun 12 10:21 IdentifierTranslation.m
     ____________________
9        [3] The full source for the animation program is not  provided.  My
     copyright paranoia argued against providing even this fragment.



9     Brad Cox                          7                      June 22, 1987







                Producer: Smalltalk-80 to Objective-C Translator


         -rw-r--r--  1 cox           105 Jun 12 10:21 List.m
         -rw-r--r--  1 cox          1985 Jun 15 11:55 METHODDECLS.m
         -rw-r--r--  1 cox          1384 Jun 15 11:51 Makefile
         -rw-r--r--  1 cox          4302 Jun 12 10:21 Method.m
         -rw-r--r--  1 cox          3136 Jun 12 10:21 Msg.m
         -rw-r--r--  1 cox           583 Jun 12 10:21 MsgArgPattern.m
         -rw-r--r--  1 cox           828 Jun 12 10:21 MsgNamePattern.m
         -rw-r--r--  1 cox          1280 Jun 12 10:21 MsgTranslation.m
         -rw-r--r--  1 cox           775 Jun 12 10:21 MsgTranslator.m
         -rw-r--r--  1 cox          1868 Jun 12 10:21 Node.m
         -rw-r--r--  1 cox           229 Jun 12 10:21 NumberConstant.m
         -rw-r--r--  1 cox          1402 Jun 15 11:27 Producer.h
         -rw-r--r--  1 cox           306 Jun 12 10:21 Return.m
         -rw-r--r--  1 cox           825 Jun 12 10:21 Scope.m
         -rw-r--r--  1 cox          3157 Jun 12 10:21 Selector.m
         -rw-r--r--  1 cox           253 Jun 12 10:21 SelectorConstant.m
         -rw-r--r--  1 cox           457 Jun 12 10:21 StArray.m
         -rw-r--r--  1 cox           492 Jun 12 10:21 Stmt.m
         -rw-r--r--  1 cox           381 Jun 12 10:21 StringConstant.m
         -rw-r--r--  1 cox          1268 Jun 12 10:21 StringTranslation.m
         -rw-r--r--  1 cox          2140 Jun 15 11:38 Substrate.h
         -rw-r--r--  1 cox          1405 Jun 15 11:53 Symbol.m
         -rw-r--r--  1 cox           452 Jun 12 10:21 Template.m
         -rw-r--r--  1 cox           901 Jun 12 10:21 Type.m
         -rw-r--r--  1 cox          1800 Jun 12 10:21 design.me
         -rw-r--r--  1 cox          3271 Jun 12 10:21 gen.m
         -rw-r--r--  1 cox          9007 Jun 12 10:21 gram.y
         -rw-r--r--  1 cox          3601 Jun 12 10:21 lex.l
         -rw-r--r--  1 cox          2212 Jun 12 10:21 main.m
         -rw-r--r--  1 cox           260 Jun 12 10:21 st80.h
         -rw-r--r--  1 cox           259 Jun 15 11:59 y.tab.h


          The files are exactly as I left them nearly a  year  and  a  half
     ago, except for:

     (1)  The addition of this README  document.  An  early  draft  of  the
          OOPSLA-87 paper, sadly prior to Kurt Schmucker's improvements, is
          in Producer.me.

     (2)  One recompilation pass to remove any obvious dependencies  on  my
          private  Substrate  library  and to verify that Producer compiles
          and runs correctly on the standard Foundation library.  I  tested
          the  changes  by verifing that the Makefile in the example direc-
          tory ran to completion, but this is hardly an ironclad guarantee.



                                   Using Producer


          Flags controlling the  translation  process,  source  files,  and
     rules  files are provided on the command line and are processed in the


     Brad Cox                          8                      June 22, 1987







                Producer: Smalltalk-80 to Objective-C Translator


     order they appear.  The flags are[4]

     -d:  Enable debugging functions (dbg()) scattered throughout the code.
          Seldom useful.

     -m:  Enables  the  Objective-C  Foundation  library  message   tracing
          feature. Seldom useful in Producer.

     -a:  Enables the Objective-C  Foundation  library  allocation  tracing
          feature. Seldom useful in Producer.

     -l:  Enables printing of each lexical token as produced by lex. Useful
          only for debugging lex.l.

     -g:  Enables automatic redirection of each class into a separate  file
          based on the class name parsed from the input file. Automatically
          puts class Foobar into file Foobar.m.

              CAREFUL! This puts at risk other files whose  name  might
              coincide with a Smalltalk-80 class name!


     -s:  Generate Smalltalk-80 sources in the output file  as  Objective-C
          comments (the default).

     -c:  Don't generate Smalltalk-80 sources in the output file.

     -i:  Generate information that was thought at one time  to  be  useful
          when debugging rules.

     -M:  Send storeOn: to the message rule  dictionary  just  before  ter-
          minating as a debugging aid.

     -I:  Send storeOn: to the variable rule dictionary  just  before  ter-
          minating as a debugging aid.

          Typically, the generic rules  in  rules/generic.ru  is  specified
     first, then any application-specific rules, then a single Smalltalk-80
     source file.  Unless -g is  set,  the  translated  output  appears  on
     stdout.  The  various  creaks, groans and mumbles that can be elicited
     about the translation process itself appear on stderr.

          For the syntax for writing new rules, refer to  the  examples  in
     generic.ru  and  animation.ru,  and if necessary, the rules section of
     the grammar in gram.y.

          And good luck! Let me know how you fare...

     ____________________
9        [4] I'm working from memory about what these flags mean.  Some  may
     be nonfunctional:



9     Brad Cox                          9                      June 22, 1987




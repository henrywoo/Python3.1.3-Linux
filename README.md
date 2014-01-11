python313src
============

Henry Fuheng Wu's Python 3.1.3 Linux Repo


New features:

1. Synta check like PHP or Perl

        $./python -E -h
        usage: ./python [option] ... [-c cmd | -m mod | file | -] [arg] ...
        Options and arguments (and corresponding environment variables):
        -l     : check syntax only
        ...


        $cat m.py
        # -*- coding:utf-8 -*-
        num = 3
        until num == 0:
          print(num)
          num -= 1
        
        $./python -l m.py
        <<m.py>>: OK
        
        $cat m2.py
        #-*- coding: utf-8 -*-
        num = 3
        until num == 0:
          print(num)
          num -= 1
        
        x=0b0121
        
        $./python -l m2.py
        <<m2.py>>: ERROR
        [Syntax error] in <<m2.py>> at line 7:
        "x=0b0121"
                ^


2. Python parser speed up, faster DFA graph lookup

3. A new keyword "until"

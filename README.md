python313src
============

Henry Fuheng Wu's Python 3.1.3 Linux Repo

Waht is Python?

Python is like a virtual CPU (the evaluator), and storage which has 3 things: code objects, state objects, and “regular” objects. The evaluator evaluates the code objects in the context of state objects; the state objects have pointers to namespaces which contain regular objects which the evaluator uses.


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

4. execute any of .py, .pyc or .pyo file without specifying the suffix explicitly

        $ls -al
        total 12
        drwxr-xr-x 2 root root 4096 Jan 14 07:18 ./
        drwxr-xr-x 3 root root 4096 Jan 14 07:18 ../
        -rw-r--r-- 1 root root  178 Jan 14 07:17 x.pyo
        $./../python3 x
        123
        $./../python3 x.py
        123
        $



Thinking on:

1. -- GIL --

2. -- Memory --

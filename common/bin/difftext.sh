#!/bin/bash
#
# Copyright (c) 2012, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#

# The difftext.sh knows how to compare text files and
# ignore some specific differences.
# When difftext.sh is called, we already know that the
# files differ. But if the tests below trigger, then
# we ignore differences caused by:
#
#   Timestamps in Java sources generated by idl2java
#   Sorting order and cleanup style in .properties files.

OLD="$1"
NEW="$2"
SUF="${OLD##*.}"
TMP=1
if test "x$SUF" == "xjava"; then
   TMP=$(LANG=C diff $OLD $NEW | \
       grep '^[<>]' | \
       sed '/[<>] \* from.*\.idl/d' | \
       sed '/[<>] \*.*201[12].*/d' | \
       sed '/\/\/ Generated from input file.*/d' | \
       sed '/\/\/ This file was generated AUTOMATICALLY from a template file.*/d' | \
       sed '/\/\/ java GenerateCharacter.*/d')
fi
if test "x$SUF" == "xproperties"; then
    cat $OLD | sed -e 's/\([^\\]\):/\1\\:/g' -e  's/\([^\\]\)=/\1\\=/g' -e 's/#.*/#/g' \
-e 's/\\u0020/\x20/g' \
-e 's/\\u003A/\x3A/g' \
-e 's/\\u006B/\x6B/g' \
-e 's/\\u0075/\x75/g' \
-e 's/\\u00A0/\xA0/g' \
-e 's/\\u00A3/\xA3/g' \
-e 's/\\u00B0/\xB0/g' \
-e 's/\\u00B7/\xB7/g' \
-e 's/\\u00BA/\xBA/g' \
-e 's/\\u00BF/\xBF/g' \
-e 's/\\u00C0/\xC0/g' \
-e 's/\\u00C1/\xC1/g' \
-e 's/\\u00C2/\xC2/g' \
-e 's/\\u00C4/\xC4/g' \
-e 's/\\u00C5/\xC5/g' \
-e 's/\\u00C8/\xC8/g' \
-e 's/\\u00C9/\xC9/g' \
-e 's/\\u00CA/\xCA/g' \
-e 's/\\u00CD/\xCD/g' \
-e 's/\\u00CE/\xCE/g' \
-e 's/\\u00D3/\xD3/g' \
-e 's/\\u00D4/\xD4/g' \
-e 's/\\u00D6/\xD6/g' \
-e 's/\\u00DA/\xDA/g' \
-e 's/\\u00DC/\xDC/g' \
-e 's/\\u00DD/\xDD/g' \
-e 's/\\u00DF/\xDF/g' \
-e 's/\\u00E0/\xE0/g' \
-e 's/\\u00E1/\xE1/g' \
-e 's/\\u00E2/\xE2/g' \
-e 's/\\u00E3/\xE3/g' \
-e 's/\\u00E4/\xE4/g' \
-e 's/\\u00E5/\xE5/g' \
-e 's/\\u00E6/\xE6/g' \
-e 's/\\u00E7/\xE7/g' \
-e 's/\\u00E8/\xE8/g' \
-e 's/\\u00E9/\xE9/g' \
-e 's/\\u00EA/\xEA/g' \
-e 's/\\u00EB/\xEB/g' \
-e 's/\\u00EC/\xEC/g' \
-e 's/\\u00ED/\xED/g' \
-e 's/\\u00EE/\xEE/g' \
-e 's/\\u00EF/\xEF/g' \
-e 's/\\u00F1/\xF1/g' \
-e 's/\\u00F2/\xF2/g' \
-e 's/\\u00F3/\xF3/g' \
-e 's/\\u00F4/\xF4/g' \
-e 's/\\u00F5/\xF5/g' \
-e 's/\\u00F6/\xF6/g' \
-e 's/\\u00F9/\xF9/g' \
-e 's/\\u00FA/\xFA/g' \
-e 's/\\u00FC/\xFC/g' \
-e 's/\\u0020/\x20/g' \
-e 's/\\u003f/\x3f/g' \
-e 's/\\u006f/\x6f/g' \
-e 's/\\u0075/\x75/g' \
-e 's/\\u00a0/\xa0/g' \
-e 's/\\u00a3/\xa3/g' \
-e 's/\\u00b0/\xb0/g' \
-e 's/\\u00ba/\xba/g' \
-e 's/\\u00bf/\xbf/g' \
-e 's/\\u00c1/\xc1/g' \
-e 's/\\u00c4/\xc4/g' \
-e 's/\\u00c5/\xc5/g' \
-e 's/\\u00c8/\xc8/g' \
-e 's/\\u00c9/\xc9/g' \
-e 's/\\u00ca/\xca/g' \
-e 's/\\u00cd/\xcd/g' \
-e 's/\\u00d6/\xd6/g' \
-e 's/\\u00dc/\xdc/g' \
-e 's/\\u00dd/\xdd/g' \
-e 's/\\u00df/\xdf/g' \
-e 's/\\u00e0/\xe0/g' \
-e 's/\\u00e1/\xe1/g' \
-e 's/\\u00e2/\xe2/g' \
-e 's/\\u00e3/\xe3/g' \
-e 's/\\u00e4/\xe4/g' \
-e 's/\\u00e5/\xe5/g' \
-e 's/\\u00e7/\xe7/g' \
-e 's/\\u00e8/\xe8/g' \
-e 's/\\u00e9/\xe9/g' \
-e 's/\\u00ea/\xea/g' \
-e 's/\\u00eb/\xeb/g' \
-e 's/\\u00ec/\xec/g' \
-e 's/\\u00ed/\xed/g' \
-e 's/\\u00ee/\xee/g' \
-e 's/\\u00ef/\xef/g' \
-e 's/\\u00f0/\xf0/g' \
-e 's/\\u00f1/\xf1/g' \
-e 's/\\u00f2/\xf2/g' \
-e 's/\\u00f3/\xf3/g' \
-e 's/\\u00f4/\xf4/g' \
-e 's/\\u00f5/\xf5/g' \
-e 's/\\u00f6/\xf6/g' \
-e 's/\\u00f7/\xf7/g' \
-e 's/\\u00f8/\xf8/g' \
-e 's/\\u00f9/\xf9/g' \
-e 's/\\u00fa/\xfa/g' \
-e 's/\\u00fc/\xfc/g' \
-e 's/\\u00ff/\xff/g' \
  	     | sed -e '/^#/d' -e '/^$/d' \
                  -e :a -e '/\\$/N; s/\\\n//; ta' \
  	          -e 's/^[ \t]*//;s/[ \t]*$//' \
		  -e 's/\\=/=/' | LANG=C sort > $OLD.cleaned
   TMP=$(LANG=C diff $OLD.cleaned $NEW)
fi
if test -n "$TMP"; then
    echo Files $OLD and $NEW differ
fi
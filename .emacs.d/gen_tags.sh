#!/bin/bash

find `pwd` -name "*.[chCH]" -print | etags -

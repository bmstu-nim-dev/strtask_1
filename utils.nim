# Не правьте данный код :)
import os, sequtils, sets, strutils


proc getDirs*(dir: string): seq[string] =
  var buf: HashSet[string]
  buf.incl(dir)
  for k, p in walkDir(dir):
    if k == pcDir and p notin result:
      buf.incl(p)
      buf = buf + getDirs(p).toHashSet
  result = buf.toSeq


proc getFiles*(dir: string): seq[string] =
  for f in walkDirRec(dir):
    if ".git" notin f:
      result.add(splitPath(f).tail)
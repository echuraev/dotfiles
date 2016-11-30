" started In Diff-Mode set diffexpr (plugin not loaded yet)
if exists("*systemlist")
  if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
  endif
endif

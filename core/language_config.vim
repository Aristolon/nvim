"每次创建C++文件都会初始化一些内容
autocmd BufNewFile *.cpp exec ":call CppInit()"
func CppInit()
  if expand("%:e") == "cpp"
    call setline(1,"/*")
    call setline(2,"*******************************************************************")
    call setline(3,"Author:                Aristolon")
    call setline(4,"Date:                  ".strftime("%Y-%m-%d"))
    call setline(5,"FileName：             ".expand("%"))
    call setline(6,"Copyright (C):         ".strftime("%Y")." All rights reserved")
    call setline(7,"*******************************************************************")
    call setline(8,"*/")
    call setline(9,"#include<iostream>")
    call setline(10,"")
    call setline(11,"int main(int argc, const char *argv[]){")
    call setline(12,"")
    call setline(13,"  return 0;")
    call setline(14,"}")
  endif
endfunc

autocmd BufNewFile * normal G'

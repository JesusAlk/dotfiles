function! python_helper#PythonObject(obj)
    let orig_line   = line('.')
    let orig_col    = col('.')
    let orig_indent = indent(orig_line)


    if (a:obj == "class")
        let objregexp  = '\v^\s*(.*class)\s+(\w+)\s*'
        let max_indent_allowed = 0
    elseif (a:obj == "method")
        let objregexp = '\v^\s*(.*def)\s+(\w+)\s*\(\s*(self[^)]*)'
        let max_indent_allowed = 4
    else
        let objregexp = '\v^\s*(.*def)\s+(\w+)\s*\(\s*(.*self)@!'
        let max_indent_allowed = orig_indent
    endif

    let flag = "Wb"

    while search(objregexp, flag) > 0
        "
        " Very naive, but if the indent is less than or equal to four
        " keep on going because we assume you are nesting.
        " Do not count lines that are comments though.
        "
        if (indent(line('.')) <= 4) && !(getline(line('.')) =~ '\v^\s*#(.*)')
          if (indent(line('.')) <= max_indent_allowed)
            return 1
          endif
        endif
    endwhile

endfunction


function! python_helper#CurrentClass()
    let save_cursor = getpos(".")
    normal! $<cr>
    let find_object = python_helper#PythonObject('class')
    if (find_object)
        let line = getline('.')
        call setpos('.', save_cursor)
        let match_result = matchlist(line, ' *class \+\(\w\+\)')
        return match_result[1]
    endif
endfunction


function! python_helper#CurrentMethod()
    normal! $<cr>
    let find_object = python_helper#PythonObject('method')
    if (find_object)
        let line = getline('.')
        let match_result = matchlist(line, ' *def \+\(\w\+\)')
        return match_result[1]
    endif
endfunction


function! python_helper#CurrentFunction()
    normal! $<cr>
    let find_object = python_helper#PythonObject('function')
    if (find_object)
        let line = getline('.')
        let match_result = matchlist(line, ' *def \+\(\w\+\)')
        return match_result[1]
    endif
endfunction


function! python_helper#Path()
    let cwd = shellescape(expand("%:p"))
    return cwd
endfunction

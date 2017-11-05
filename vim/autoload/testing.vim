function! testing#SendFunction()
    let save_cursor = getpos(".")
    let current_function = python_helper#CurrentFunction()
    call setpos('.', save_cursor)
    let path_to_file = expand('%:p')
    let pytest_command = 'pytest '
    let testing_target = shellescape(pytest_command . " " . path_to_file . "::" . current_function)

    call system("tmux send-keys -t testing" . " " . testing_target . " Enter")


endfunction

function! testing#SendClass()
    let has_class = python_helper#CurrentClass()
    if len(has_class) < 2
        echo "This is not a class"
        return 
    endif
    let path_to_file = expand('%:p')
    let pytest_command = 'pytest '
    let testing_target = shellescape(pytest_command . " " . path_to_file . "::" . has_class)

    call system("tmux send-keys -t testing" . " " . testing_target . " Enter")


endfunction

function! testing#SendMethod()
    let save_cursor = getpos(".")
    let has_class = python_helper#CurrentClass()
    if len(has_class) < 2
        echo "This is not a method"
        return 
    endif
    let current_method = python_helper#CurrentMethod()
    call setpos('.', save_cursor)
    let path_to_file = expand('%:p')
    let pytest_command = 'pytest '
    let testing_target = shellescape(pytest_command . " " . path_to_file . "::" . has_class . "::" . current_method)

    call system("tmux send-keys -t testing" . " " . testing_target . " Enter")

endfunction

function! testing#CoverageCurrentFiles()
    let files = buf#CleanedBufferList()
    let target = files[1]
    let test_file = files[0]
    let pytest_command = 'pytest --cov='
    let testing_target = shellescape(pytest_command . target . " " . test_file)

    call system("tmux send-keys -t testing" . " " . testing_target . " Enter")


endfunction

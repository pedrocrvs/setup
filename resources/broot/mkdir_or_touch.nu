def main [new_path: path]: nothing -> nothing {
    let is_directory: bool = $arg1 | str ends-with "/"

    if $is_directory {
        mkdir $arg1
    } else {
        touch $arg1
    }
 }

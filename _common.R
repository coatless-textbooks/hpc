print_code = function(shortcode) {
    function(filename) {
        cat(paste0("```", shortcode), readLines(filename), "```", sep = "\n")
    }

}

print_sh = print_code("sh")
print_r = print_code("r")

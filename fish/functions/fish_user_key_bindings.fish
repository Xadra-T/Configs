#Fish automatically calls this function when the shell starts up.
function fish_user_key_bindings
    bind \e\[C nextd-or-forward-word      # Right Arrow accepts one word
    bind \e\[1\;3C accept-autosuggestion  # Alt + Right accepts full suggestion
end

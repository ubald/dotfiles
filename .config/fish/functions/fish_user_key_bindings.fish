function fish_user_key_bindings
  # Wasn't working anymore, no problem, we never used fzf
  #fzf_key_bindings
  fzf --fish | source
end

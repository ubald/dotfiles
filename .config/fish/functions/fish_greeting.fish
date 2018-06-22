function fish_greeting -d "What's up, fish?"
	if status --is-interactive
  		# Print a random, hopefully interesting, adage.
	  if type -q fortune; and type -q toilet
	    fortune -a -s | tr '\n' ' ' | tr '\t' ' ' | tr -s ' ' | toilet --font future --termwidth --filter gay
	  end
  end
end

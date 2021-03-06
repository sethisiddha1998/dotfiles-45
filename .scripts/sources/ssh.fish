#!/usr/bin/env fish

function ssh-start
	# http://rabexc.org/posts/pitfalls-of-ssh-agents
	if is-empty-string "$SSH_AUTH_SOCK"
		eval (ssh-agent -c)
	end
end

function ssh-add-one
	ssh-start
	ssh-add -K "$HOME/.ssh/$argv[1]"
end

function ssh-add-all
	ssh-start
	ssh-add -A
	echo 'If your keys were not added, you may need to re-add them to the keychain via: ssh-add <name>'
end

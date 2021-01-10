all:

enable-git-hooks:
	git config --local include.path ../.gitconfig
	$(warning REMEMBER, YOU MUST HAVE REVIEWED THE CUSTOM HOOKS!)

tested:
	date --utc > ./push-checklist
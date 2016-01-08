configure_vim:
	ansible-playbook vim.yml -i hosts -vv -e curdir=$(CURDIR)

update_plugins: vim

TAGS := always

# .PHONY:
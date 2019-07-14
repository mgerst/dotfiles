ansiblerole() {
    mkdir -p roles/$1/{defaults,files,handlers,meta,tasks,templates,vars}
}

export ANSIBLE_NOCOWS=1

python3 -c 'import ara' > /dev/null 2>&1
if [[ "$?" -eq "0" ]]; then
    eval $(python3 -m ara.setup.env)
fi

alias dnsdeploy='cd ~/dns; ansible-playbook -i hosts playbook.yml --ask-become-pass; cd -'

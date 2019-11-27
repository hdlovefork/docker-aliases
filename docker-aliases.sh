#!/bin/bash
export LARADOCK_DIR="~/WorkSpace/laradock"

function dcup_alias {
    alias dcup > /dev/null 2>&1 || {
        echo "alias dcup='cd ${LARADOCK_DIR} && docker-compose up -d nginx redis mysql'" > ~/.bash_aliases
    }
}

function dcwork_alias {
	alias dcwork > /dev/null 2>&1 || {
        echo "alias dcwork='dcwork () { cd \${LARADOCK_DIR} && docker-compose exec -u 1000 -w /var/www/\$1 workspace bash;};dcwork'" >> ~/.bash_aliases
    }
}

dcup_alias
dcwork_alias
echo "安装完成，请运行 source ~/.bash_aliases 生效"


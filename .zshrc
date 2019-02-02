<!--在 ~/.zshrc 或 ~/.bashrc 添下面代码, 就能实现自动执行发布脚本-->
<!--https://gist.github.com/bramblex/a6b12543a076e2c1fa5acecb95f51ead-->

if (pbpaste  | grep -Eq  '^cd "[^"]*" && sh "[^"]*/site_publish_logs/sh_\d*\.sh" && open "[^"]*"') 
then
    echo "========== MWEB AUTO PUBLISH START ==========" 
    echo "Runing command:"
    pbpaste

    if pbpaste | sh
    then

        echo "Success!"
        echo "Clean pasteboard..."
        echo -n "" | pbcopy
        echo "==========  MWEB AUTO PUBLISH END  =========="
        echo "Close terminal 5s later..."
        sleep 5
        exit

    else

        echo "Failed!"
        echo "Clean pasteboard..."
        echo -n "" | pbcopy
        echo "==========  MWEB AUTO PUBLISH END  =========="

    fi

fi

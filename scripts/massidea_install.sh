!/bin/bash

## logien luominen
touch $HOME/massidea/logs/register.log
touch $HOME/massidea/logs/errors.log
touch $HOME/massidea/logs/contentpublish.log
chmod 777 $HOME/massidea/logs/* $HOME/massidea/tmp $HOME/massidea/www/upload $HOME/massidea/www/files $HOME/massidea/www/temp

echo -e "Created logs!"

if grep "RewriteBase" -q $HOME/massidea/www/.htaccess
then
        echo -e "RewriteBase installation skipped!"
else
        echo -e "RewriteBase /~`echo $USER`/" >> $HOME/massidea/www/.htaccess
        echo "Added RewriteBase! (modified: `echo $HOME/massidea/www/.htaccess`)"
        cd $HOME/massidea/
        /usr/bin/git update-index --assume-unchanged $HOME/massidea/config/
        /usr/bin/git update-index --assume-unchanged $HOME/massidea/logs/
        /usr/bin/git update-index --assume-unchanged $HOME/massidea/www/.htaccess
        /usr/bin/git update-index --assume-unchanged $HOME/massidea/tmp/
        /usr/bin/git update-index --assume-unchanged $HOME/massidea/www/upload/
        /usr/bin/git update-index --assume-unchanged $HOME/massidea/www/files/
        /usr/bin/git update-index --assume-unchanged $HOME/massidea/www/temp/
fi

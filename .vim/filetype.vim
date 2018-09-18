" Postfix 
au BufNewFile,BufRead   main.cf     setfiletype pfmain
au BufNewFile,BufRead   master.cf   setfiletype pfmaster

" nginx.comf
au BufRead,BufNewFile /etc/nginx/*,/etc/nginx/conf.d/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

" php-fpm conf
au BufRead,BufNewFile php*.conf set syntax=dosini

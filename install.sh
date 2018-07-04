#!/bin/sh

user_path=/home/adam
user=adam
taglist_path=./taglist_4.6
nerdtree_path=./NERD_tree_5.0.0
srcexpl_path=./SrcExpl
trinity_path=./Trinity

if [ ! -d $user_path/.vim/doc ]; then
echo "$user_path/.vim/doc is not exist, create it"
mkdir -p $user_path/.vim/doc
fi

#ctags
echo "=== install ctags ==="
apt-get install ctags
echo "\"ctags settings" >> $user_path/.vimrc
echo "set tags=./tags,./TAGS,tags;~,TAGS;~" >> $user_path/.vimrc

#cscope
echo "=== install cscope ==="
apt-get install cscope

echo "set cscopetag" >> ./test
echo "set csto=0" >> ./test
echo "\"cscope settings" >> $user_path/.vimrc
echo "if filereadable(\"cscope.out\")" >> $user_path/.vimrc
echo "   cs add cscope.out   " >> $user_path/.vimrc
echo "elseif $CSCOPE_DB != \"\"" >> $user_path/.vimrc
echo "    cs add $CSCOPE_DB" >> $user_path/.vimrc
echo "endif" >> $user_path/.vimrc
echo "set cscopeverbose" >> $user_path/.vimrc
echo "nmap zs :cs find s <C-R>=expand(\"<cword>\")<CR><CR>" >> $user_path/.vimrc
echo "nmap zg :cs find g <C-R>=expand(\"<cword>\")<CR><CR>" >> $user_path/.vimrc
echo "nmap zc :cs find c <C-R>=expand(\"<cword>\")<CR><CR>" >> $user_path/.vimrc
echo "nmap zt :cs find t <C-R>=expand(\"<cword>\")<CR><CR>" >> $user_path/.vimrc
echo "nmap ze :cs find e <C-R>=expand(\"<cword>\")<CR><CR>" >> $user_path/.vimrc
echo "nmap zf :cs find f <C-R>=expand(\"<cfile>\")<CR><CR>" >> $user_path/.vimrc
echo "nmap zi :cs find i ^<C-R>=expand(\"<cfile>\")<CR>$<CR>" >> $user_path/.vimrc
echo "nmap zd :cs find d <C-R>=expand(\"<cword>\")<CR><CR>" >> $user_path/.vimrc


#taglist
echo "=== install taglist ==="
cp -f $taglist_path/plugin/taglist.vim $user_path/.vim/plugin/
cp -f $taglist_path/doc/taglist.txt $user_path/.vim/doc/
echo "\"taglist settings" >> $user_path/.vimrc
echo "nmap <F8> :TlistToggle<CR><CR>" >> $user_path/.vimrc
echo "let Tlist_Show_One_File=1" >> $user_path/.vimrc
echo "let Tlist_Exit_OnlyWindow=1" >> $user_path/.vimrc
echo "set ut=100" >> $user_path/.vimrc

#nerdtree
echo "=== install nerdtree ==="
cp -f $nerdtree_path/plugin/NERD_tree.vim $user_path/.vim/plugin/
cp -f $nerdtree_path/$nerdtree_path/ $user_path/.vim/doc/
cp -rf $nerdtree_path/autoload $user_path/.vim/
cp -rf $nerdtree_path/lib $user_path/.vim/
cp -rf $nerdtree_path/nerdtree_plugin $user_path/.vim/
cp -rf $nerdtree_path/syntax $user_path/.vim/
echo "\"nerdtree settings" >> $user_path/.vimrc
echo "nmap <F9> :NERDTreeFind<CR><CR>" >> $user_path/.vimrc
echo "let NERDTreeWinPos=1" >> $user_path/.vimrc

#SrcExpl
echo "=== install srcexpl ==="
cp -f $srcexpl_path/plugin/srcexpl.vim $user_path/.vim/
cp -f $srcexpl_path/doc/srcexpl.txt $user_path/.vim/doc/

echo "\"srcexpl settings" >> $user_path/.vimrc
echo "nmap <F10> :SrcExplToggle<CR>" >> $user_path/.vimrc
echo "let g:SrcExpl_pluginList = [" >> $user_path/.vimrc
echo "   \\\"__Tag_List__\"," >> $user_path/.vimrc
echo "   \\\"_NERD_tree_\"" >> $user_path/.vimrc
echo "   \\ ]" >> $user_path/.vimrc

#Trinity
echo "=== install trinity ==="
cp -f $trinity_path/plugin/trinity.vim $user_path/.vim/
echo "\"trinity settings" >> $user_path/.vimrc
echo "nmap <F7> :TrinityToggleAll" >> $user_path/.vimrc

chown -R $user:$user $user_path/.vim
chown -R $user:$user $user_path/.vimrc








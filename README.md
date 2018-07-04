# vim_source_trace
vim_source_trace

http://ivan7645.github.io/2016/07/12/vim_to_si/

ctags:
ctags可以在函式、變數之間自由進行切換，例如某主函式call了funca()，ctags可以直接跳到funca的函式裡面、也可使用在變數上
*	進入程式目錄當中，若是多層的目錄則進到最上層的目錄，接著輸入
	ctags -R
*	用vim進到.c .h檔之後移到函式或變數上即可使用快捷鍵找到該函式或變數的定義，也可跳回到使用此函式的地方
	"跳至該函式或變數定義
	Ctrl + ]
	"跳回使用此函式或變數處
	Ctrl + t

cscope:
cscope可以查詢函式或變數在哪些地方被使用過，或是函式當中使用了哪些函式
*	進入程式目錄當中，若是多層的目錄則進到最上層的目錄，接著輸入
	cscope -Rbqk
	參數說明如下
	R : 將目錄及子目錄底下的所有文件都建立索引
	b : 僅建立關聯數據庫，不導入使用者介面
	q : 建立cscope.in.out和cscope.po.out，可增快搜尋速度
	k : 不搜尋預設會include進來的函式(/usr/include)
*	進入vim的一般指令模式之後必須將cscope.out加入
	:cs add cscope.out
*	各指令的用途
	:cs find s {name} : 找出C語言name的符號
	:cs find g {name} : 找出name定義的地方
	:cs find c {name} : 找出使用name的地方
	:cs find t {name} : 找出name的字串
	:cs find e {name} : 相當於egrep功能，但速度更佳
	:cs find f {name} : 尋找檔案
	cs find i {name} : 尋找include此檔案的檔案
	cs find d {name} : 尋找name裡面使用到的函式

taglist:
taglist可在切出一區塊，顯示此檔案裡的macro，global variable，函式等資訊，且會隨著瀏覽到哪個地方便以不同顏色標示
*	nmap : 將F8設為開啟taglist的快捷鍵

nerdtree:
NERD tree可切出一區塊，顯示根目錄開始的檔案結構，且可由list直接跳到選取的檔案
*	nmap : 將F9設為開啟nerdtree的快捷鍵

SrcExpl(Source Explorer):
SrcExpl可以將當下function的定義顯示出來，或是將當下的變數宣告處顯示出來
*	nmap : 將F10設為開啟srcexpl的快捷鍵

trinity:
trinity用來整合taglist, nerdtree, srcexpl，使可以一鍵開啟三個plgin的功能
*	nmap : 將F7設為一次打開taglist, nerdtree, srcexpl的快捷鍵


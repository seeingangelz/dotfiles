config.load_autoconfig(False)

c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
c.downloads.location.directory = '~/Downloads'
 
config.set("fileselect.handler", "external")
config.set("fileselect.single_file.command", ['st', '-e', 'ranger', '--choosefile', '{}'])
config.set("fileselect.multiple_files.command", ['st', '-e', 'ranger', '--choosefiles', '{}'])

c.scrolling.bar = 'never'
config.set("colors.webpage.darkmode.enabled", True)
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
config.bind('xm', 'hint links spawn mpv {hint-url}')

c.url.searchengines = {'DEFAULT': 'https://google.com/search?q={}',
                       'yt': 'https://www.youtube.com/results?search_query={}',
                       'aw': 'https://wiki.archlinux.org/?search={}',
                       're': 'https://www.reddit.com/r/{}',}
c.url.start_pages = ["https://seeingangelz.neocities.org/"] 
c.url.default_page = "https://seeingangelz.neocities.org/"

c.fonts.default_family = "JetBrainsMono"
c.fonts.default_size = '8pt'
c.fonts.completion.entry = '8pt "JetBrainsMono"'
c.fonts.debug_console = '8pt "JetBrainsMono"'
c.fonts.prompts = '8pt "JetBrainsMono"'
c.fonts.statusbar = '8pt "JetBrainsMono"'

c.content.blocking.adblock.lists = [
    "https://raw.githubusercontent.com/hectorm/hmirror/master/data/adaway.org/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/adblock-nocoin-list/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/adguard-cname-trackers/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/adguard-simplified/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/dandelionsprout-nordic/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-ara/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-bul/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-ces-slk/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-deu/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-fra/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-heb/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-ind/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-ita/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-kor/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-lav/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-lit/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-nld/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-por/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-rus/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-spa/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easylist-zho/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/easyprivacy/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/eth-phishing-detect/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/gfrogeye-firstparty-trackers/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/hostsvn/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/kadhosts/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/matomo.org-spammers/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/mitchellkrogza-badd-boyz-hosts/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/pgl.yoyo.org/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/phishing.army/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/socram8888-notonmyshift/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/someonewhocares.org/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/spam404.com/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/stevenblack/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/ublock/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/ublock-abuse/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/ublock-badware/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/ublock-privacy/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/urlhaus/list.txt",
	"https://raw.githubusercontent.com/hectorm/hmirror/master/data/winhelp2002.mvps.org/list.txt" ]

import pywalQute.draw
config.load_autoconfig()
pywalQute.draw.color(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

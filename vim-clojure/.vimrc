execute pathogen#infect()
syntax on
filetype plugin indent on

" clojure rainbow parens
 let g:rainbow_active = 1
 let g:rainbow_conf = {
       \  'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
             \  'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
                   \  'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/
		      \  end=/\]/ fold', 'start=/{/ end=/}/ fold'],
                         \  'separately': {
                               \      '*': 0,
                                     \      'clojure': {},
                                           \  }
                                                 \}

" configure clojure folding
 let g:clojure_foldwords = "def,defn,defmacro,defmethod,defschema,defprotocol,defrecord"



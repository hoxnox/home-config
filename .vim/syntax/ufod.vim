syntax match MessageDelims /++ [À-ß€-Ÿ][À-ß€-Ÿ]/
syntax match FieldNo /\/[0-9][0-9]/
syntax match MG /\/ÌÃ\|\/Œƒ/
syntax match NewLine /÷/

" syntax match TemplateName /^XPT\s\+\w\+/ containedin=TemplateLine

hi MessageDelims gui=none guifg=#ff0000 guibg=#333333
hi FieldNo gui=none guifg=#87ceeb guibg=#333333
hi MG gui=none guifg=#87aaeb guibg=#333333
hi NewLine gui=none guifg=#555555 guibg=#333333

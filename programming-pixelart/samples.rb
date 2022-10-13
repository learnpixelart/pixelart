$LOAD_PATH.unshift( "../pixelart/lib" )
require 'pixelart'



## We now have an array of strings
##  with a bunch of hyphen - characters
##  and the characters a, b, c, d, e.

data = [
    "---bbbbb----",
    "--bbbbbbbbb-",
    "--dddccec---",
    "-dcdccceccc-",
    "-dcddccceccc",
    "--dcccceeee-",
    "---cccccc---",
    "--bbabbabb--",
    "-bbbabbabbb-",
    "bbbbaaaabbbb",
    "ccbacaacabcc",
    "cccaaaaaaccc",
    "ccaaaaaaaacc",
    "--aaa--aaa--",
    "-ddd----ddd-",
    "dddd----dddd"
]


###
#  So everytime we find
# the letter a in the data array we'll fill it with a blue color,
#  b with a red color,
#  and c with a yellow color, etc.

colors = {
    '-':  0,    ## transparent
    a: Color.rgb(20, 102, 168),   ## blue
    b: Color.rgb(224, 36, 64),    ## red
    c: Color.rgb(227, 227, 139),  ## yellow
    d: Color.rgb(115, 72, 13),    ## brown
    e: Color.rgb(0, 0, 0)         ## black
}


img = Image.parse( data, colors: colors )
img.save( './tmp/mario.png' )
img.zoom(8).save( './tmp/mario@8x.png' )



###########
#  Cat

data = [
    "   a      a            ",
    "  a-a    a-a           ",
    "  a-baaaab-a        aa ",
    " ab--bb-b--ba      a--a",
    " a----------a      a--a",
    "ab----------baaaa   aba",
    "a--a--a--a---b-b-a  a-a",
    "a-c--a-a--c--b-b--aaaba",
    "a------------------a-a ",
    "a------------------a-a ",
    "a-------------------a  ",
    "ab------------------a  ",
    "ab------------------a  ",
    "ab-----------------ba  ",
    " ab---------------ba   ",
    "  ab-bb-b---b-bb-ba    ",
    "   a-aa-aaaaa-aa-a     ",
    "   aa  aa   aa  aa     ",
    "ddddddddddddddddddddddd"
]

colors = {
    " ":  0,   ## transparent
    a: Color.rgb(20, 20, 20),       ## black
    b: Color.rgb(120, 116, 117),    ##  dark gray
    c: Color.rgb(227, 141, 226),    ## pink
    "-": Color.rgb(204, 202, 200),  ## light gray
    d: Color.rgb(135, 101, 67)      ## brown (ground)
};

# background = Color.rgb(94, 173, 165)

img = Image.parse( data, colors: colors )
img.save( './tmp/cat.png' )
img.zoom(8).save( './tmp/cat@8x.png' )


#####
#  Among Us

data = [
    "   aaa   aaa   ",
    "   aeea ae a   ",
    "   adeeaeeea   ",
    "    addeeea    ",
    "     aadaa     ",
    "      ada      ",
    "     aaaaaaa   ",
    "    a-------a  ",
    "   a----aaaaa  ",
    "   a---abb   a ",
    "   a--acbbbbb a",
    " aaa--accbbbbba",
    "a--a---acccccca",
    "ax-a----aaaaaa ",
    "ax-ax--------a ",
    "axxax--------a ",
    "axxax--------a ",
    " aaax--xxxxx-a ",
    "   ax--aaaaa-a ",
    "   ax--a  ax-a ",
    "   axxxa  axxa ",
    "    aaa    aa  "
]

colors = {
    " ": 0,  # transparent
    a: Color.rgb(20, 20, 20),     ## black
    b: Color.rgb(108, 174, 196),  ## light blue
    c: Color.rgb(50, 135, 163),   ## dark blue
    e: Color.rgb(100, 166, 93),   ## light green
    d: Color.rgb(56, 102, 49),    ## dark green
    "-": Color.rgb(230, 65, 51),    ## light red
    x: Color.rgb(163, 47, 39),    ## dark red
}

# background = Color.rgb(184, 186, 186)


img = Image.parse( data, colors: colors )
img.save( './tmp/among_us.png' )
img.zoom(8).save( './tmp/among_us@8x.png' )


##########################
## Black Cat

data = [
    "--a--------------a---------------------",
    "--aa------------aa---------------------",
    "--aaa----------aaa---------------------",
    "--abaa--------aaba---------------------",
    "--abbaaaaaaaaaabba---------------------",
    "--abbaaaaaaaaaabba---------------------",
    "--aaaaaaaaaaaaaaaa---------------------",
    "---aaaaaaaaaaaaaa----------------------",
    "--aacccaaaaaacccaa---------------------",
    "--acccacaaaacaccca---------------------",
    "--acccaccaaccaccca---------------------",
    "--aaccaccaaccaccaa---------------------",
    "aaaaaaaaaaaaaaaaaaaa--------------aaa--",
    "--aaaaaaabbaaaaaaa--------aaa----a---a-",
    "---aaaaaaaaaaaaaa--------a---a--a-----a",
    "--a-aaaaaaaaaaaa-a-------a----aa------a",
    "-a----aaaaaaaa----a------a------------a",
    "--------aaaaa-------------a-----------a",
    "--------aaaaaa------------a-----------a",
    "-------aaaaaaaa------------a---------a-",
    "-------aaaaaaaaaa-----------a--------a-",
    "-------aaaaaaaaaaa-----------aa-----a--",
    "--------aaaaaaaaaaa----------------a---",
    "--------aaaaaaaaaaa---------------a----",
    "---------aaaaaaaaaaa------------aa-----",
    "--------aaaaaaaaaaa-aa-------aaa-------",
    "--------aaaaaaaaaaa---aaaaaaa----------",
    "--------aaaaa-aaa----------------------",
]

colors = {
    "-": 0,   ## transparent
    a: Color.rgb(20, 20, 20),     ## black
    b: Color.rgb(242, 244, 245),  ## white
    c: Color.rgb(230, 230, 23),   ## yellow
}

# background = Color.rgb(132, 207, 207)

img = Image.parse( data, colors: colors )
img.save( './tmp/black_cat.png' )
img.zoom(8).save( './tmp/black_cat@8x.png' )


#################
## Owl

data = [
    "-----------a-----a------------",
    "----------aa-----aa-----------",
    "---------abcaaaaacba----------",
    "---------abcccccccba----------",
    "---------aeeeccceeea----------",
    "--------aebbbecebbbea---------",
    "--------abbbbbebbbbba---------",
    "--------abbaabebaabba---------",
    "--------abbaabebaabba---------",
    "--------aebbbeeebbbea---------",
    "--------aceeedddeeeca---------",
    "---f--f-accccedecccca---------",
    "----gf--accccceccccca------f--",
    "---hg----acccccccccaa-----g---",
    "--h------accccccccca-f--g-gg--",
    "hh-g------adddaddda-ff---h--f-",
    "ihh------ihaaaiaaahhf-hhh-f---",
    "-ihh---hiiiihhiihhiihhff---f--",
    "--ihhhhii------gf---ih---f---f",
    "---hiii---------gf--g-h-fg-gf-",
    "----h----------------g-h--hg-f",
    "-----gg-------------f---hhgf--",
    "----f--f---------------g---gf-"
]

colors = {
    "-": 0,   # transparent
    ## Owl
    a: Color.rgb(20, 20, 20),     ## black
    b: Color.rgb(242, 244, 245),  ## white
    c: Color.rgb(11, 110, 125),   ## blue
    d: Color.rgb(224, 194, 22),   ## yellow
    e: Color.rgb(117, 117, 115),  ## gray
    ## Branch
    f: Color.rgb(186, 235, 89),   ## light green
    g: Color.rgb(108, 173, 29),   ## dark green
    h: Color.rgb(102, 78, 18),    ## brown
    i: Color.rgb(135, 135, 132),  ## gray
}

# background = Color.rgb(106, 156, 153)

img = Image.parse( data, colors: colors )
img.save( './tmp/owl.png' )
img.zoom(8).save( './tmp/owl@8x.png' )


####################
#  Nyan Cat

data = [
    "------------------------aaaaaaaaaaaaaaaaa-------",
    "----gggggg------gggggggabbbbbbbbbbbbbbbbba------",
    "ggggggggggggggggggggggabbbcccccccccccccbbba-----",
    "ggggggggggggggggggggggabbccccccdccdcccccbba-----",
    "gggghhhhhhgggggghhhhhhabccdccccccccccccccba-----",
    "hhhhhhhhhhhhhhhhhhhhhhabccccccccccaaccdccba-aa--",
    "hhhhhhhhhhhhhhhhhhhhhhabcccccccccaeeaccccbaaeea-",
    "hhhhiiiiiihhhhhhaaaaiiabcccccdcccaeeeacccbaeeea-",
    "iiiiiiiiiiiiiiiiaeeaaiabcccccccccaeeeeaaaaeeeea-",
    "iiiiiiiiiiiiiiiiaaeeaaabcccdcccccaeeeeeeeeeeeea-",
    "iiiijjjjjjiiiiiijaaeeaabcccccccdaeeeeeeeeeeeeeea",
    "jjjjjjjjjjjjjjjjjjaaeeabcdccccccaeeefaeeeeefaeea",
    "jjjjjjjjjjjjjjjjjjjaaaabccccccccaeeeaaeeeaeaaeea",
    "jjjjkkkkkkjjjjjjkkkkkaabcccccdccaeddeeeeeeeeedda",
    "kkkkkkkkkkkkkkkkkkkkkkabbcdcccccaeddeaeeaeeaedda",
    "kkkkkkkkkkkkkkkkkkkkkkabbbcccccccaeeeaaaaaaaeea-",
    "kkkkllllllkkkkkklllllaaabbbbbbbbbbaeeeeeeeeeea--",
    "llllllllllllllllllllaeeeaaaaaaaaaaaaaaaaaaaaa---",
    "llllllllllllllllllllaeeaa-aeea-----aeea-aeea----",
    "llll------llllll----aaaa--aaa-------aaa--aa-----"
]


colors = {
    "-": 0,    ## transparent
    ## cat
    a: Color.rgb(20, 20, 20),     ## black
    b: Color.rgb(227, 206, 150),  ## tan
    c: Color.rgb(219, 149, 219),  ## light pink
    d: Color.rgb(194, 31, 180),   ## dark pink
    e: Color.rgb(117, 117, 115),  ## gray
    f: Color.rgb(252, 252, 252),  ## white
    ## rainbow
    g: Color.rgb(250, 38, 10),    ## red
    h: Color.rgb(250, 138, 10),   ## orange
    i: Color.rgb(247, 247, 10),   ## yellow
    j: Color.rgb(32, 214, 8),     ## green
    k: Color.rgb(8, 219, 242),    ## blue
    l: Color.rgb(148, 10, 247),   ## purple
}

# background = Color.rgb(64, 183, 189)

img = Image.parse( data, colors: colors )
img.save( './tmp/nyan_cat.png' )
img.zoom(8).save( './tmp/nyan_cat@8x.png' )




puts "bye"

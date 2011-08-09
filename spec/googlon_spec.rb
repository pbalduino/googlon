# decoding: ISO8859-1

require 'rspec'
require 'googlon'

WHITESPACE  = /[ \n\r]/

describe 'Googlon' do
  before :each do
    @words_a = TEXT_A.split(WHITESPACE).delete_if{|x| x.empty?}
    @words_b = TEXT_B.split(WHITESPACE).delete_if{|x| x.empty?}
  end

  context 'Primeiramente, as letras Googlon s�o classificadas em dois grupos:' do
    it 'm, p, c, w e f sao chamadas "letras tipo foo"' do
      FOO.should =~ ['m', 'p', 'c', 'w', 'f']
    end

    it 'enquanto que as demais s�o conhecidas como "letras tipo bar"' do
      FOO.each do |char|
        BAR.include?(char).should be_false
      end
    end
  end

  context 'Os linguistas descobriram que as preposi��es em Googlon s�o as 
  palavras de 4 letras que terminam numa letra tipo foo, mas onde n�o ocorre a letra h.' do
    it 'Portanto, � f�cil ver que existem 21 preposi��es no Texto A.' do
      count_prepositions(@words_a).should == 21
    end

    it 'E no Texto B, quantas preposi��es existem?' do
      puts ''
      puts "Existem #{count_prepositions(@words_b)} preposi��es em B"
    end

  end

  context 'Um outro fato interessante descoberto pelos linguistas � que, no 
  Googlon, os verbos sempre s�o palavras de 6 ou mais letras que terminam numa 
  letra tipo bar. Al�m disso, se um verbo come�a com uma letra tipo bar, o 
  verbo est� em primeira pessoa.' do
    it 'Assim, lendo o Texto A, � poss�vel identificar 227 verbos no texto' do
      count_verbs(@words_a).should == 227
    end

    it 'dos quais 167 est�o em primeira pessoa' do
      count_first_person_verbs(@words_a).should == 167
    end

    it 'J� no Texto B, quantos s�o os verbos?' do
     puts ''
     puts "Existem #{count_verbs(@words_b)} verbos em B"
     puts "Existem #{count_first_person_verbs(@words_b)} verbos em primeira pessoa em B"
    end
  end

  context 'Um professor universit�rio utilizar� os textos A e B para ensinar o 
  Googlon aos alunos. Para ajudar os alunos a compreender o texto, esse 
  professor precisa criar uma lista de vocabul�rio para cada texto, isto �, 
  uma lista ordenada (e sem repeti��es) das palavras que aparecem em cada um dos textos.' do

    context 'Essas listas devem estar ordenadas e n�o podem conter repeti��es 
    de palavras. No Googlon, assim como no nosso alfabeto, as palavras s�o 
    ordenadas lexicograficamente, mas o problema � que no Googlon, a ordem das 
    letras no alfabeto � diferente da nossa. O alfabeto Googlon, em ordem, �: 
    xmgnqlvtdrbczjwfkhps. Assim, ao fazer essas listas, o professor deve respeitar 
    a ordem alfab�tica Googlon.' do

      it 'O professor preparou a lista de vocabul�rio para o Texto A:' do
        lexicon_a = 'xmlvlnqf xmprfz xghj xgstwjnk xgswt xnxxfq xntfqwqw xnpkxs xnsdhthr 
        xqz xqpklxqm xvgvph xvclcnm xvpptsp xtsrpx xdnm xdpd xrb xrzmqtj xbxzzl xcnqwtt 
        xcddw xcrxjrwj xzqn xzs xjwsld xkvr xkvfwpr xhkbx mxcsvf mxpxxt mmmgskk mgn mglxhh 
        mnhtnnnv mqnwpgt mqcfgcf mqfwlsgs mvqrdwl mvl mvhn mtn mtvwkcm mttgjjk mtkglm 
        mdfwzqcq mrcbvwbs mrcjchh mrfwvvw mrknvxm mrpgq mrsnfhwr mbvgs mbhs mbpzq mcx mczg 
        mjbsqlq mwh mfbkm mkdz mksz mhcjch mpvklng mpj gxtbqgsj gggkmr ggcgq ggj gnslhf 
        gqfs gqkcfkgb glvkzkgb gldz gvlwf grlnxrcl gbvwnpc gbbngwm gcjmsj gcpj gcspnh gzcv 
        gzwhvqqt gzsbw gjtt gjdjnkn gwxzvldb gwds gfg gfzsz gfj gkntnsc gkk gkhc gkptm ghgz 
        ghbgtjs ghzhrm gszsd gsjdjrfn nxmrkpxj nmgvczr nmbtthg nmp ngjgrfzg nnx nnmkrw nngfg 
        nnbc nqvd nqwqv nqpwffpx nqsjm nlqlf nldhggd nvv nvbgfb nvz nvwlqgc ntxgqr ndrpjdrr 
        nrd nrzznsz nrjmwwnc nrphqjr nbtp ncxfbdhr ncgs ncncpr njbvrllg njbc nwnd nwzdqdks 
        nwjsp nwpsmj nfns nkklmg nhqccbfw nhrpmjqn npgntqb npnvl npsmq qxj qxhlqqgw qmpsgct 
        qgtbcdqd qncvff qqrzn qqjjhm qljrn qlfqknk qvxvg qvb qtnjwgb qdm qdtb qcqdh qcv qck 
        qzhzjfd qjgqv qjtzzpnq qwqgvb qwjl qfb qfbp qkl qhchs qhf qptlh qscblfpk lxvjcr 
        lmcssl lmwcp lnjmm lqnllp llnznr lldjt llrqtkh lvqgw lvjqzz ltqdhxrc lbbn lcjwl 
        lzcltnwk lzzxkzb lwvhwzp lwkqfz lfn lksbd lhlwbrnh lhrk lpxwdzc lphgmj vxgmndjz 
        vxw vmg vmdnmm vmkmzm vmhlvhx vgcwsq vnmd vnmsmxtl vlmrh vvv vvvzpfch vvjq vdhsmvv 
        vdsqqcx vrqck vbzvqtfq vzqksxmx vzrqqq vzk vzpftk vjgv vwtbtlrl vklsp vksckfkp 
        vhjln vhht vpxtnfjl vsvhxbdg vsr txtm tmt tmhdm tqzcz tlgbs tljs tvcnll ttnvm 
        tthkrr trvq trdqgz trzrm trplb tbctmqn tbkl tcgbdzm tcn tcqdnr tzbbqp tjvkm tjh 
        tkmvflzk tkddjq tks thvkmwg tpvzd tprmn dxsrwmg dmfdttbx dmpzj dgz dgjsrvj 
        dnhswd dljtcrmj dlwfk dtlgqqkr dtvw dthnkwqv dbw dcxpsk dcsctcpp dzvnhkpc 
        dzzgpkm dzs djjfnbkv dfgkxjln dfl dkmqhwj dkmrbxw dklbsn dhc dpfnhkb dsnc dshqc 
        rxl rmxgmvpg rmvn rnz rnktzgvd rqwptp rtdmbxmz rtbw rtkk rdn rrf rrfb rrpksxrq 
        rbz rbfwb rzdkgd rzw rjcjmtkm rjpgmlh rjsqd rkz rhvb rhwg rpnsb rpvv rsn rsjfv 
        bxb bmkqcjbf bgh bnmvdfs bqml bqmrpbxn bqlwts bllmzbz bvjpnk bvhfx btlphw bbgqrdr 
        bcncw bcwck bzjm bjthj bwnvbpcq bfsv bkq bkvp bpxv bpnd bpckmf bpwq bpkql bph 
        bsbjfwh bsclxcxj cxht cmmkfbdq cnfmqs cnssv cqm cqqk cvxchpbn cvzphbm ctzwqg 
        ctplnxjx cdg crgzgqp crvsmwfn cbxvqtm cbms cbjrldf cbjwcnwn ccsws cjwsqtw cwsxbblh 
        cftgcwnr cfjpds ckmpqgsd ckw chr chbr chcmdlz cpwzhjmg csddszqx zxjjjdn zxf zmbwbq 
        zggdn zghfcfj znvc zncv znpv zqnbgsbd zqlln zqwgstk zlgqldr zldmh zlpvsltd zvx 
        ztxstm zdgfts zdrwzf zdbfbq zrqqbcn zrbqvs zbfzl zcn zcvvflz zcbl zzvglqg zzzxt 
        zjsjcf zwt zwbks zwch zfr zksnbnhb zhqhxwf zpmck zsqcwbd zsdlp jxg jxznbb jmdmzhk 
        jmcrcl jgb jnqrxs jncjx jnkt jqgfv jqbd jlv jljbkf jlfkml jlhbc jvhr jtkb jdnljth 
        jrgxtpnq jrfm jbqcwqg jbbqjzd jcmk jcnrwqb jcvqftdb jccpbb jzfk jjzgc jwb jfgmv 
        jfp jkmf jkzxznlh jkj jhx jpj jphhxmh jsql jsv jsrw wxvmzbws wmmr wglf wldtfrp wtwc 
        wdbphkc wdf wrn wbnz wbkm wcvdw wjvlgvt wjrl wjcpkq wjfk wwbzpt wkgjnrf wkrrlqrv 
        wpvrlp wpf fxdqttph fxzrwm fmwtmq fmshm fgvq fngmnht fnvjtfcz flxtmlsq flv flf ftrq 
        ftstr fdt frn fcndbpcm fcc fchtlt fzvptc fzccr fjxnn fjwxzmr fwgcnqj fwzknspb ffxgc 
        ffxqn fktb fkpmwpk fspxsvrl kmlkx klx kvcsj ktwz ktpltnbx krdf krwn kbcqch kbjjwp 
        kcxpbb kcvfns kcr kcfr kjvl kjt kjkgmc kwz kfqcgj kftvg kfdfdzvg kkd khnpbr khpwjzpf 
        kpz kpwswcv hmd hmjsmrhn hnrdndcq hqtcktgg hlb hvqc hdwzsg hdsqkmnn hdsldw hrdcnds 
        hbj hbfmxv hbhnk hcvl hcrcvfc hcwc hzsdz hzsf hwn hwcvmpc hfmmx hkwdqvv hkkww hpvn 
        hspfbw pxdlch pxsc pmdcckm pgggxpwb pnzplvx pqlqkhn pll plbtm plczhz plh pvcwql 
        ptdjfqn ptz pdqlxnsp pdtck pdczrbv prpknth pbmpms pbw pbwt pbfzt pcp pjrxb phvzvn 
        ppvbgwfq ppdksdbx psqktcg psdpmv psrnr psbf psknqhm sxnpnqrm smlr smcxljm sgggtq 
        snghckbl snrd snws snhmpfm sqdrq slnnn slnk slfdtd svdwc sts sdvxckt sdjcftf sdsjpg 
        sbl sbhrq scmbzv scf scknqb scksp szqvn szvqlt szvprbdn szbvj szs sjgmpm swd swfjgsj skqrx'.split(WHITESPACE).delete_if{|x| x.empty?}

        lexicon(@words_a).should == lexicon_a

      end

      it 'Como seria a lista de vocabul�rio do Texto B?' do
        puts ''
        lexicon(@words_b).each{|word| print "#{word} "}
        puts ''
      end
    end
  end

  context 'Mas como os Googlons escrevem n�meros? Bem, no Googlon, as palavras 
  tamb�m s�o n�meros dados em base 20, onde cada letra � um d�gito, e os d�gitos 
  s�o ordenados do menos significativo para o mais significativo (o inverso do 
  nosso sistema). Ou seja, a primeira posi��o � a unidade, a segunda posi��o vale 
  20, a terceira vale 400, e assim por diante. Os valores das letras s�o dados 
  pela ordem em que elas aparecem no alfabeto Googlon (que � diferente da nossa 
  ordem, como vimos acima). Ou seja, a primeira letra do alfabeto Googlon representa 
  o d�gito 0, a segunda representa o d�gito 1, e assim por diante.' do
    it 'Por exemplo, a palavra zdbfbq tem o valor num�rico de 14524172' do
      convert_number('zdbfbq').should == 14524172
    end
  end

end

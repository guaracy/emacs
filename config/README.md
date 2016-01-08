<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />

# Emacs em 30 segundos #

-------------------------------------------------------------------------------

TL;DR

Arquivo de configuração para o Emacs para ser utilizado em uma instalação nova ou substituir uma antiga. Automaticamente instala alguns pacotes definidos e configura o ambiente e os pacotes. Tudo bem explicadinho para ser alterado/melhorado facilmente. Baixe o arquivo [.emacs](.emacs), coloque no seu diretório *home* e abra o Emacs.

-------------------------------------------------------------------------------

Acredito que o maior problema para alguém iniciar com o Emacs está em como ele vem configurado inicialmente. Uma aparência relativamente simples e com teclas de atalhos diferentes das que os usuários estão acostumados (pelo menos as principais).
Muitas das configurações devem estar no arquivo *.emacs* o que implica em edição e a primeira decepção do usuário.

Existem algumas soluções para quem deseja iniciar no fabuloso mundo do Emacs. Para quem usa o *Vim*, uma boa alternativa pode ser o [spacemacs](https://github.com/syl20bnr/spacemacs). Como desvantagem tem a sua complexidade e curva de aprendizado para configurar. Outra opção é o [super-emacs](https://github.com/myTerminal/super-emacs) mas acho que também falham em alguns aspectos. Esconder o menu pode não ser uma boa ideia ou sobrepor atalhos CUA com shift setas para selecionar frames também não.

A ideia aqui é que o usuário apenas copie um arquivo e, ao executar o Emacs na primeira vez, o programa já seja apresentado com uma aparência mais agradável e com diversas ferramentas/opções não disponíveis/configuradas. Mas também é necessário que o usuário saiba o que foi feito, possa efetuar as alterações e incluir novas diretrizes. É o que pretendo colocar neste documento.

O arquivo de configuração *.emacs* ficou estruturado da seguinte forma:

1. agrupamento das alterações que também são efetuadas pelo menu **Options** para que não causem conflito em futuras alterações pelo menu;
2. definição de repositório e pacotes que serão instalados;
3. instalação dos pacotes não inclusos no emacs e configuração dos que acompanham a distribuição;
4. configuração dos pacotes internos e externos que não pertencem ao item 1.

Inicialmente o Emacs tem uma cara assim:

![alt](emacs1.jpg)

Ou seja, uma barra de ferramentas de gosto duvidoso (depois de um breve período de uso você usa os atalhos em vez de tirar a mão do teclaro para clicar em um ícone daqueles) e uma tela de abertura com muita informação. Tudo isto irá mudar.


# Instalação #

Para instalar o Emacs, no Linux basta utilizar o comando para instalar pacotes (pacman, apt-get, etc.) e selecionar o Emacs. No Windows, baixe a última versão do Emacs do site [gnu](https://ftp.gnu.org/gnu/emacs/windows/), descompacte para alguma pasta e crie um link simbólico para o programa **runemacs**.

Para instalar deve estar conectado com a internet para que os pacotes necessários sejam baixados. Basta baixar o arquivo *.emacs* e colocá-lo na pasta do usuário. No Linux é **~/** ou **/home/nomeusuário** e no Windows é **c:\\Usuários\\nome\\AppData\\Rooming\\** (pelo menos em uma versão do Windows 8 que eu testei; não tenho Windows para saber como são as outras versões nem exatamente o que funciona ou não). 

# O arquivo de configuração #

O arquivo *.emacs* poderá ser alterado antes de executar o Emacs pela primeira vez. Use um editor de textos que você esteja acostumado. Se você desejar que o Emacs ignore alguma coisa, basta colocar **;** (ponto e vírgula) no início da linha. Vejamos o que possui em cada etapa da configuração.

## Alteração de opções iniciais ## 

    (custom-set-variables
     '(cua-mode t nil (cua-base))
     '(custom-enabled-themes (quote (deeper-blue)))
     '(indicate-empty-lines t)
     '(show-paren-mode t)
     '(tool-bar-mode nil))
	 
Estas configurações poderiam estar em qualquer parte do arquivo *.emacs* mas eu resolvi deixar no início pois, quando o usuário efetuar algura alteração pelo menu **Options** e selecionar **Options/Save Options** para torná-las permanentes, o Emacs irá alterar estas variáveis colocando mais informações. 

A primeira linha ativa o modo CUA (Common User Access) para que você não precise digitar *Alt+w* para copiar um texto, por exemplo. Pode utilizar o famoso *Crtl+C Ctrl+V*. Outra característica interessante que vem com o modo a a seleção em bloco. Você pressiona *Ctrl+Enter* e utiliza as setas para selecionar. Pode selecionar apenas uma coluna um um bloco maior. Depois pode utilizar as opções normais como copia, colar, excluir, sobrescrever, etc. *Ctrl+Enter*, novamente, para sair do modo de seleção em bloco.

A segunda linha especifica o tema inicial que será utilizado. Os temas podem ser vistos e alterados utilizando o menu **Options/Customize Emacs/Custom Themes**. Você pode, a qualquer momento alterar o tema e, se desejar, gravar para as próximas sessões.

A terceira opção irá preencher a janela do Emacs com um símbolo para indicar que não existem mais linhas após aquele ponto, mesmo em branco. Você poderá alterar a opção pelo menu **Options/Show/Hide/Fringe/Empty Line Indicators**. Lembre-se que se você fizer alguma alteração nas configurações, você deverá gravá-las pelo menu **Options/Save Options** se quiser que fiquem válidas para sessões futuras e elas irão alterar o arquivo *.emacs*..

A quarta opção irá salientar parêntesis, colchetes e chaves quando você estiver digitando um programa.

A quinta remove aquela barra de ferramentaas que, em pouco tempo, apenas irá ocupar espaço na tela.

## Inclusão de repositório para pacotes ##

    (require 'package)
    (add-to-list 'package-archives
                 '("melpa" . "http://melpa.milkbox.net/packages/")
                 t)
    (package-initialize)

Adiciona o repositório MELPA que contém um maior número de pacotes e com uma atualização constante.


## Atualização da lista de pacotes ##

    (when (not package-archive-contents)
      (package-refresh-contents))

Faz exatamente isto. Atualiza a lista de pacotes do MELPA e do ELPA (repositório padrão do Emacs) para instalação posteior dos pacotes atualizados.

## Lista de pacotes a serem instalados ##

    (defvar gbm-required-packages
      '(powerline
        hlinum
        hiwin
        ido-grid-mode
        imenu-anywhere
        smex
        markdown-mode
        pandoc-mode
        auto-complete
        smartparens
        theme-looper))
    
Contém uma lista dos pacotes que serão instalados se necessário. A qualquer momento, você poderá incluir na lista qualquer pacote que desejar (desde que existam nos repositórios) e configurá-lo mais no final do arquivo *.emacs*.

## Instalação/atualização dos pacotes ##

    (mapc (lambda (p)
           (package-install p))
         gbm-required-packages)

# Configuração da aparência e pacotes #

Na sequencia vamos ver as cofigurações especificadas para o Emacs e para os diversos pacotes bem como seu significado.

## Tamanho inicial da janela ##

    (setq initial-frame-alist
          '(
            (width . 130) ; characters
            (height . 40) ; lines
            ))

Não gosto do tamanho inicial da janela. Acho que antiquado, meio do tempo quando os monitores esram restritos a 40/80 colunas. Com a resolução e os monitores wide, uma janela mais larga parece mais adequado.

## Movimentação entre frames ##

    (windmove-default-keybindings 'meta)

Para evitar que o usuário tenha que recorrer ao *Ctrl+O* para se mover entre as janelas ou retirar a mão do teclado para mover o ponteiro até a janela desejada e clicar, o processo se dá pelo pressionamento de *Alt+setas*. O foco irá passar para o frame adequado. O padrão em caso de omissão é *Shift+setas* porém iria conflitar com o CUA que utiliza estas sequencias para selecionar um texto. 

## Realçar linha do cursor ##

    (global-hl-line-mode t)

## Numeração de linhas ##

    (global-linum-mode t)

## Realça numeração da linha do cursor ##

    (require 'hlinum)
    (hlinum-activate)

## Realçar parentesis ##

    (show-paren-mode)

## Ativa smartparens ##

    (smartparens-global-mode t)

## Esconte barra de rolamento ##

    (scroll-bar-mode nil)

## Salva estado atual ao sair ##

    (require 'saveplace)
    (setq-default save-place t)
    (setq save-place-file "~/.emacs.d/saved-places")

## Desabilita buffer de mensagem inicial ##

    (setq initial-buffer-choice
        t)

## Troca mensagem do buffer de rascunho ##

    (setq initial-scratch-message
        ";; Nada neste buffer será salvo. Use Ctrl+X Ctrl+F para ler um arquivo.")

## Realça frame ativo ##

    (require 'hiwin)
    (hiwin-activate)
    (set-face-background 'hiwin-face "black")


## Configura powerline ##

    (powerline-center-theme)
    (setq powerline-default-separator
          'wave)

## ido no modo grade ##

    (setq ido-enable-flex-matching t)
    (setq ido-everywhere t)
    (ido-mode t)
    (ido-grid-mode t)

## Configura atalho *Ctrl+.* para imenu-anywhere ##

    (global-set-key (kbd "C-.") 'imenu-anywhere)

## Configura atalhos *Alt+x* e *Alt+X* para smex ##

    (global-set-key (kbd "M-x") 'smex)
    (global-set-key (kbd "M-X") 'smex-major-mode-commands)

## Configura o markdown ##

    (autoload 'markdown-mode "markdown-mode"
      "Major mode for editing Markdown files" t)
    (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

## Configura o autocomplete ##

    (ac-config-default)
    (ac-linum-workaround)

## Configura pandoc ##

    (load "pandoc-mode")
    (add-hook 'markdown-mode-hook 'pandoc-mode)

## Configura theme-looper ##

    theme-looper-set-theme-set '(adwaita
                                 deeper-blue
                                 dichromacy
                                 misterioso
                                 tango-dark
                                 tango
                                 tsdh-dark
                                 wheatgrass
                                 wombat))
    (theme-looper-set-customizations 'powerline-reset)
    (global-set-key (kbd "C-\"") 'theme-looper-enable-next-theme)

## Arquivos recentes ##

    (require 'recentf)
    (recentf-mode t)
    (setq recentf-max-menu-items 25)
    (defun recentf-ido-find-file ()
      "Find a recent file using Ido."
      (interactive)
      (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
        (when file
          (find-file file))))
    (global-set-key (kbd "C-x C-r") 'recentf-ido-find-file)

## Cancela alterações no buffer ##

    (defun  revert-buffer-preserve-modes  ()
      (interactive)
      (revert-buffer  t  nil  t))
    (global-set-key (kbd "<f5>") 'revert-buffer-preserve-modes )

# Considerações finais #



<!--  LocalWords:  http-equiv Content-Type content text html charset
 -->
<!--  LocalWords:  utf Emacs TL emacs Options spacemacs super-emacs
 -->
<!--  LocalWords:  CUA shift frames Windows AppData Rooming
 -->

;;------------------------------------------
;; # Configurações iniciais
;;------------------------------------------
;; ## Alteração das opções iniciais
;;
(custom-set-variables
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (deeper-blue)))
 '(indicate-empty-lines t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

;;------------------------------------------
;; # Pacotes
;;------------------------------------------
;; ## Inclusão de repositório para pacotes
;; 
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")
             t)
(package-initialize)

;;------------------------------------------
;; ## Atualização da lista de pacotes
;;
(when (not package-archive-contents)
  (package-refresh-contents))

;;-----------------------------------------
;; ## Lista de pacotes a serem instalados
;;
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

;;-----------------------------------------
;; ## Instalação/atualização dos pacotes
;;
(mapc (lambda (p)
        (package-install p))
      gbm-required-packages)


;;-----------------------------------------
;; # Configuração da aparência e pacotes
;;------------------------------------------
;; ##Tamanho inicial da janela
;;
(setq initial-frame-alist
      '(
        (width . 130) ; characters
        (height . 40) ; lines
        ))

;;------------------------------------------
;; ## Movimentação entre frames
;;
(windmove-default-keybindings 'meta)

;;------------------------------------------
;; ## Realçar linha do cursor
;;
(global-hl-line-mode t)

;;------------------------------------------
;; ## Numeração de linhas
;;
(global-linum-mode t)

;;-----------------------------------------
;; ## Realça numeração da linha do cursor
;;
(require 'hlinum)
(hlinum-activate)

;;-----------------------------------------
;; ## Realçar parentesis
;;
(show-paren-mode)

;;-----------------------------------------
;; ## Ativa smartparens
(smartparens-global-mode t)

;;-----------------------------------------
;; ## Esconte barra de rolamento
;;
(scroll-bar-mode nil)

;;-----------------------------------------
;; ## Salva estado atual ao sair
;;
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")

;;-----------------------------------------
;; ## Desabilita buffer de mensagem inicial
;;
(setq initial-buffer-choice
    t)

;;-----------------------------------------
;; ## Troca mensagem do buffer de rascunho
;;
(setq initial-scratch-message
    ";; Nada neste buffer será salvo. Use Ctrl+X Ctrl+F para ler um arquivo.")

;;-----------------------------------------
;; ## Realça frame ativo
;;
(require 'hiwin)
(hiwin-activate)
(set-face-background 'hiwin-face "black")


;;-----------------------------------------
;; ## Configura powerline
;;
(powerline-center-theme)
(setq powerline-default-separator
      'wave)

;;-----------------------------------------
;; ## ido no modo grade
;;
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)
(ido-grid-mode t)

;;-----------------------------------------
;; ## Configura atalho *Ctrl+.* para imenu-anywhere
;;
(global-set-key (kbd "C-.") 'imenu-anywhere)

;;-----------------------------------------
;; ## Configura atalhos *Alt+x* e *Alt+X* para smex
;;
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;-----------------------------------------
;; ## Configura o markdown
;;
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;-----------------------------------------
;; ## Configura o autocomplete
;;
(ac-config-default)
(ac-linum-workaround)

;;-----------------------------------------
;; ## Configura pandoc
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'pandoc-mode)

;;-----------------------------------------
;; ## Configura theme-looper
(theme-looper-set-theme-set '(adwaita
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

;;-----------------------------------------
;; ## Arquivos recentes
;;
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

;;-----------------------------------------
;; ## Cancela alterações no buffer
;;
(defun  revert-buffer-preserve-modes  ()
  (interactive)
  (revert-buffer  t  nil  t))
(global-set-key (kbd "<f5>") 'revert-buffer-preserve-modes )


;;-----------------------------------------
;; FIM DO ARQUIVO .emacs
;;-----------------------------------------

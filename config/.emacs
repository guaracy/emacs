;;------------------------------------------
;; versão: 1.0
;; autor: Guaracy Monteiro
;; data: jan/16
;;
;; Configuração automática do Emacs
;; Para ser utilizado em uma instalação nova
;; ou excluir/move .emacs e .emacs.d e
;; usar este arquivo.
;;------------------------------------------
;; # Configurações iniciais
;;------------------------------------------
;; ## Alteração das opções iniciais
;;
(custom-set-variables
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (misterioso)))
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
  '(which-key
    hl-line+
    powerline
    hlinum
    hiwin
    htmlize
    ido-grid-mode
    ido-select-window
    imenu-anywhere
    smex
    pandoc-mode
    ox-pandoc
    org-cua-dwim
    auto-complete
    goto-chg
    indent-guide
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

;;-----------------------------------------
;; ## Which-key
;;
(which-key-mode)
(which-key-setup-minibuffer)
(setq max-mini-window-height 10)
(setq which-key-idle-delay 0.5)
(set-face-attribute 
 'which-key-local-map-description-face nil 
 :weight 'bold)

;;------------------------------------------
;; ## Numeração de linhas
;;
(global-linum-mode t)

;;------------------------------------------
;; ## Realçar linha do cursor
;;
(hl-line-mode t)
(toggle-hl-line-when-idle)
(set-face-attribute hl-line-face nil :background "Grey25")
(set-cursor-color "yellow")

;;-----------------------------------------
;; ## Realça numeração da linha do cursor
;;
(require 'hlinum)
(hlinum-activate)

;;-----------------------------------------
;; ## Realçar parêntesis
;;
(show-paren-mode)

;;-----------------------------------------
;; ## Esconde barra de rolamento ##
;;
(scroll-bar-mode -1)

;;-----------------------------------------
;; ## Salva estado atual ao sair
;;
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name 
		       ".places" user-emacs-directory))

;;-----------------------------------------
;; ## Desabilita buffer de mensagem inicial
;;
(setq initial-buffer-choice
    t)

;;-----------------------------------------
;; ## Troca mensagem do buffer de rascunho
;;
(setq initial-scratch-message
      ";; Nada neste buffer será salvo. Use:\n;; 
       Ctrl+x Ctrl+r / Ctrl+x Ctrl+f para ler um arquivo.\n")

;;-----------------------------------------
;; ## Realça frame ativo
;;
;(require 'hiwin)
;(hiwin-activate)
;(set-face-background 'hiwin-face "black")


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
(global-set-key (kbd "C-x o") 'ido-select-window)
(global-set-key (kbd "<f4>") 'ido-select-window)


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
;; ## Configura o autocomplete
;;
(ac-config-default)
(ac-linum-workaround)

;;-----------------------------------------
;; ## Indent guide
;;
(indent-guide-global-mode)

;;-----------------------------------------
;; ## Configura theme-looper
;;
(theme-looper-set-customizations 'powerline-reset)
(global-set-key (kbd "C-\"") 'theme-looper-enable-next-theme)

;;-----------------------------------------
;; ## Configura goto last change
;;
(global-set-key (kbd "C-x .") 'goto-last-change)
(global-set-key (kbd "C-x ,") 'goto-last-change-reverse)

;;-----------------------------------------
;; ## Ctrl+x Ctrl+r abre lista de arquivos recentes
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
;; Se o arquivo .myemacs existe, carregar
;; configurações do usuário
;;
(setq myconfig "~/.myemacs")
(if (file-exists-p myconfig)
    (load-file myconfig))

;;-----------------------------------------
;; Define F3 para iniciar busca
;; F3 novamente para próxima ocorrência
;; Shift+F3 para ocorrência anterior
(global-set-key (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map (kbd "<f3>")
  'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "S-<f3>")
  'isearch-repeat-backward)

;;------------------------------------------
;; ## Cunfiguração org-mode
;;
(setq org-CUA-compatible t)
(setq org-support-shift-select t)
(setq org-src-fontify-natively t)
(setq org-startup-truncated nil)
(setq org-use-speed-commands t)

(delete-other-windows)

;;-----------------------------------------
;; FIM DO ARQUIVO .emacs
;;-----------------------------------------

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

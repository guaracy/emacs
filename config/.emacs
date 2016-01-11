;;------------------------------------------
;; # Configurações iniciais
;;------------------------------------------
;; ## Alteração das opções iniciais
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (misterioso)))
 '(indicate-empty-lines t)
 '(paradox-github-token t)
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
    ido-grid-mode
    ido-select-window
    imenu-anywhere
    smex
    markdown-mode
    pandoc-mode
    auto-complete
    smartparens
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
(set-face-attribute 'which-key-local-map-description-face nil :weight 'bold)

;;------------------------------------------
;; ## Movimentação entre frames
;;
(windmove-default-keybindings 'meta)

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
;; ## Realçar parentesis
;;
(show-paren-mode)

;;-----------------------------------------
;; ## Esconde barra de rolamento ##
;;
(scroll-bar-mode -1)


;;-----------------------------------------
;; ## Ativa smartparens
(show-smartparens-global-mode t)
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

;;-----------------------------------------
;; ## Salva estado atual ao sair
;;
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;;-----------------------------------------
;; ## Desabilita buffer de mensagem inicial
;;
(setq initial-buffer-choice
    t)

;;-----------------------------------------
;; ## Troca mensagem do buffer de rascunho
;;
(setq initial-scratch-message
    ";; Nada neste buffer será salvo. Use:\n;; Ctrl+x Ctrl+r / Ctrl+x Ctrl+f para ler um arquivo.")

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
;; ## Configura o markdown
;;
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;-----------------------------------------
;; ## Configura pandoc
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'pandoc-mode)

;;-----------------------------------------
;; ## Configura goto last change
;;
(global-set-key (kbd "C-x .") 'goto-last-change)
(global-set-key (kbd "C-x ,") 'goto-last-change-reverse)

;;-----------------------------------------
;; ## Indent guide
;;
(indent-guide-global-mode)

;;-----------------------------------------
;; ## Configura theme-looper
;;
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
;; ## F6 para rotacionar as janelas 
;;
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (other-window -1)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))
(global-set-key (kbd "<f6>") 'rotate-windows)

;;-----------------------------------------
;; C-x C-k remove file from disk and kill buffer
;;
(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file fom disk? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;;-----------------------------------------
;; Renames current buffer and file it is visiting
;;
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))
(global-set-key (kbd "C-x r C-f") 'rename-current-buffer-file)


;;-----------------------------------------
;; Shuffle lines around
;;
;; TODO: verificar conflitos
;;
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))
(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

;;-----------------------------------------
;; Nova linha abixo/acima do cursos
;;
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))
(global-set-key (kbd "C-x C-<down>") 'open-line-below)
(global-set-key (kbd "C-x C-<up>") 'open-line-above)


;;-----------------------------------------
;; Se o arquivo .myemacs existe, carregar
;; configurações do usuário
;;
(setq myconfig "~/.myemacs")
(if (file-exists-p myconfig)
    (load-file myconfig))

;;-----------------------------------------
;; FIM DO ARQUIVO .emacs
;;-----------------------------------------


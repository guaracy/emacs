Arquivos
========

O arquivo *.myemacs* será carregado ao final do arquivo de configuração *.emacs*. É importante que as alterações sejam efetuadas neste arquivo e não no arquivo *.emacs*.

\#+ begin<sub>src</sub> lisp ;;----------------------------------------- ;; \#\# Cancela alterações no buffer ;; (defun revert-buffer-preserve-modes () (interactive) (revert-buffer t nil t)) (global-set-key (kbd "&lt;f5&gt;") 'revert-buffer-preserve-modes )

\#+ end<sub>src</sub>

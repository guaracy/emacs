Arquivos
========

O arquivo *.myemacs* será carregado ao final do arquivo de configuração *.emacs*. É importante que as alterações sejam efetuadas neste arquivo e não no arquivo *.emacs*.

``` commonlisp
;;-----------------------------------------
;; ## Cancela alterações no buffer
;;
(defun  revert-buffer-preserve-modes  ()
  (interactive)
  (revert-buffer  t  nil  t))
(global-set-key (kbd "<f5>") 'revert-buffer-preserve-modes )
```

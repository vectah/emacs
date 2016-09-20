(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "f9574c9ede3f64d57b3aa9b9cef621d54e2e503f4d75d8613cbcc4ca1c962c21" default)))
 '(ede-project-directories
   (quote
    ("/home/brendan/Desktop/ctest" "/home/brendan/Desktop/c_test")))
 '(semantic-complete-inline-analyzer-displayor-class (quote semantic-displayor-tooltip))
 '(semantic-complete-inline-analyzer-idle-displayor-class (quote semantic-displayor-tooltip))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; enable line numbers
;; (global-linum-mode 1)

;; use ido for easy buffer and file completion
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(setq initial-buffer-choice "/media/sf_vm_share/master.org") 

;; run with better defaults

;; some stuff to get the melpa packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; for important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; attempt to run with better defaults
(require 'better-defaults)

;; all this crap is required to have ede auto find projects
(require 'cedet)
(require 'eieio)
(require 'eieio-speedbar)
(require 'eieio-opt)
(require 'eieio-base)
(require 'ede/source)
(require 'ede/base)
(require 'ede/auto)
(require 'ede/proj)
(require 'ede/proj-comp)

(require 'ede/proj-archive)
(require 'ede/proj-aux)
(require 'ede/proj-elisp)
(require 'ede/proj-info)
(require 'ede/proj-misc)
(require 'ede/proj-obj)
(require 'ede/proj-prog)
(require 'ede/proj-scheme)
(require 'ede/proj-shared)

(require 'ede/autoconf-edit)

;; configure auto-complete
(add-to-list 'load-path "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)

;; configure slime autocomplete
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;; configure/enable cedet stuff that is bundled with emacs
(global-ede-mode 1)
(semantic-mode 1)
(global-semantic-idle-completions-mode 1)

;; configure slime
(setq slime-contribs '(slime-fancy))
(setq inferior-lisp-program "sbcl")

;; attempt to add project
(ede-cpp-root-project "vest_charger" :file "/media/sf_vm_share/microchip/harmony/v1_08_01/read_me.txt")

;; set tabs
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil)

;; force redraw
(add-hook 'isearch-update-post-hook 'redraw-display)

;; add cscope
(require 'xcscope)
(cscope-setup)

;; add exuberant ctags
(setq path-to-ctags "/usr/bin/ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
)

;; add function-args
(add-to-list 'load-path "~/.emacs.d/function-args")
(require 'function-args)
(fa-config-default)

(load-theme 'solarized-dark t)

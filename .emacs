(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Custom-safe-themes (quote ("fb4bf07618eab33c89d72ddc238d3c30918a501cf7f086f2edf8f4edba9bd59f" default)))
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Loading the cedet file
(load-file "~/development/cedet/cedet-devel-load.el")


;; This allows me to properly include packages, for some reason it won't work properly without this
(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)


;; ===== AESTHETIC SETUP =====
;; Turning on the monokai Theme
;(load-theme 'monokai t)
;; Turning on solarized theme
(require 'color-theme)
(color-theme-solarized-dark)
;; Turning off the menubar (File, Edit, etc)
(menu-bar-mode -1)
;; Turning off the toolbar (The icon bar with newfile, open, etc..)
(tool-bar-mode -1)
;; Turning on line-numbers
(global-linum-mode t)
;; ========================================

;; ===== Adding keybinds for moving 5 lines up/down =====
(global-set-key (kbd "M-n")
				(lambda  () (interactive) (next-line 5)))
(global-set-key (kbd "M-p")
				(lambda  () (interactive) (next-line -5)))
; Stopping the ctrl-z behaviour
(global-set-key "\C-Z" nil)
;; ========================================
;; ===== Moving backup files =====
;; Moving them to the temporary-file-directory so that file systems remain clean
 (setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))
;; ========================================

;; ===== Turning on Interactive Do mode =====
(require 'ido)
(ido-mode t)
;; turning on flex matching
(setq ido-enable-flex-matching t)

;; Making ~ send you straight to the home directory
;; Taken from http://whattheemacsd.com/setup-ido.el-02.html
(add-hook 'ido-setup-hook
 (lambda ()
   ;; Go straight home
   (define-key ido-file-completion-map
     (kbd "~")
     (lambda ()
       (interactive)
       (if (looking-back "/")
           (insert "~/")
         (call-interactively 'self-insert-command))))))
;; ========================================

;; ===== Turning on find in project (NOT WORKING RIGHT NOW)
;(add-to-list 'load-path "~/.emacs.d/find-file-in-project") (autoload 'find-file-in-project "find-file-in-project" "Find file in project." t)
;(global-set-key [(control x) (meta f)] 'find-file-in-project)
;; ========================================

;; ===== Initializing Recent File Search =====
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 50)
(global-set-key [(control x) (control r)] 'recentf-open-files)
;; ========================================

;; ===== Turning on evil-mode =====
;(require 'evil)
;(evil-mode 1)
;; ========================================

;; ===== Turning on delete selection mode =====
(delete-selection-mode t)
;; ========================================

;; ===== Setting up ERC =====
(require 'erc)
;; ========================================

;; ===== Turning on icicles =====
;; (require 'icicles)
;; (icy-mode 1)
;; ========================================

;; ===== Turning off flymake mode, it throws errors when reloading a file =====
(flymake-mode -1)
;; ========================================

;; ===== Turning on company backend with omnisharp =====
(require 'company)
;; ========================================

;; ===== Setting up javascript environment =====

(defun my-javascrip-mode-fn ()
  (auto-complete-mode 1)
)
; Adding the function we just made to the javascript-mode-hook
; This will then call this function whenever loading javascript-mode
(add-hook  'javascript-mode-hook 'my-javascript-mode-fn t)
;; ========================================

;; ========================================


;; =====  Modifying my csharp-mode to have proper indentation =====
(require 'csharp-mode)
; Starting csharp-mode whenever we open a file that matches *.cs
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
; Defining a function to add to the hook

(defun my-csharp-mode-fn ()
  "function that runs when csharp-mode is initialized for a buffer."
  (setq default-tab-width 4)
  ; Set indentation level to 4 spaces (instead of 2)
  (setq c-basic-offset 4)
  ; Set the extra indentation before a substatement (e.g. the opening brace in
  ; the consequent block of an if statement) to 0 (instead of '+)
  (c-set-offset 'substatement-open 0)
  ; Set the auto-pair for "{" to okey electric-brace options
  (local-set-key (kbd "{") 'c-electric-brace)
  ; Turning on Omnisharp mode
  (omnisharp-mode 1)
  ; Turning on Imenu Integration
  (omnisharp-imenu-support 1)
  ; Turning on YAS
  (yas-global-mode 1)
  ; Turning on Company mode
  (eval-after-load 'company
	'(add-to-list 'company-backends 'company-omnisharp))
  (company-mode 1)
  
  )

; Adding the function we just made to the csharp-mode-hook
; This will then call this function whenever loading csharp-mode is started
(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)
;; ========================================


;; ===== Setting up omnisharp hotkeys =====
(global-set-key [(control x) (control /)] 'omnisharp-go-to-definition)
;; ========================================

;; ===== Turning on Windmove =====
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;; ========================================


;; ===== Starting the OmniSharpServer and pointing it to the casino_mobile solution =====
;; This will need to be changed to point to whatever solution I am working on at the time

(setq omnisharp_exe "~/Downloads/emacs_stuff/OmniSharpServer/OmniSharp/bin/Debug/OmniSharp.exe")
(setq casino_mobile_solution "~/Repos/casino_mobile/Unity/Unity-csharp.sln")
(setq omnisharp_start  (concatenate 'string "mono " omnisharp_exe " -s " casino_mobile_solution))
; DISABLING BECAUSE IT KEEPS CRASHING MY EMACS :( 
;(start-process-shell-command "omnisharp" "omnisharp_buffer" omnisharp_start) 
;; ========================================


;; ===== Rotate Windows =====
;; this rotates your windows, allowing the contents of a larger window
;; to be swapped around. This is good for my normal setup of having half the screen as a tall window
;; that I work in constantly, and the other half split again for reference files.
;; Taken from http://whattheemacsd.com/buffer-defuns.el-02.html
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
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

;; Binding rotate-windows to ( C-X up )
(global-set-key [(control x) up] 'rotate-windows)

;; ========================================

;; ===== Configration for cedet =====

(custom-set-variables
 '(semantic-default-submodes (quote (global-semantic-idle-completions-mode global-semantic-idle-scheduler-mode global-semanticdb-minor-mode global-semantic-idle-summary-mode global-semantic-mru-bookmark-mode)))
 '(semantic-idle-scheduler-idle-time 10)
 ;; '(semanticdb-javap-classpath (quote ("/usr/lib/jvm/jdk1.6.0_37/jre/lib/rt.jar")))     
 '(semanticdb-javap-classpath (quote ("/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Classes/classes.jar")))
 )

;; 1. enable it
(semantic-mode 1)
(global-semanticdb-minor-mode 1)

;; 2. use ede to manage project
(global-ede-mode t)

(ede-java-root-project "heroin_lab"
					   :file "~/development/heroin_lab/build.xml"
					   :srcroot '("src")
;;								  "../third-party/library/src")
;;					   :localclasspath '("libs/third.party.jar")
					   :classpath '("~/development/sdk/platforms/android-18/android.jar"))

;; 3. enable db-javap
(require 'semantic/db-javap)

;; 4. enable auto-complete
(require 'semantic/ia)
(defun my-cedet-hook ()
  ;; functions which are disabled
  ;; (local-set-key "\C-cp" 'semantic-ia-show-summary)
  ;; (local-set-key "\C-cl" 'semantic-ia-show-doc)
  ;; (local-set-key "." 'semantic-complete-self-insert)
  ;; (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\M-n" 'semantic-ia-complete-symbol-menu)  ;; auto ompletet by menu
  (local-set-key "\C-c/" 'semantic-ia-complete-symbol)
  (local-set-key "\C-cb" 'semantic-mrub-switch-tags)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cR" 'semantic-symref)
  (local-set-key "\C-cr" 'semantic-symref-symbol) 
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)

;; 5. use four spaces to indent java source
(defun my-java-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  )
(add-hook 'java-mode-hook 'my-java-mode-hook)

;; ========================================

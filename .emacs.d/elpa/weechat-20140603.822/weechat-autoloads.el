;;; weechat-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (weechat-connect) "weechat" "weechat.el" (21391
;;;;;;  33263 0 0))
;;; Generated autoloads from weechat.el

(autoload 'weechat-connect "weechat" "\
Connect to WeeChat.

HOST is the relay host, `weechat-host-default' by default.
PORT is the port where the relay listens, `weechat-port-default' by default.
PASSWORD is either a string, a function or nil.
MODE is null or 'plain for a plain socket, t or 'ssl for a TLS socket;
a string denotes a command to run.  You can use %h and %p to interpolate host
and port number respectively.

\(fn &optional HOST PORT PASSWORD MODE FORCE-DISCONNECT)" t nil)

;;;***

;;;### (autoloads nil nil ("weechat-button.el" "weechat-cmd.el" "weechat-color.el"
;;;;;;  "weechat-complete.el" "weechat-core.el" "weechat-corrector.el"
;;;;;;  "weechat-image.el" "weechat-latex.el" "weechat-notifications.el"
;;;;;;  "weechat-pkg.el" "weechat-relay.el" "weechat-sauron.el" "weechat-secrets.el"
;;;;;;  "weechat-smiley.el" "weechat-speedbar.el" "weechat-spelling.el"
;;;;;;  "weechat-tracking.el") (21391 33263 557203 0))

;;;***

(provide 'weechat-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; weechat-autoloads.el ends here

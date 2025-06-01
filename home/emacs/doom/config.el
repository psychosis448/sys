;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; User
(setq user-full-name "psychosis448")

;; Theme
(load-theme 'modus-vivendi t)

;; Font
(setq doom-font (font-spec :family nil :size 20))

;; Text Display
(setq display-line-numbers-type 'relative)
(setopt global-display-fill-column-indicator-mode t)
(setopt global-display-fill-column-indicator-column 80)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(add-hook 'text-mode-hook #'visual-fill-column-mode)

;; Projectile
(setq projectile-project-search-path '("~/projects/"))

;; Org & Org-Roam Directories
(setq org-directory "~")
(setq org-roam-directory org-directory)

(after! org
  :config
  (setq org-log-done 'time)
  ;; https://github.com/doomemacs/doomemacs/blob/master/modules/lang/org/config.el#L40C10-L40C31
  (setq +org-capture-todo-file "TODO.org")
  (setq +org-capture-notes-file "inbox/notes.org")
  (setq +org-capture-journal-file "inbox/inbox.org")
 (setq org-todo-keywords
        '((sequence
           "PROJ(p)"  ; A project, which usually contains other tasks
           "LOOP(r)"  ; A recurring task
           "TODO(t)"  ; A task that needs doing & is ready to do
           "STRT(s!)"  ; A task that is in progress
           "WAIT(w@/!)"  ; Something external is holding up this task
           "HOLD(h@/!)"  ; This task is paused/on hold because of me
           "IDEA(i@)"  ; An unconfirmed and unapproved task or notion
           "|"
           "DONE(d!)"  ; Task successfully completed
           "KILL(k@/!)") ; Task was cancelled, aborted, or is no longer applicable
          )
        org-todo-keyword-faces
        '(("STRT" . +org-todo-active)
          ("WAIT" . +org-todo-onhold)
          ("HOLD" . +org-todo-onhold)
          ("PROJ" . +org-todo-project)
          ("KILL" . +org-todo-cancel)))
  )

(after! org-roam
  :config
  (setq org-roam-dailies-directory "inbox")
  ;; https://github.com/org-roam/org-roam/blob/main/org-roam-capture.el
  (setopt org-roam-capture-templates
          '(("d" "default" plain "%?"
             :target (file+head "${slug}.org"
                                "#+title: ${title}\n")
             :unnarrowed t)

            ("l" "literature" plain "%?"
             :target (file+head "%^{author}%^{year}-%^{title}.org"
                                "#+title: ${title}\n#+filetags: literature")
             :unnarrowed t)
            )
          )
  )

(require 'autothemer)

(autothemer-deftheme
 acid "A theme to set on Acid"

 ((((class color) (min-colors #xFFFFFF))) ;; We're only concerned with graphical Emacs

  ;; Define our color palette
  (acid-black      "#0c1018")
  (acid-pure-black "#000000")
  (acid-white      "#ffffff")
  (acid-orange     "#ffa100")
  (acid-dk-orange  "#eb6123")
  (acid-string     "#c1ffc1")
  (acid-button     "#98fb98")
  (acid-default    "#737373")
  (acid-comment    "#404040")
  (acid-green      "#B6FD51")
  (acid-light      "#98fb98"))

 ;; Customize faces
 ((default                      (:foreground acid-default :background acid-black))
  (cursor                       (:background acid-white))
  (mode-line                    (:background acid-black))
  (region                       (:background acid-comment))
  (button                       (:foreground acid-button))
  (org-level-1                  (:foreground acid-green))
  (org-level-2                  (:foreground acid-light))
  (org-level-3                  (:foreground acid-default))
  (font-lock-keyword-face       (:foreground acid-green))
  (highlight                    (:foreground acid-black :background acid-light))
  (font-lock-string-face        (:foreground acid-string))
  (font-lock-function-name-face (:foreground acid-white))
  (swiper-line-face             (:background acid-light :foreground acid-pure-black))
  (swiper-match-face-2          (:background acid-green :foreground acid-black))
  (ivy-current-match            (:background acid-light :foreground acid-black))
  (ivy-minibuffer-match-face-2  (:background acid-black :foreground acid-white))
  (ivy-match-highlight-face     (:background acid-black))
  (mode-line-inactive           (:background acid-black))
  (font-lock-variable-name-face (:foreground acid-green))
  (company-tooltip-selection    (:background acid-light :foreground acid-black))
  (company-tooltip-common-selection (:background acid-light :foreground acid-black))
  (lsp-face-highlight-read (:foreground acid-green))
  (font-lock-builtin-face       (:foreground acid-white))
  (lazy-highlight               (:background acid-white))
  (font-lock-comment-face       (:foreground acid-comment))
  (internal-border              (:background acid-black :foreground acid-black))
  (border                       (:background acid-black :foreground acid-black))
  (line-number-current-line     (:foreground acid-light))
  (beacon-fallback-background   (:background acid-light))
  (vertical-border              (:background acid-black :foreground acid-black))
  (font-lock-type-face          (:foreground acid-white))))



(provide-theme 'acid)

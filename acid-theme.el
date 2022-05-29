(require 'autothemer)

(autothemer-deftheme
 acid "A theme to set on Acid"

 ((((class color) (min-colors #xFFFFFF))) ;; We're only concerned with graphical Emacs

  ;; Define our color palette
  (acid-black              "#0c1018")
  (acid-pure-black         "#000000")
  (acid-white              "#ffffff")
  (acid-orange             "#ffa100")
  (acid-dk-orange          "#eb6123")
  (acid-string             "#c1ffc1")
  (acid-button             "#98fb98")
  (acid-default            "#737373")
  (acid-comment            "#404040")
  (rainbow-delimiters-1    "LightSeaGreen")
  (rainbow-delimiters-2    "PaleGreen1")
  (rainbow-delimiters-3    "#ffffff")
  (rainbow-delimiters-4    "#404040")
  (rainbow-delimiters-5    "PaleGreen1")
  (acid-green              "#B6FD51")
  (acid-light              "#98fb98"))

 ;; Customize faces
 ((default                      (:foreground acid-default :background acid-black))
  (cursor                       (:background acid-white))
  (mode-line                    (:background acid-black))
  (lsp-face-highlight-textual   (:background acid-light))
  (lsp-face-highlight-write     (:background acid-light))
  (separator-line               (:background acid-black :foreground acid-black))
  (window-divider               (:background acid-black :foreground acid-black))
  (window-divider-first-pixel   (:background acid-black :foreground acid-black))
  (window-divider-last-pixel    (:background acid-black :foreground acid-black))
  (transient-separator          (:foreground acid-black)) ;
  (window-divider               (:background acid-black))
  (shadow                       (:background acid-black :foreground acid-comment))
  (region                       (:background acid-comment))
  (button                       (:foreground acid-button))

  (org-level-1                  (:foreground acid-green))
  (org-level-2                  (:foreground acid-light))
  (org-level-3                  (:foreground acid-default))

  (rainbow-delimiters-depth-1-face           (:foreground rainbow-delimiters-1))
  (rainbow-delimiters-depth-2-face           (:foreground rainbow-delimiters-3))
  (rainbow-delimiters-depth-3-face           (:foreground rainbow-delimiters-2))
  (rainbow-delimiters-depth-4-face           (:foreground rainbow-delimiters-5))
  (rainbow-delimiters-depth-5-face           (:foreground rainbow-delimiters-4))


  
  (font-lock-keyword-face       (:foreground acid-green))
  (font-lock-builtin-face       (:foreground acid-white))
  (font-lock-string-face        (:foreground acid-string))
  (font-lock-function-name-face (:foreground acid-white))
  (font-lock-variable-name-face (:foreground acid-green))
  (font-lock-comment-face       (:foreground acid-comment))
  (font-lock-type-face          (:foreground acid-white))


  (flycheck-fringe-info      (:foreground acid-green))
  (flycheck-fringe-error      (:foreground acid-green))
 
  (swiper-line-face                 (:background acid-light :foreground acid-pure-black))
  (swiper-match-face-2              (:background acid-green :foreground acid-black))
  (ivy-current-match                (:background acid-light :foreground acid-black))
  (ivy-minibuffer-match-face-2      (:background acid-black :foreground acid-white))
  (ivy-match-highlight-face         (:background acid-black))
  (mode-line-inactive               (:background acid-black))
  (company-tooltip-selection        (:background acid-light :foreground acid-black))
  (company-tooltip-common-selection (:background acid-light :foreground acid-black))
  (lsp-face-highlight-read          (:foreground acid-green))
  (lazy-highlight                   (:background acid-white))
  (internal-border                  (:background acid-black :foreground acid-black))
  (border                           (:background acid-black :foreground acid-black))
  (line-number-current-line         (:foreground acid-light))
  (beacon-fallback-background       (:background acid-light))
  (vertical-border                  (:background acid-black :foreground acid-black))))



(provide-theme 'acid)

(require 'autothemer)

(autothemer-deftheme
 acid "A theme to set on Acid"

 ((((class color) (min-colors #xFFFFFF))) ;; We're only concerned with graphical Emacs

  ;; Define our color palette
  (acid-black      "#0c1018")
  (acid-pure-black "#000000")
  (acid-white      "#ffffff")
  (acid-orange     "orange1")
  (acid-dk-orange  "#eb6123")
  (acid-string     "DarkSeaGreen1")
  (acid-button     "PaleGreen")
  (acid-default    "grey45")
  (acid-comment    "grey25")
  (acid-green      "#B6FD51"))

 ;; Customize faces
 ((default                      (:foreground acid-default :background acid-black))
  (cursor                       (:background acid-white))
  (mode-line                    (:background acid-black))
  (region                       (:background acid-comment))
  (button                       (:foreground acid-button))
  (font-lock-keyword-face       (:foreground acid-green))
  (font-lock-string-face        (:foreground acid-string))
  (font-lock-function-name-face (:foreground acid-white))
  (swiper-line-face             (:background acid-default))
  (ivy-current-match            (:background acid-comment))
  (mode-line-inactive           (:background acid-black))
  (font-lock-variable-name-face (:foreground acid-green))
  (font-lock-builtin-face       (:foreground acid-white))
  (font-lock-comment-face       (:foreground acid-comment))
  (font-lock-type-face          (:foreground acid-white))))


(provide-theme 'acid)

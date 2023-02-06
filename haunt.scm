(use-modules (haunt asset)
             (haunt site)
             (haunt builder blog)
             (haunt builder atom)
             (haunt reader skribe))

(site #:title "Athena CPU"
      #:domain "example.com"
      #:default-metadata
      '((author . "d0p1")
        (email  . "eva@example.com"))
      #:readers (list skribe-reader)
      #:builders (list (blog)
                       (atom-feed)
                       (atom-feeds-by-tag)))
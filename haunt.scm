(use-modules (haunt asset)
             (haunt site)
	     (haunt html)
	     (haunt page)
	     (haunt reader)
	     (haunt builder assets)
             (haunt builder blog)
             (haunt builder atom)
             (haunt reader skribe))

(define (default-layout site title body)
  `((doctype "html")
    (html (@ (lang "en"))
	  (head
	   (meta (@ (charset "utf-8")))
	   (meta (@ (name "viewport") (content "width=device-width,initial-scale=1")))
	   (title ,(string-append title " - " (site-title site))))
	  (body
	   ,body))))

(define default-theme
  (theme #:name "Default"
	 #:layout default-layout))

(site #:title "Athena CPU"
      #:domain "athena.d0p1.eu"
      #:default-metadata
      '((author . "d0p1")
        (email  . "web@athena.d0p1.eu"))
      #:readers (list skribe-reader)
      #:builders (list (blog #:theme default-theme)
		       (static-directory "assets")
                       (atom-feed)
                       (atom-feeds-by-tag)))

;; -*- scheme -*-
(set! *navbar-links*
      '(("about" . "/about/")
        ("cat pictures" . "/cat-pictures/")))
(set! *navbar-infix* " | ")
(set! *public-path-base* '())
(set! *private-host* "127.0.0.1")
(set! *private-port* 8080)
(set! *private-path-base* '())

(set! *cache-key-headers* '(host x-forwarded-proto))

(set! request->public-scheme schema-from-forwarded-proto)
(set! request->public-host host-from-host)
(set! request->public-port port-from-host)

(define *admin-pass* "password")
(define *title* "kittens")
(define *subtitle* "all about kittens")
(define *name* "Jane Doe")


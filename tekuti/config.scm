;; Tekuti
;; Copyright (C) 2008, 2010, 2012, 2014 Andy Wingo <wingo at pobox dot com>

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3 of
;; the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, contact:
;;
;; Free Software Foundation           Voice:  +1-617-542-5942
;; 59 Temple Place - Suite 330        Fax:    +1-617-542-2652
;; Boston, MA  02111-1307,  USA       gnu@gnu.org

;;; Commentary:
;;
;; This is the main script that will launch tekuti.
;;
;;; Code:

(define-module (tekuti config)
  #:use-module (tekuti util)
  #:use-module ((sxml ssax) #:select (define-parsed-entity!))
  #:use-module (web request)
  #:export (request->public-scheme request->public-host
            request->public-port *public-path-base*
            *private-host* *private-port* *private-path-base*
            *git-dir* *git* *debug* *admin-user* *admin-pass*
            *css-file* *navbar-links* *navbar-infix*
            *title* *subtitle* *name* *html-head*
            *server-impl* *server-impl-args* *post-limit*
            *cache-key-headers*))

(define request->public-scheme
  (constantly 'http))
(define request->public-host
  (constantly "127.0.0.1"))
(define request->public-port
  (constantly 8080))

(define (host-from-host request)
  (let ((h (assq-ref (request-headers request) 'host)))
    (cond
     ((pair? h) (car h))
     ((string? h) h)
     (else "misconfigured.invalid"))))

(define (port-from-host request)
  (and=> (assq-ref (request-headers request) 'host)
         (lambda (h)
           (and (pair? h) (cdr h)))))

(define (schema-from-forwarded-proto request)
   (if (and=> (assq-ref (request-headers request) 'x-forwarded-proto)
              (lambda (s)
                (and (string? s) (string-ci=? "https" s))))
       'https
       'http))

(define *public-path-base* '())

(define *private-host* "127.0.0.1")
(define *private-port* 8080)
(define *private-path-base* '())

(define *git-dir* "~/blog.git")
(define *git* "git")
(define *css-file* "/base.css")
(define *navbar-links* '())
(define *navbar-infix* " ")
(define *debug* #t)
(define *admin-user* "admin")
(define *admin-pass* "admin")
(define *title* "My blog")
(define *subtitle* "Just a blog, ok")
(define *name* "Joe Schmo")

(define *server-impl* 'http)
(define *server-impl-args*
  (lambda () `(#:host ,*private-host* #:port ,*private-port*)))

(define *post-limit* -1)

(define *cache-key-headers '())

(define *html-head*
  `((meta (@ (name "Generator")
             (content "An unholy concoction of parenthetical guile")))
    (meta (@ (name "viewport") (content "width=device-width")))
    (link (@ (rel "stylesheet")
             (type "text/css")
             (media "screen")
             (href ,*css-file*)))))


(define-parsed-entity! 'agrave 224)
(define-parsed-entity! 'laquo 171)
(define-parsed-entity! 'mdash 8212)
(define-parsed-entity! 'nbsp 160)
(define-parsed-entity! 'raquo 187)
(define-parsed-entity! 'uacute 250)

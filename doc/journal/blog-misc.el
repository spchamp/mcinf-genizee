;; blog-misc.el - utility functions for Trudy journal

;; License: public domain

(eval-when-compile
  (require 'cl))


(defun* timestamp-string (time)
  ;; timestamp format is compatible with ISO 8601 basic format
  ;; but is not syntactically compatible with XML Schema Datatypes
  ;; see also:
  ;; <http://en.wikipedia.org.advanc.io/wiki/ISO_8601>
  ;; <http://www.w3.org/TR/xmlschema-2/#dateTime>
  (interactive (list nil))
  (let ((str
         (format-time-string "%Y%m%dT%H%M%SZ" time t)))
    (cond
     ((interactive-p)
      (with-temp-buffer
        (insert str)
        (kill-region (point-min) (point-max)))
      (message "Copied timestamp %S" str))
     (t str))))

;; (timestamp-string)

;;; packages.el --- coq layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: gbrik <gbrik@gbrik-lin>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `coq-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `coq/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `coq/pre-init-PACKAGE' and/or
;;   `coq/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst coq-packages
  '(company-coq
    (proof-general :location local))
  "The list of Lisp packages required by the coq layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun coq/init-company-coq ()
  "Enter company-coq-mode upon entering coq-mode."
  (use-package company-coq
    :defer t
    :init
    (add-hook 'coq-mode-hook #'company-coq-mode)))
(defun coq/init-proof-general ()
  "Initialize Proof General."
  ;; Setup from Proof General README, using a path from the configuration. Proof General
  ;; lazily loads from proof-site, so there's no need to use-package it.
  (load proof-general-path)
  (spacemacs/set-leader-keys-for-major-mode 'coq-mode
    "]" 'proof-assert-next-command-interactive
    "[" 'proof-undo-last-successful-command
    "." 'proof-goto-point
    "d" 'company-coq-jump-to-definition
    "l" 'company-coq-lemma-from-goal))

;;; packages.el ends here

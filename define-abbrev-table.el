(define-abbrev-table 'global-abbrev-table '(
    ("alpha" "α")
    ("beta" "β")
    ("gamma" "γ")
    ("delta" "δ")
    ("epsilon" "ε")
    ("zeta" "ζ")
    ("theta" "θ")
    ("eta" "η")
    ("iota" "ι")
    ("kappa" "κ")
    ("lambda" "λ")
    ("mu" "μ")
    ("nu" "ν")
    ("xi" "ξ")
    ("omicron" "ο")
    ("pi" "π")
    ("rho" "ρ")
    ("sigma" "σ")
    ("sigmafinal" "ς")
    ("tau" "τ")
    ("upsilon" "υ")
    ("phi" "φ")
    ("chi" "χ")
    ("psi" "ψ")
    ("omega" "ω")
    ("Gamma" "Γ")
    ("Delta" "Δ")
    ("Theta" "Θ")
    ("Lambda" "Λ")
    ("Xi" "Ξ")
    ("Pi" "Π")
    ("Sigma" "Σ")
    ("Upsilon" "Υ")
    ("Phi" "Φ")
    ("Chi" "Χ")
    ("Psi" "Ψ")
    ("Omega" "Ω")

    ("forAll" "∀")      ; Unicode 2000: "for all"
    ("thereExists" "∃")  ; Unicode 2203: "there exists"
    ("logicalAnd" "∧")   ; Unicode 2227
    ("logicalOr" "∨")    ; Unicode 2228
    ("intersection" "∩")  ; Unicode 2229
    ("union" "∪")     ; Unicode 222A
    ("therefore" "∴")  ; Unicode 2234
    ("integral" "∫")  ; Unicode 222B
    ("partialDifferential" "∂")  ; Unicode 2202
    ("squareRoot" "√")  ; Unicode 221A
    ("elementOf" "∈")   ; Unicode 2208
    ("subsetOf" "⊂")   ; Unicode 2282
    ("supersetOf" "⊃")   ; Unicode 2283
    ("proportionalTo" "∝")   ; Unicode 221D
    ("notEqual" "≠")     ; Unicode 2260: "not equal to"
    ("asymptotic" "≃")  ; Unicode 2243: "asymptotically equal to"
    ("almostEqual" "≈") ; Unicode 2248: "almost equal to"
    ("checkmark" "✓")   ; Unicode 2713
    ("infinity" "∞")     ; Unicode 221E
    ("plusorminus" "±")  ; Unicode 2213
    ("isomorphic" "≅")  ; Unicode 2245: "isomorphic" or "congruent"
    ("perMille" "‰")   ; Unicode 2030
    ("perTenThousand" "‱")   ; Unicode 2031: basis point
    ("bowtie" "⋈")    ; Unicode 22C8

    ("leftArrow" "←")   ; Unicode 2190
    ("upArrow" "↑")      ; Unicode 2191
    ("rightArrow" "→")  ; Unicode 2192
    ("downArrow" "↓")   ; Unicode 2193
    ("leftRightArrow" "↔")   ; Unicode 2194
    ("upDownArrow" "↕")   ; Unicode 2195
    ("NWArrow" "↖")   ; Unicode 2196
    ("NEArrow" "↗")   ; Unicode 2197
    ("SEArrow" "↘")   ; Unicode 2198
    ("SWArrow" "↙")   ; Unicode 2199
    ("upleftArrow" "↰")   ; Unicode 21B0
    ("uprightArrow" "↱")   ; Unicode 21B1
    ("downleftArrow" "↲")   ; Unicode 21B2
    ("downrightArrow" "↳")   ; Unicode 21B3
    ("rightdownArrow" "↴")   ; Unicode 21B4
    ("downleftArrow2" "↵")   ; Unicode 21B5
    ("leftDoubleArrow" "⇐")      ; Unicode 21D0
    ("upDoubleArrow" "⇑")    ; Unicode 21D1
    ("rightDoubleArrow" "⇒")    ; Unicode 21D2
    ("downDoubleArrow" "⇓")    ; Unicode 21D3
    ("boxHorizontal" "━")     ; Unicode 2501
    ("boxVertical" "┃")     ; Unicode 2503
    ("boxUpperleftCorner" "┏")     ; Unicode 250F
    ("boxUpperrightCorner" "┓")     ; Unicode 2513
    ("boxLowerleftCorner" "┗")     ; Unicode 2517
    ("boxLowerrightCorner" "┛")     ; Unicode 251B
    ("boxLeftTee" "┣")     ; Unicode 2523
    ("boxRightTee" "┫")     ; Unicode 252B
    ("boxUpTee" "┳")     ; Unicode 2533
    ("boxDownTee" "┻")     ; Unicode 253B
    ("openDquotes" "“")    ; Unicode 201C
    ("closeDquotes" "”")    ; Unicode 201D
    ("1/2" "½")    ; Unicode 00BD
    ("1/3" "⅓")    ; Unicode 2153
    ("1/4" "¼")    ; Unicode 00BC
    ("1/5" "⅕")    ; Unicode 2155                       
    ("cents" "¢" nil 0)       ; Unicode 00A2
    ("dollars" "$" nil 0)     ; Unicode 0024
    ("euro" "€" nil 0)        ; Unicode 20AC
    ("GBP" "£" nil 0)         ; Unicode 00A3
    ("ruble" "₽" nil 0)  ; Unicode 20BD
    ("yen" "¥" nil 0)    ; Unicode 00A5
    ))
;
(abbrev-mode 1) ; turn on abbrev mode

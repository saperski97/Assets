SELECT Data, Kategoria, Wartosc
FROM {{ ref('fct_wydatki_przychody') }}
UNION ALL 
SELECT Data, Kategoria, Wartosc
FROM {{ ref('fct_wydatki_przychody_archive') }}
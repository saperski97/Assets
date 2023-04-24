WITH pivoted_data AS (
    SELECT 
        DATE(
            CAST(REPLACE(SPLIT(Data,' ')[offset(1)],"'",'') AS INT)+2000,
            CAST(CASE SPLIT(Data,' ')[offset(0)]
                WHEN 'STYCZEŃ' THEN 1
                WHEN 'LUTY' THEN 2
                WHEN 'MARZEC' THEN 3
                WHEN 'KWIECIEŃ' THEN 4
                WHEN 'MAJ' THEN 5
                WHEN 'CZERWIEC' THEN 6
                WHEN 'LIPIEC' THEN 7
                WHEN 'SIERPIEŃ' THEN 8
                WHEN 'WRZESIEŃ' THEN 9
                WHEN 'PAŹDZIERNIK' THEN 10
                WHEN 'LISTOPAD' THEN 11
                WHEN 'GRUDZIEŃ' THEN 12
                END
                AS INT),
            1
        ) AS Data,
        CAST(REPLACE(Jedzenie,',','.') AS FLOAT64) AS Jedzenie,
        CAST(REPLACE(Transport,',','.') AS FLOAT64) AS Transport,
        CAST(REPLACE(Czynsz,',','.') AS FLOAT64) AS Czynsz,
        CAST(REPLACE(Wyjscia,',','.') AS FLOAT64) AS Wyjscia,
        CAST(REPLACE(ArtDomowe,',','.') AS FLOAT64) AS Chemia_i_art_domowe,
        CAST(REPLACE(Alkohol,',','.') AS FLOAT64) AS Alkohol,
        CAST(REPLACE(Kosmetyki,',','.') AS FLOAT64) AS Kosmetyki,
        CAST(REPLACE(Nauka,',','.') AS FLOAT64) AS Nauka,
        CAST(REPLACE(Wyjazdy,',','.') AS FLOAT64) AS Wyjazdy,
        CAST(REPLACE(Prezenty,',','.') AS FLOAT64) AS Prezenty,
        CAST(REPLACE(Ubrania,',','.') AS FLOAT64) AS Ubrania_i_obuwie,
        CAST(REPLACE(Ksiazki,',','.') AS FLOAT64) AS Ksiazki,
        CAST(REPLACE(Zdrowie,',','.') AS FLOAT64) AS Zdrowie,
        CAST(REPLACE(Pozostale,',','.') AS FLOAT64) AS Pozostale,
        CAST(REPLACE(WystrojMieszkania,',','.') AS FLOAT64) AS Wystroj_mieszkania,
        CAST(REPLACE(Abonamenty,',','.') AS FLOAT64) AS Abonamenty,
        CAST(REPLACE(Kredyt,',','.') AS FLOAT64) AS Kredyt,
        CAST(REPLACE(Rozliczenia,',','.') AS FLOAT64) AS Rozliczenia,
        CAST(REPLACE(Wydatki,',','.') AS FLOAT64) AS Wydatki, 
        CAST(REPLACE(Przychody,',','.') AS FLOAT64) AS Przychody,
        CAST(REPLACE(Bilans,',','.') AS FLOAT64) AS Bilans
    FROM {{ ref('stg_wydatki_przychody_archive') }})

SELECT Data, Kategoria, SUM(Wartosc) AS Wartosc
FROM pivoted_data
UNPIVOT (Wartosc FOR Kategoria IN (Jedzenie,Transport,Czynsz,Wyjscia,Chemia_i_art_domowe,
                                    Alkohol,Kosmetyki,Nauka,Wyjazdy,Prezenty,
                                    Ubrania_i_obuwie,Ksiazki,Zdrowie,Pozostale,Wystroj_mieszkania,
                                    Abonamenty,Kredyt,Rozliczenia,Wydatki,Przychody,Bilans))
GROUP BY Data, Kategoria

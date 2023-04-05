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
        CAST(REPLACE(Jedzenie,',','.') AS NUMERIC) AS Jedzenie,
        CAST(REPLACE(Transport,',','.') AS NUMERIC) AS Transport,
        CAST(REPLACE(Czynsz,',','.') AS NUMERIC) AS Czynsz,
        CAST(REPLACE(Wyjscia,',','.') AS NUMERIC) AS Wyjscia,
        CAST(REPLACE(ArtDomowe,',','.') AS NUMERIC) AS ArtDomowe,
        CAST(REPLACE(Alkohol,',','.') AS NUMERIC) AS Alkohol,
        CAST(REPLACE(Kosmetyki,',','.') AS NUMERIC) AS Kosmetyki,
        CAST(REPLACE(Nauka,',','.') AS NUMERIC) AS Nauka,
        CAST(REPLACE(Wyjazdy,',','.') AS NUMERIC) AS Wyjazdy,
        CAST(REPLACE(Prezenty,',','.') AS NUMERIC) AS Prezenty,
        CAST(REPLACE(Ubrania,',','.') AS NUMERIC) AS Ubrania,
        CAST(REPLACE(Ksiazki,',','.') AS NUMERIC) AS Ksiazki,
        CAST(REPLACE(Zdrowie,',','.') AS NUMERIC) AS Zdrowie,
        CAST(REPLACE(Pozostale,',','.') AS NUMERIC) AS Pozostale,
        CAST(REPLACE(WystrojMieszkania,',','.') AS NUMERIC) AS WystrojMieszkania,
        CAST(REPLACE(Abonamenty,',','.') AS NUMERIC) AS Abonamenty,
        CAST(REPLACE(Kredyt,',','.') AS NUMERIC) AS Kredyt,
        CAST(REPLACE(Rozliczenia,',','.') AS NUMERIC) AS Rozliczenia,
        CAST(REPLACE(Wydatki,',','.') AS NUMERIC) AS Wydatki, 
        CAST(REPLACE(Przychody,',','.') AS NUMERIC) AS Przychody,
        CAST(REPLACE(Bilans,',','.') AS NUMERIC) AS Bilans
    FROM {{ ref('stg_wydatki_przychody_archive') }})

SELECT Data, Kategoria, SUM(Wartosc) AS Wartosc
FROM pivoted_data
UNPIVOT (Wartosc FOR Kategoria IN (Jedzenie,Transport,Czynsz,Wyjscia,ArtDomowe,
                                    Alkohol,Kosmetyki,Nauka,Wyjazdy,Prezenty,
                                    Ubrania,Ksiazki,Zdrowie,Pozostale,WystrojMieszkania,
                                    Abonamenty,Kredyt,Rozliczenia,Wydatki,Przychody,Bilans))
GROUP BY Data, Kategoria

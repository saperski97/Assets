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
        CASE SPLIT(LTRIM(Jedzenie),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Jedzenie),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Jedzenie,
        CASE SPLIT(LTRIM(Alkohol),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Alkohol),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Alkohol,
        CASE SPLIT(LTRIM(Transport),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Transport),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Transport,
        CASE SPLIT(LTRIM(Czynsz),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Czynsz),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Czynsz,
        CASE SPLIT(LTRIM(Kredyt),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Kredyt),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Kredyt,
        CASE SPLIT(LTRIM(Wyjscia),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Wyjscia),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Wyjscia,
        CASE SPLIT(LTRIM(Wyjazdy),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Wyjazdy),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Wyjazdy,
        CASE SPLIT(LTRIM(Nauka),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Nauka),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Nauka,
        CASE SPLIT(LTRIM(Prezenty),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Prezenty),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Prezenty,
        CASE SPLIT(LTRIM(Chemia_i_art_domowe),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Chemia_i_art_domowe),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Chemia_i_art_domowe,
        CASE SPLIT(LTRIM(Kosmetyki),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Kosmetyki),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Kosmetyki,
        CASE SPLIT(LTRIM(Ksiazki),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Ksiazki),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Ksiazki,
        CASE SPLIT(LTRIM(Ubrania_i_obuwie),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Ubrania_i_obuwie),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Ubrania_i_obuwie,
        CASE SPLIT(LTRIM(Zdrowie),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Zdrowie),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Zdrowie,
        CASE SPLIT(LTRIM(Wesele),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Wesele),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Wesele,
        CASE SPLIT(LTRIM(Wystroj_mieszkania),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Wystroj_mieszkania),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Wystroj_mieszkania,
        CASE SPLIT(LTRIM(Pozostale),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Pozostale),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Pozostale,
        CASE SPLIT(LTRIM(Rozliczenia),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Rozliczenia),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Rozliczenia,
        CASE SPLIT(LTRIM(Wydatki),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Wydatki),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Wydatki,
        CASE SPLIT(LTRIM(Przychody),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Przychody),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Przychody,
        CASE SPLIT(LTRIM(Bilans),' ')[offset(0)]
            WHEN '-' THEN 0
            ELSE CAST(REPLACE(REPLACE(REPLACE(SPLIT(LTRIM(Bilans),' ')[offset(0)],',','.'),'(',''),')','') AS FLOAT64) END
        AS Bilans
    FROM {{ ref('stg_wydatki_przychody') }}
)

SELECT *
FROM pivoted_data
UNPIVOT (Wartosc FOR Kategoria IN (Jedzenie,Alkohol,Transport,Czynsz,Kredyt,
                                    Wyjscia,Wyjazdy,Nauka,Prezenty,Chemia_i_art_domowe,
                                    Kosmetyki,Ksiazki,Ubrania_i_obuwie,Zdrowie,Wesele,
                                    Wystroj_mieszkania,Pozostale,Rozliczenia,Wydatki,Przychody,Bilans))
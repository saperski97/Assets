SELECT
string_field_0 AS Data,
string_field_1 AS Jedzenie,
string_field_2 AS Alkohol,
string_field_3 AS Transport,
string_field_4 AS Czynsz,
string_field_5 AS Kredyt,
string_field_6 AS Wyjscia,
string_field_7 AS Wyjazdy,
string_field_8 AS Nauka,
string_field_9 AS Prezenty,
string_field_10 AS Chemia_i_art_domowe,
string_field_11 AS Kosmetyki,
string_field_12 AS Ksiazki,
string_field_13 AS Ubrania_i_obuwie,
string_field_14 AS Zdrowie,
string_field_15 AS Wesele,
string_field_16 AS Wystroj_mieszkania,
string_field_17 AS Pozostale,
string_field_18 AS Rozliczenia,
string_field_19 AS Wydatki,
string_field_20 AS Przychody,
string_field_21 AS Bilans
FROM `assets-382517.google_spreadsheet.wydatki_przychody_T`
WHERE string_field_0 LIKE"%'%"


# Fleet-Management-DB

Fleet-Management-DB/
├── schema/
│   ├── tables.sql          # Definicje tabel
│   ├── constraints.sql     # Klucze obce, unikalność itp.
├── data/
│   ├── insert_data.sql     # Przykładowe dane testowe
│   ├── triggers.sql        # Triggery do automatyzacji
|   |-- procedures.sql      #procedury
├── queries/
│   ├── reports.sql         # Zapytania do generowania raportów
│   ├── functions.sql       # Funkcje i procedury składowane
├── README.md               # Opis projektu, instrukcja uruchomienia


Wymagania:
- Rozbudowana funkcjonalność, w tym zaawansowane zapytania SQL (np. zapytania zagnieżdżone, widoki)
- Zastosowanie wyzwalaczy lub procedur/funkcji w języku proceduralnym właściwym dla wybranego SGBD
- Dobrze przygotowana dokumentacja techniczna z diagramami ERD i opisem implementacji

Schemat bazy zgodny z podstawowymi zasadami normalizacji (2NF) (to było na 3.0 ale no pasuje miec)


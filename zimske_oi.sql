--
-- File generated with SQLiteStudio v3.2.1 on Sat Dec 26 17:15:15 2020
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: disciplina
CREATE TABLE disciplina (
    ime TEXT PRIMARY KEY
);

-- Table: drzava
CREATE TABLE drzava (
    kratica VARCHAR(3)  PRIMARY KEY,
    ime     TEXT UNIQE
);

-- Table: olimpijskeIgre
CREATE TABLE olimpijskeIgre (
    leto   INT         PRIMARY KEY,
    drzava VARCHAR(3)  REFERENCES drzava(kratica) 
);

-- Table: poddisciplina
CREATE TABLE poddisciplina (
    ime        TEXT PRIMARY KEY,
    disciplina TEXT REFERENCES disciplina(ime) 
);

-- Table: popravi
CREATE TABLE popravi (
    uporabnik  TEXT REFERENCES uporabnik (uporabniskoIme),
    tekmovalec TEXT REFERENCES tekmovalec (id),
    kajNaredi  TEXT NOT NULL,
    razlog     TEXT NOT NULL
);

-- Table: rezultat
CREATE TABLE rezultat (
    id         INTEGER    PRIMARY KEY AUTOINCREMENT,
    leto       INT        NOT NULL REFERENCES olimpijskeIgre(leto),
    disciplina TEXT       NOT NULL REFERENCES poddisciplina(ime),
    tekmovalec INT       NOT NULL REFERENCES tekmovalec(id),
    drzava     VARCHAR(3) REFERENCES drzava(kratica),
    mesto      INT,
    rezultat   TEXT
);

-- Table: tekmovalec
CREATE TABLE tekmovalec (
    id     INTEGER     PRIMARY KEY AUTOINCREMENT,
    ime    TEXT        NOT NULL,
    rojen  DATE,
    drzava     VARCHAR(3) REFERENCES drzava(kratica)
);

-- Table: uporabnik
CREATE TABLE uporabnik (
    uporabniskoIme TEXT PRIMARY KEY,
    geslo          TEXT
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;

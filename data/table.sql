BEGIN;

DROP TABLE IF EXISTS "realization", "images";
CREATE TABLE "realization"(
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "title" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "images"(
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "title" VARCHAR(255) NOT NULL,
    "link" TEXT NOT NULL,
    "realization_id" INTEGER NOT NULL REFERENCES "realization",
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ
);
ALTER TABLE "realization"
    ADD "images_id" INTEGER UNIQUE REFERENCES "images";

-- seeding
INSERT INTO "realization"("title") VALUES
('Rea_1'),
('Rea_2');
INSERT INTO "images"("title","link","realization_id") VALUES
('DSCN0015','/img/realizations/1/DSCN0015.JPG',1),
('DSCN0017','/img/realizations/1/DSCN0017.JPG',1),
('DSCN0031','/img/realizations/1/DSCN0031.JPG',1),
('IMG_3738','/img/realizations/2/IMG_3738.JPG',2),
('IMG_3743','/img/realizations/2/IMG_3743.JPG',2),
('IMG_3753','/img/realizations/2/IMG_3753.JPG',2);
UPDATE "realization" SET "images_id" = 1 WHERE "id" = 1;
UPDATE "realization" SET "images_id" = 4 WHERE "id" = 2;
COMMIT;
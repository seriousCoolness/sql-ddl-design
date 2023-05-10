-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "league" (
    "id" serial   NOT NULL,
    "name" string   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_league" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "league_teams" (
    "id" serial   NOT NULL,
    "team_id" int   NOT NULL,
    "league_id" int   NOT NULL,
    "team_rank" int   NOT NULL,
    CONSTRAINT "pk_league_teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "teams" (
    "id" serial   NOT NULL,
    "name" string   NOT NULL,
    "league_id" int   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "players" (
    "id" serial   NOT NULL,
    "name" string   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "goals" (
    "id" serial   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    CONSTRAINT "pk_goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "matches" (
    "id" serial   NOT NULL,
    "team1_id" int   NOT NULL,
    "team2_id" int   NOT NULL,
    CONSTRAINT "pk_matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "referees" (
    "id" serial   NOT NULL,
    "name" string   NOT NULL,
    "match_id" int   NOT NULL,
    CONSTRAINT "pk_referees" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "league_teams" ADD CONSTRAINT "fk_league_teams_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "league_teams" ADD CONSTRAINT "fk_league_teams_league_id" FOREIGN KEY("league_id")
REFERENCES "league" ("id");

ALTER TABLE "players" ADD CONSTRAINT "fk_players_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_team1_id" FOREIGN KEY("team1_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_team2_id" FOREIGN KEY("team2_id")
REFERENCES "teams" ("id");

ALTER TABLE "referees" ADD CONSTRAINT "fk_referees_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");


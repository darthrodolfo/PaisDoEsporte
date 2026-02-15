-- ============================================================================
-- PAIS DO ESPORTE
-- Migration 003: Teams and Team Participation
-- ============================================================================

CREATE TABLE teams (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    slug VARCHAR(200) NOT NULL UNIQUE,
    short_name VARCHAR(50),
    modality_id BIGINT NOT NULL REFERENCES modalities(id) ON DELETE RESTRICT,
    organization_id BIGINT REFERENCES organizations(id) ON DELETE SET NULL,
    city VARCHAR(100),
    state VARCHAR(50),
    country VARCHAR(2) NOT NULL DEFAULT 'BR',
    founded_year INTEGER,
    logo_url VARCHAR(500),
    home_venue VARCHAR(200),
    status entity_status NOT NULL DEFAULT 'active',
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    deleted_at TIMESTAMPTZ,
    
    CONSTRAINT valid_founded_year CHECK (
        founded_year IS NULL OR 
        (founded_year >= 1800 AND founded_year <= EXTRACT(YEAR FROM NOW()))
    )
);

CREATE TABLE team_seasons (
    id BIGSERIAL PRIMARY KEY,
    team_id BIGINT NOT NULL REFERENCES teams(id) ON DELETE CASCADE,
    league_id BIGINT REFERENCES leagues(id) ON DELETE SET NULL,
    division_id BIGINT REFERENCES divisions(id) ON DELETE SET NULL,
    competition_id BIGINT REFERENCES competitions(id) ON DELETE CASCADE,
    year INTEGER NOT NULL,
    final_position INTEGER,
    points INTEGER,
    matches_played INTEGER DEFAULT 0,
    wins INTEGER DEFAULT 0,
    draws INTEGER DEFAULT 0,
    losses INTEGER DEFAULT 0,
    goals_for INTEGER DEFAULT 0,
    goals_against INTEGER DEFAULT 0,
    status VARCHAR(50),
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    CONSTRAINT valid_season_year CHECK (
        year >= 1800 AND year <= EXTRACT(YEAR FROM NOW()) + 2
    ),
    CONSTRAINT valid_position CHECK (
        final_position IS NULL OR final_position > 0
    ),
    CONSTRAINT valid_match_stats CHECK (
        matches_played >= 0 AND 
        wins >= 0 AND 
        draws >= 0 AND 
        losses >= 0 AND
        wins + draws + losses <= matches_played
    ),
    CONSTRAINT valid_goals CHECK (
        goals_for >= 0 AND goals_against >= 0
    ),
    CONSTRAINT valid_status CHECK (
        status IS NULL OR 
        status IN ('champion', 'runner_up', 'relegated', 'promoted', 'mid_table', 'playoffs')
    )
);

CREATE TABLE competition_results (
    id BIGSERIAL PRIMARY KEY,
    competition_id BIGINT NOT NULL REFERENCES competitions(id) ON DELETE CASCADE,
    team_id BIGINT REFERENCES teams(id) ON DELETE SET NULL,
    athlete_id BIGINT,
    position INTEGER NOT NULL,
    notes TEXT,
    verified BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    CONSTRAINT valid_position CHECK (position > 0),
    CONSTRAINT team_or_athlete CHECK (
        (team_id IS NOT NULL AND athlete_id IS NULL) OR
        (team_id IS NULL AND athlete_id IS NOT NULL)
    )
);
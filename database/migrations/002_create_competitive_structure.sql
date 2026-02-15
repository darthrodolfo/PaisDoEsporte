-- ============================================================================
-- PAIS DO ESPORTE
-- Migration 002: Competitive Structure
-- ============================================================================

CREATE TABLE leagues (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    slug VARCHAR(200) NOT NULL UNIQUE,
    modality_id BIGINT NOT NULL REFERENCES modalities(id) ON DELETE RESTRICT,
    organization_id BIGINT NOT NULL REFERENCES organizations(id) ON DELETE RESTRICT,
    scope scope_type NOT NULL,
    competition_type VARCHAR(50) NOT NULL,
    format VARCHAR(50),
    founded_year INTEGER,
    status entity_status NOT NULL DEFAULT 'active',
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    CONSTRAINT unique_league_per_modality UNIQUE(modality_id, organization_id, name),
    CONSTRAINT valid_competition_type CHECK (competition_type IN ('professional', 'amateur', 'youth', 'mixed')),
    CONSTRAINT valid_format CHECK (format IS NULL OR format IN ('league_system', 'cup', 'playoff', 'mixed')),
    CONSTRAINT valid_founded_year CHECK (
        founded_year IS NULL OR 
        (founded_year >= 1800 AND founded_year <= EXTRACT(YEAR FROM NOW()))
    )
);

CREATE TABLE divisions (
    id BIGSERIAL PRIMARY KEY,
    league_id BIGINT NOT NULL REFERENCES leagues(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    level INTEGER NOT NULL,
    promotion_spots INTEGER DEFAULT 0,
    relegation_spots INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    CONSTRAINT unique_division_per_league UNIQUE(league_id, name),
    CONSTRAINT unique_level_per_league UNIQUE(league_id, level),
    CONSTRAINT valid_level CHECK (level > 0),
    CONSTRAINT valid_spots CHECK (promotion_spots >= 0 AND relegation_spots >= 0)
);

CREATE TABLE competitions (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    slug VARCHAR(200) NOT NULL UNIQUE,
    modality_id BIGINT NOT NULL REFERENCES modalities(id) ON DELETE RESTRICT,
    organization_id BIGINT NOT NULL REFERENCES organizations(id) ON DELETE RESTRICT,
    league_id BIGINT REFERENCES leagues(id) ON DELETE SET NULL,
    division_id BIGINT REFERENCES divisions(id) ON DELETE SET NULL,
    year INTEGER NOT NULL,
    season VARCHAR(20),
    location VARCHAR(200),
    start_date DATE,
    end_date DATE,
    scope scope_type NOT NULL,
    status entity_status NOT NULL DEFAULT 'active',
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    CONSTRAINT valid_competition_year CHECK (
        year >= 1800 AND year <= EXTRACT(YEAR FROM NOW()) + 5
    ),
    CONSTRAINT valid_dates CHECK (
        end_date IS NULL OR end_date >= start_date
    )
);
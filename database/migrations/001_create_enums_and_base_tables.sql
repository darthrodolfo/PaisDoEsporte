-- ============================================================================
-- PAIS DO ESPORTE - INITIAL SCHEMA
-- Migration 001: Core ENUMs and Base Tables
-- ============================================================================

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================================
-- ENUMS
-- ============================================================================

CREATE TYPE scope_type AS ENUM ('national', 'international', 'both');
CREATE TYPE entity_status AS ENUM ('active', 'inactive', 'retired', 'deceased', 'disbanded');
CREATE TYPE user_role AS ENUM ('regular_user', 'claimed_athlete', 'admin');
CREATE TYPE request_status AS ENUM ('pending', 'approved', 'rejected', 'needs_info');
CREATE TYPE reaction_type AS ENUM ('like', 'support', 'applaud');

-- ============================================================================
-- SPORTS FOUNDATION
-- ============================================================================

CREATE TABLE sports (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    scope scope_type NOT NULL DEFAULT 'both',
    is_olympic BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE modalities (
    id BIGSERIAL PRIMARY KEY,
    sport_id BIGINT NOT NULL REFERENCES sports(id) ON DELETE RESTRICT,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    scope scope_type NOT NULL DEFAULT 'both',
    rules_summary TEXT,
    active_in_brazil_since INTEGER,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    CONSTRAINT unique_modality_per_sport UNIQUE(sport_id, name),
    CONSTRAINT valid_year CHECK (
        active_in_brazil_since IS NULL OR 
        (active_in_brazil_since >= 1500 AND active_in_brazil_since <= EXTRACT(YEAR FROM NOW()))
    )
);

CREATE TABLE organizations (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    slug VARCHAR(200) NOT NULL UNIQUE,
    acronym VARCHAR(20),
    type VARCHAR(50) NOT NULL,
    scope scope_type NOT NULL,
    country VARCHAR(2) NOT NULL DEFAULT 'BR',
    founded_year INTEGER,
    website_url VARCHAR(500),
    description TEXT,
    logo_url VARCHAR(500),
    status entity_status NOT NULL DEFAULT 'active',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    CONSTRAINT valid_founded_year CHECK (
        founded_year IS NULL OR 
        (founded_year >= 1800 AND founded_year <= EXTRACT(YEAR FROM NOW()))
    ),
    CONSTRAINT valid_type CHECK (type IN ('federation', 'committee', 'association', 'confederation'))
);

CREATE TABLE organization_modalities (
    organization_id BIGINT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    modality_id BIGINT NOT NULL REFERENCES modalities(id) ON DELETE CASCADE,
    role VARCHAR(50) NOT NULL,
    start_year INTEGER,
    end_year INTEGER,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    PRIMARY KEY (organization_id, modality_id),
    CONSTRAINT valid_years CHECK (end_year IS NULL OR end_year >= start_year),
    CONSTRAINT valid_role CHECK (role IN ('governing_body', 'league_organizer', 'regional_federation', 'promoter'))
);
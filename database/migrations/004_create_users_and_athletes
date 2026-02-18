-- ============================================================================
-- PAIS DO ESPORTE
-- Migration 004: Users and Athletes
-- ============================================================================

CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    name VARCHAR(200) NOT NULL,
    role user_role NOT NULL DEFAULT 'regular_user',
    email_verified BOOLEAN DEFAULT false,
    linked_athlete_id BIGINT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    last_login TIMESTAMPTZ,
    
    CONSTRAINT valid_email CHECK (
        email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    ),
    CONSTRAINT one_athlete_per_user CHECK (
        role != 'claimed_athlete' OR linked_athlete_id IS NOT NULL
    )
);

CREATE TABLE athletes (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    slug VARCHAR(200) NOT NULL UNIQUE,
    birth_date DATE,
    city VARCHAR(100),
    state VARCHAR(50),
    country VARCHAR(2) NOT NULL DEFAULT 'BR',
    modality_id BIGINT NOT NULL REFERENCES modalities(id) ON DELETE RESTRICT,
    bio TEXT,
    photo_url VARCHAR(500),
    status entity_status NOT NULL DEFAULT 'active',
    verified BOOLEAN DEFAULT false,
    claimed BOOLEAN DEFAULT false,
    created_by VARCHAR(50) DEFAULT 'admin',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    deleted_at TIMESTAMPTZ,
    deletion_reason TEXT,
    
    CONSTRAINT valid_birth_date CHECK (
        birth_date IS NULL OR 
        (birth_date >= '1900-01-01' AND birth_date <= CURRENT_DATE)
    ),
    CONSTRAINT valid_created_by CHECK (
        created_by IN ('admin', 'user_request')
    )
);

ALTER TABLE users 
ADD CONSTRAINT fk_users_linked_athlete 
FOREIGN KEY (linked_athlete_id) REFERENCES athletes(id) ON DELETE SET NULL;

ALTER TABLE competition_results 
ADD CONSTRAINT fk_competition_results_athlete 
FOREIGN KEY (athlete_id) REFERENCES athletes(id) ON DELETE SET NULL;

CREATE TABLE athlete_teams (
    id BIGSERIAL PRIMARY KEY,
    athlete_id BIGINT NOT NULL REFERENCES athletes(id) ON DELETE CASCADE,
    team_id BIGINT NOT NULL REFERENCES teams(id) ON DELETE CASCADE,
    position_role VARCHAR(100),
    jersey_number INTEGER,
    contract_type VARCHAR(50),
    start_date DATE NOT NULL,
    end_date DATE,
    is_current BOOLEAN GENERATED ALWAYS AS (end_date IS NULL) STORED,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    CONSTRAINT valid_dates CHECK (
        end_date IS NULL OR end_date >= start_date
    ),
    CONSTRAINT valid_jersey_number CHECK (
        jersey_number IS NULL OR (jersey_number > 0 AND jersey_number <= 999)
    ),
    CONSTRAINT valid_contract_type CHECK (
        contract_type IS NULL OR 
        contract_type IN ('professional', 'amateur', 'loan', 'youth', 'volunteer')
    )
);

CREATE TABLE athlete_competitions (
    id BIGSERIAL PRIMARY KEY,
    athlete_id BIGINT NOT NULL REFERENCES athletes(id) ON DELETE CASCADE,
    competition_id BIGINT NOT NULL REFERENCES competitions(id) ON DELETE CASCADE,
    team_id BIGINT REFERENCES teams(id) ON DELETE SET NULL,
    result_position INTEGER,
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    CONSTRAINT unique_athlete_competition UNIQUE(athlete_id, competition_id),
    CONSTRAINT valid_result_position CHECK (
        result_position IS NULL OR result_position > 0
    )
);

CREATE TABLE athlete_sponsorship (
    athlete_id BIGINT PRIMARY KEY REFERENCES athletes(id) ON DELETE CASCADE,
    seeking_sponsor BOOLEAN DEFAULT false,
    accepting_donations BOOLEAN DEFAULT false,
    needs_training_support BOOLEAN DEFAULT false,
    needs_equipment BOOLEAN DEFAULT false,
    description TEXT,
    pix_key VARCHAR(200),
    contact_email VARCHAR(255),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    CONSTRAINT valid_contact_email CHECK (
        contact_email IS NULL OR 
        contact_email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    )
);

CREATE OR REPLACE FUNCTION check_claimed_athlete_sponsorship()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM athletes WHERE id = NEW.athlete_id AND claimed = true
    ) THEN
        RAISE EXCEPTION 'Only claimed athletes can have sponsorship information';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_claimed_athlete_sponsorship
BEFORE INSERT OR UPDATE ON athlete_sponsorship
FOR EACH ROW EXECUTE FUNCTION check_claimed_athlete_sponsorship();
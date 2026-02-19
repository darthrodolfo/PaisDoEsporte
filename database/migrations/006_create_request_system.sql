-- ============================================================================
-- PAIS DO ESPORTE
-- Migration 006: Request and Approval System
-- ============================================================================

CREATE TYPE request_type AS ENUM (
    'claim_athlete',
    'add_athlete',
    'edit_athlete',
    'delete_athlete',
    'add_sport',
    'add_modality',
    'add_organization',
    'add_team',
    'add_league',
    'add_competition',
    'edit_entity',
    'delete_entity'
);

CREATE TABLE requests (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    request_type request_type NOT NULL,
    target_entity_id BIGINT,
    target_entity_type VARCHAR(50),
    request_data JSONB NOT NULL,
    justification TEXT,
    proof_urls JSONB,
    status request_status NOT NULL DEFAULT 'pending',
    submitted_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    reviewed_at TIMESTAMPTZ,
    reviewed_by_admin_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    admin_notes TEXT,
    rejection_reason TEXT,
    
    CONSTRAINT valid_target CHECK (
        (target_entity_id IS NULL AND target_entity_type IS NULL) OR
        (target_entity_id IS NOT NULL AND target_entity_type IS NOT NULL)
    ),
    CONSTRAINT reviewed_fields_consistency CHECK (
        (status = 'pending' AND reviewed_at IS NULL AND reviewed_by_admin_id IS NULL) OR
        (status != 'pending' AND reviewed_at IS NOT NULL AND reviewed_by_admin_id IS NOT NULL)
    ),
    CONSTRAINT valid_entity_type CHECK (
        target_entity_type IS NULL OR
        target_entity_type IN ('athlete', 'team', 'sport', 'modality', 'organization', 'league', 'competition')
    )
);

CREATE UNIQUE INDEX idx_no_duplicate_pending_claims
ON requests (user_id, target_entity_id)
WHERE request_type = 'claim_athlete' AND status = 'pending';
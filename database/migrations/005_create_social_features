-- ============================================================================
-- PAIS DO ESPORTE
-- Migration 005: Social Features
-- ============================================================================

CREATE TABLE posts (
    id BIGSERIAL PRIMARY KEY,
    athlete_id BIGINT NOT NULL REFERENCES athletes(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    link_url VARCHAR(500),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    deleted_at TIMESTAMPTZ,
    
    CONSTRAINT valid_content_length CHECK (
        char_length(content) >= 1 AND char_length(content) <= 5000
    )
);

CREATE OR REPLACE FUNCTION check_claimed_athlete_post()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM athletes WHERE id = NEW.athlete_id AND claimed = true
    ) THEN
        RAISE EXCEPTION 'Only claimed athletes can create posts';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_claimed_athlete_post
BEFORE INSERT ON posts
FOR EACH ROW EXECUTE FUNCTION check_claimed_athlete_post();

CREATE TABLE follows (
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    athlete_id BIGINT NOT NULL REFERENCES athletes(id) ON DELETE CASCADE,
    followed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    PRIMARY KEY (user_id, athlete_id)
);

CREATE TABLE reactions (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    post_id BIGINT NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    reaction_type reaction_type NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    CONSTRAINT unique_user_post_reaction UNIQUE(user_id, post_id, reaction_type)
);
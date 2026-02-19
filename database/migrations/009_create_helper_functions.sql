-- ============================================================================
-- PAIS DO ESPORTE
-- Migration 009: Helper Functions
-- ============================================================================

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_sports_updated_at BEFORE UPDATE ON sports FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_modalities_updated_at BEFORE UPDATE ON modalities FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_organizations_updated_at BEFORE UPDATE ON organizations FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_leagues_updated_at BEFORE UPDATE ON leagues FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_competitions_updated_at BEFORE UPDATE ON competitions FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_teams_updated_at BEFORE UPDATE ON teams FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_athletes_updated_at BEFORE UPDATE ON athletes FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_posts_updated_at BEFORE UPDATE ON posts FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_sponsorship_updated_at BEFORE UPDATE ON athlete_sponsorship FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE OR REPLACE FUNCTION generate_slug(input_text TEXT)
RETURNS TEXT AS $$
DECLARE
    slug TEXT;
BEGIN
    slug := lower(trim(input_text));
    slug := regexp_replace(slug, '[áàâãä]', 'a', 'g');
    slug := regexp_replace(slug, '[éèêë]', 'e', 'g');
    slug := regexp_replace(slug, '[íìîï]', 'i', 'g');
    slug := regexp_replace(slug, '[óòôõö]', 'o', 'g');
    slug := regexp_replace(slug, '[úùûü]', 'u', 'g');
    slug := regexp_replace(slug, '[ç]', 'c', 'g');
    slug := regexp_replace(slug, '[ñ]', 'n', 'g');
    slug := regexp_replace(slug, '[^a-z0-9]+', '-', 'g');
    slug := regexp_replace(slug, '^-+|-+$', '', 'g');
    RETURN slug;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

CREATE OR REPLACE FUNCTION soft_delete_athlete(
    athlete_id_param BIGINT, 
    reason TEXT DEFAULT NULL
)
RETURNS VOID AS $$
BEGIN
    UPDATE athletes
    SET deleted_at = NOW(),
        deletion_reason = reason,
        claimed = false
    WHERE id = athlete_id_param;
    
    UPDATE users
    SET role = 'regular_user',
        linked_athlete_id = NULL
    WHERE linked_athlete_id = athlete_id_param;
    
    UPDATE posts
    SET deleted_at = NOW()
    WHERE athlete_id = athlete_id_param
      AND deleted_at IS NULL;
END;
$$ LANGUAGE plpgsql;
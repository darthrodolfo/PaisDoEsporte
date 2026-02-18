-- ============================================================================
-- PAIS DO ESPORTE
-- Migration 007: Essential Indexes
-- ============================================================================

-- Foreign key indexes
CREATE INDEX idx_modalities_sport ON modalities(sport_id);
CREATE INDEX idx_org_modalities_org ON organization_modalities(organization_id);
CREATE INDEX idx_org_modalities_mod ON organization_modalities(modality_id);

CREATE INDEX idx_leagues_modality ON leagues(modality_id);
CREATE INDEX idx_leagues_organization ON leagues(organization_id);
CREATE INDEX idx_divisions_league ON divisions(league_id);

CREATE INDEX idx_competitions_modality ON competitions(modality_id);
CREATE INDEX idx_competitions_organization ON competitions(organization_id);
CREATE INDEX idx_competitions_league ON competitions(league_id) WHERE league_id IS NOT NULL;
CREATE INDEX idx_competitions_division ON competitions(division_id) WHERE division_id IS NOT NULL;

CREATE INDEX idx_teams_modality ON teams(modality_id);
CREATE INDEX idx_teams_organization ON teams(organization_id) WHERE organization_id IS NOT NULL;

CREATE INDEX idx_athletes_modality ON athletes(modality_id);
CREATE INDEX idx_users_linked_athlete ON users(linked_athlete_id) WHERE linked_athlete_id IS NOT NULL;

CREATE INDEX idx_athlete_teams_athlete ON athlete_teams(athlete_id);
CREATE INDEX idx_athlete_teams_team ON athlete_teams(team_id);
CREATE INDEX idx_athlete_competitions_athlete ON athlete_competitions(athlete_id);
CREATE INDEX idx_athlete_competitions_competition ON athlete_competitions(competition_id);

CREATE INDEX idx_team_seasons_team ON team_seasons(team_id);
CREATE INDEX idx_team_seasons_league ON team_seasons(league_id) WHERE league_id IS NOT NULL;
CREATE INDEX idx_team_seasons_competition ON team_seasons(competition_id);

CREATE INDEX idx_competition_results_competition ON competition_results(competition_id);
CREATE INDEX idx_competition_results_team ON competition_results(team_id) WHERE team_id IS NOT NULL;
CREATE INDEX idx_competition_results_athlete ON competition_results(athlete_id) WHERE athlete_id IS NOT NULL;

CREATE INDEX idx_posts_athlete ON posts(athlete_id);
CREATE INDEX idx_follows_user ON follows(user_id);
CREATE INDEX idx_follows_athlete ON follows(athlete_id);
CREATE INDEX idx_reactions_post ON reactions(post_id);
CREATE INDEX idx_reactions_user ON reactions(user_id);

CREATE INDEX idx_requests_user ON requests(user_id);
CREATE INDEX idx_requests_reviewed_by ON requests(reviewed_by_admin_id) WHERE reviewed_by_admin_id IS NOT NULL;

-- Composite indexes
CREATE INDEX idx_competitions_modality_year ON competitions(modality_id, year DESC);
CREATE INDEX idx_team_seasons_team_year ON team_seasons(team_id, year DESC);
CREATE INDEX idx_athletes_modality_status ON athletes(modality_id, status) WHERE deleted_at IS NULL;
CREATE INDEX idx_teams_modality_status ON teams(modality_id, status) WHERE deleted_at IS NULL;

-- Filtered indexes
CREATE INDEX idx_athletes_not_deleted ON athletes(id) WHERE deleted_at IS NULL;
CREATE INDEX idx_teams_not_deleted ON teams(id) WHERE deleted_at IS NULL;
CREATE INDEX idx_posts_not_deleted ON posts(id) WHERE deleted_at IS NULL;
CREATE INDEX idx_athlete_teams_current ON athlete_teams(athlete_id, team_id) WHERE is_current = true;
CREATE INDEX idx_organizations_active ON organizations(id) WHERE status = 'active';
CREATE INDEX idx_athletes_claimed ON athletes(id) WHERE claimed = true;
CREATE INDEX idx_requests_pending ON requests(submitted_at DESC) WHERE status = 'pending';

-- Sorting indexes
CREATE INDEX idx_posts_recent ON posts(created_at DESC) WHERE deleted_at IS NULL;
CREATE INDEX idx_competitions_recent ON competitions(year DESC, start_date DESC);
CREATE INDEX idx_users_recent_login ON users(last_login DESC) WHERE last_login IS NOT NULL;
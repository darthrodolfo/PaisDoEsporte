# PaisDoEsporte

A Brazilian sports data platform built as a backend engineering portfolio project.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-blue.svg)](https://www.postgresql.org/)

## About

A structured platform for Brazilian sports information, focusing on:
- Historical sports data and athlete profiles
- Clean relational database design
- Modern backend architecture patterns

Built to demonstrate senior-level backend engineering skills including complex data modeling, authorization systems, and scalable architecture.

## Tech Stack

- PostgreSQL 16
- Docker & Docker Compose
- Redis

## Quick Start

### Prerequisites

- Docker Desktop

### Setup
```bash
# Clone and start
git clone https://github.com/yourusername/paisDoEsporte.git
cd paisDoEsporte
docker-compose up -d

# Verify
docker-compose ps
```

**Access:**
- PostgreSQL: `localhost:5432`
- PgAdmin: `localhost:5050` (credentials in docker-compose.yml)

## Project Structure
```
paisDoEsporte/
├── database/
│   └── migrations/     # Database schema
├── docker-compose.yml
└── README.md
```

## Development
```bash
# View logs
docker-compose logs -f

# Connect to database
docker exec -it paisdoesporte_db psql -U postgres -d paisdoesporte

# Stop services
docker-compose down
```

## License

MIT License - This is a learning/portfolio project.

## Author

[Your Name] - Backend Engineering Portfolio

---

*Learning project*
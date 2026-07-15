# Metabase Analytics Portfolio 📊📈

[![Metabase](https://img.shields.io/badge/Metabase-509EE3?style=for-the-badge&logo=metabase&logoColor=white)](https://metabase.com)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://docker.com)

**Dashboards open-source con Metabase — alternativa gratuita a Power BI.**

> *"Business Intelligence sin licencias caras."*

---

## 🇪🇸 Español

### ¿Qué es Metabase?

[Metabase](https://metabase.com) es una herramienta de BI (Business Intelligence) open-source y gratuita. Es como Power BI, pero:

- ✅ **100% gratuito** — sin licencias, sin suscripciones
- ✅ **Open-source** — corre en tu máquina o servidor
- ✅ **Fácil de usar** — preguntale a los datos en lenguaje natural
- ✅ **Docker-friendly** — levantar en 2 minutos
- ✅ **Compartible** — dashboards públicos embeddables

### Stack completo: n8n + Metabase + MySQL

Este proyecto incluye un `docker-compose.yml` para levantar:

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│   n8n        │────▶│   MySQL      │────▶│   Metabase   │
│ (Automation) │     │  (Database)  │     │  (BI/Dashboards) │
└──────────────┘     └──────────────┘     └──────────────┘
```

**Flujo:**
1. **n8n** extrae, transforma y carga datos
2. **MySQL/MariaDB** almacena los datos procesados
3. **Metabase** se conecta a la BD y crea dashboards visuales

### Dashboards incluidos

| Dashboard | Descripción | Métricas clave |
|-----------|-------------|----------------|
| **Operaciones SJO** | Resumen diario de operaciones de renta de vehículos | Reservas, No-Shows, ingresos, tendencias |
| **KPIs Semanales** | Métricas de rendimiento semanal | % No-Show, tiempo ahorrado, volumen procesado |
| **Análisis de Vuelos** | Correlación vuelos ↔ reservas | Llegadas, reservas por hora, picos de demanda |
| **No-Show Predictivo** | Proyecciones de No-Show basadas en ML | Predicción vs real, accuracy, tendencia |

### Requisitos

- Docker y Docker Compose
- Puerto 3000 (Metabase), 5678 (n8n), 3306 (MySQL) libres

### Instalación

```bash
# 1. Clonar este repo
git clone https://github.com/JoseAn03/metabase-analytics-portfolio.git
cd metabase-analytics-portfolio

# 2. Levantar todo
docker compose up -d

# 3. Abrir Metabase
# http://localhost:3000

# 4. Configurar conexión a MySQL/MariaDB
# Host: mysql / Port: 3306 / DB: analytics / User: analyst / Pass: analyst123

# 5. ¡Empezar a crear dashboards!
```

### Cargar datos de ejemplo

```bash
# Cargar datos de muestra directamente a MySQL
docker exec -i mysql mysql -u analyst -panalyst123 analytics < data/sample_data.sql
```

---

## 🇬🇧 English

### What is Metabase?

Metabase is an **open-source BI tool** — think Power BI, but free and self-hosted. Ask questions in plain English, create dashboards, share insights.

### Installation

```bash
# 1. Clone this repo
git clone https://github.com/JoseAn03/metabase-analytics-portfolio.git
cd metabase-analytics-portfolio

# 2. Start everything
docker compose up -d

# 3. Open Metabase
# http://localhost:3000
```

---

## 📁 Project Structure

```
metabase-analytics-portfolio/
├── README.md                 # Este archivo
├── docker-compose.yml        # Stack completo (n8n + MySQL + Metabase)
├── data/
│   ├── sample_reservas.sql   # Datos de ejemplo (reservas SJO)
│   └── sample_vuelos.sql     # Datos de ejemplo (vuelos)
├── dashboards/
│   ├── operaciones-sjo.json  # Export dashboard
│   ├── kpi-semanales.json
│   └── vuelos-analisis.json
└── metabase-queries/
    └── queries-ejemplo.md    # Preguntas útiles en Metabase
```

---

## 📊 Ejemplos de queries en Metabase

Preguntas que podés hacerle a tus datos con Metabase:

```sql
-- No-Shows por día de la semana
SELECT DAYNAME(reserva) as dia, 
       COUNT(*) as total, 
       SUM(no_show) as no_shows,
       ROUND(SUM(no_show)*100.0/COUNT(*), 1) as pct
FROM reservas
WHERE reserva >= CURDATE() - INTERVAL 30 DAY
GROUP BY DAYNAME(reserva)
ORDER BY FIELD(DAYNAME(reserva), 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

-- Top 10 clientes con más No-Shows
SELECT cliente_nombre, COUNT(*) as reservas, 
       SUM(no_show) as no_shows,
       ROUND(SUM(no_show)*100.0/COUNT(*), 1) as no_show_pct
FROM reservas
GROUP BY cliente_nombre
HAVING reservas > 3
ORDER BY no_shows DESC
LIMIT 10;

-- Promedio de reservas por hora del día
SELECT HOUR(hora_reserva) as hora, 
       AVG(duracion_dias) as duracion_prom,
       COUNT(*) as total
FROM reservas
GROUP BY HOUR(hora_reserva)
ORDER BY hora;
```

---

## 🚀 Roadmap

- [x] README y estructura del proyecto
- [ ] Docker Compose completo (n8n + MySQL + Metabase)
- [ ] Datos de ejemplo (reservas SJO)
- [ ] Dashboards exportados (.json)
- [ ] Deploy a GitHub Pages
- [ ] Video demostración

---

## 📬 Contacto

**José Andrés Sequeira Hernández**  
[![GitHub](https://img.shields.io/badge/GitHub-333?style=flat&logo=github&logoColor=white)](https://github.com/JoseAn03)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-blue?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/jose-andres-sequeira-hernandez-3aaa03285)
[![Email](https://img.shields.io/badge/Email-red?style=flat&logo=gmail&logoColor=white)](mailto:chomita0317@gmail.com)

---

<p align="center">
  <i>"El mejor BI es el que todos pueden usar."</i>
</p>
<p align="center">
  🇨🇷 Hecho en Costa Rica
</p>

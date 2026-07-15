# 🚀 Guía Rápida — Conectar Metabase a DuckDB

## 1. Abrir Metabase
- Andá a **http://localhost:3000**
- Iniciá sesión con tu cuenta (si es primera vez, creala)
- Si ya configuraste antes, solo logueate

## 2. Agregar base de datos DuckDB
1. Click en ⚙️ **Settings** (icono engranaje, esquina superior derecha)
2. **Admin Settings**
3. Pestaña **Databases** → **Add database**
4. Completá:

| Campo | Valor |
|-------|-------|
| **Database type** | `DuckDB` |
| **Display name** | `Analytics SJO` |
| **MotherDuck token** | *(dejar vacío)* |
| **Database file path** | `/home/jose-andres/.openclaw/workspace/projects/metabase-analytics-portfolio/data/analytics.duckdb` |
| **Use host (localhost)** | *(desmarcar)* |

5. Click **Save**

## 3. Verificar
- Metabase va a sincronizar las tablas automáticamente
- Vas a ver 3 tablas: `reservas`, `vuelos`, `metricas_diarias`

## 4. Preguntas útiles para empezar

### SQL Questions

**No-Shows por día de la semana**
```sql
SELECT 
  CASE strftime('%w', fecha)
    WHEN '0' THEN 'Domingo'
    WHEN '1' THEN 'Lunes'
    WHEN '2' THEN 'Martes'
    WHEN '3' THEN 'Miércoles'
    WHEN '4' THEN 'Jueves'
    WHEN '5' THEN 'Viernes'
    WHEN '6' THEN 'Sábado'
  END as dia,
  COUNT(*) as total,
  SUM(no_show::INT) as no_shows,
  ROUND(SUM(no_show::INT) * 100.0 / COUNT(*), 1) as pct_no_show
FROM reservas
GROUP BY strftime('%w', fecha)
ORDER BY strftime('%w', fecha);
```

**Reservas por categoría**
```sql
SELECT 
  categoria,
  COUNT(*) as total,
  ROUND(AVG(duracion), 1) as duracion_prom,
  SUM(no_show::INT) as no_shows
FROM reservas
GROUP BY categoria;
```

**Top aerolíneas por pasajeros**
```sql
SELECT 
  aerolinea,
  COUNT(*) as vuelos,
  SUM(pasajeros) as total_pasajeros,
  ROUND(AVG(pasajeros), 0) as promedio_por_vuelo
FROM vuelos
GROUP BY aerolinea
ORDER BY total_pasajeros DESC;
```

## 5. Crear Dashboard "Operaciones SJO"
1. Click en **+ New** → **Dashboard**
2. Nombre: `🚗 Operaciones SJO`
3. Click **Add question** → elegí las preguntas que creaste
4. Ordená los gráficos:
   - Arriba: KPIs principales (tarjetas numéricas)
   - Medio: Gráficos de barras (No-Shows, reservas x categoría)
   - Abajo: Tabla de vuelos

## 6. ¡Compartir!
- Click en el dashboard → **Sharing** → **Embed** o **Public link**
- Copiás el link y lo ponés en tu GitHub README

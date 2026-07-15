# 📝 Metabase Queries — Dashboard "Operaciones SJO"

## Dashboard principal para el portafolio

### 1. KPI: Total Reservas (card numérica)
```sql
SELECT COUNT(*) as total_reservas FROM reservas;
```

### 2. KPI: % No-Show (card numérica)
```sql
SELECT 
  ROUND(SUM(no_show::INT) * 100.0 / COUNT(*), 1) as pct_no_show
FROM reservas;
```

### 3. KPI: Duración promedio (card numérica)
```sql
SELECT 
  ROUND(AVG(duracion), 1) as duracion_promedio_dias
FROM reservas;
```

### 4. No-Shows por día (bar chart)
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
  END as dia_semana,
  SUM(no_show::INT) as no_shows,
  COUNT(*) - SUM(no_show::INT) as presentados
FROM reservas
GROUP BY strftime('%w', fecha), dia_semana
ORDER BY strftime('%w', fecha);
```

### 5. Reservas por categoría (pie chart)
```sql
SELECT 
  categoria,
  COUNT(*) as total
FROM reservas
GROUP BY categoria
ORDER BY total DESC;
```

### 6. Pasajeros por aerolínea (bar chart)
```sql
SELECT 
  aerolinea,
  SUM(pasajeros) as total_pasajeros
FROM vuelos
GROUP BY aerolinea
ORDER BY total_pasajeros DESC;
```

### 7. No-Shows por terminal (bar chart)
```sql
SELECT 
  terminal,
  COUNT(*) as total,
  SUM(no_show::INT) as no_shows,
  ROUND(SUM(no_show::INT) * 100.0 / COUNT(*), 1) as pct
FROM reservas
GROUP BY terminal;
```

### 8. Tabla de vuelos (table)
```sql
SELECT 
  fecha,
  aerolinea,
  vuelo,
  origen,
  hora_llegada,
  terminal,
  pasajeros
FROM vuelos
ORDER BY fecha, hora_llegada;
```

### 9. Análisis temporal (line chart)
```sql
SELECT 
  fecha,
  no_show_pct
FROM metricas_diarias
ORDER BY fecha;
```

### 10. Distribución horas pico (bar chart)
```sql
SELECT 
  CASE 
    WHEN CAST(strftime('%H', hora) AS INTEGER) BETWEEN 6 AND 9 THEN 'Mañana (6-9)'
    WHEN CAST(strftime('%H', hora) AS INTEGER) BETWEEN 10 AND 13 THEN 'Mediodía (10-13)'
    WHEN CAST(strftime('%H', hora) AS INTEGER) BETWEEN 14 AND 17 THEN 'Tarde (14-17)'
    ELSE 'Noche (18+)'
  END as franja,
  COUNT(*) as reservas
FROM reservas
GROUP BY franja
ORDER BY reservas DESC;
```

---

## Layout sugerido del dashboard

```
┌──────────────────────────────────────────────────┐
│           🚗 Dashboard Operaciones SJO            │
├──────────┬──────────┬─────────────────────────────┤
│  Total   │  No-Show │  Duración Promedio          │
│  Reservas│     %    │                             │
├──────────┴──────────┴─────────────────────────────┤
│    No-Shows por Día          │  Reservas x Categ  │
│    [bar chart]               │  [pie chart]        │
├──────────────────────────────┴─────────────────────┤
│    Pasajeros por Aerolínea                         │
│    [bar chart]                                     │
├──────────────────────┬─────────────────────────────┤
│  % No-Show x Term    │  Franja Horaria            │
│                      │                            │
├──────────────────────┴─────────────────────────────┤
│    Tabla de Vuelos                                 │
│    [table]                                         │
└────────────────────────────────────────────────────┘
```

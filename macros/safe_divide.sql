{% macro safe_divide(numerator, denomirator, decimal_places=2) %}
    CASE
        WHEN {{denomirator}} = 0 OR {{denomirator}} IS NULL THEN 0
        ELSE ROUND(CAST({{numerator}} AS FLOAT) / CAST({{ denomirator}} AS FLOAT), {{ decimal_places}})
    END
{% endmacro %}
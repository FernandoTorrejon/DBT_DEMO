{% macro multiply_columns_and_round(columnQuantity, columnUnitPrice, decimal_places=2) -%}
    round({{ columnQuantity }} * {{ columnUnitPrice }}, {{ decimal_places}})
{% endmacro %}

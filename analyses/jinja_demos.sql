{% set var1 = 'Hello worid' -%}

{{ var1 }}

{%- set var2 -%}
    Hello World 2
{% endset %}

{{ var2 }}

{% set var3 = ['Hello World!', 'Hello again, World!'] -%}
{{ var3[1] }}

{%- set temperature = -10 %}

{% if temperature > 20 %}
{{ 'It is hot' }}   
{% elif temperature < 0 %}
{{ 'It is freezing' }} 
{% else %}
{{ 'It is not hot' }}
{%- endif %}

{{ 'SELECT' }}
{%- set names = ['id', 'quantity', 'unit_price'] -%}

{% for name in names %}
    {{ name }}
    {%- if not loop.last -%}
    {{ ',' }}
    {%- endif -%}
{%- endfor %}
{{ 'FROM table' }}


{{ ref('bronze_orders') }}

{% set now = modules.datetime.datetime.now() -%}
{{ now }}

{% set date_today = modules.datetime.date.today() -%}
{{ date_today }}

{% set columns = adapter.get_columns_in_relation(ref('bronze_orders') ) %}

{% for col in columns %}
{{ col.name }}
{% endfor %}
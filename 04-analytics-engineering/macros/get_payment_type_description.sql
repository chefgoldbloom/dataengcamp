{#
    This macro returns the description of the payment_type per:
    A numeric code signifying how the passenger paid for the trip.
        1= Credit card
        2= Cash
        3= No charge
        4= Dispute
        5= Unknown
        6= Voided trip
#}

{% macro get_payment_type(payment_type) -%}

    case cast( {{payment_type}} as integer)
        when 1 then 'Credit Card'
        when 2 then 'Cash'
        when 3 then 'No charge'
        when 4 then 'Dispute'
        when 5 then 'Unknown'
        when 6 then 'Voided trip'
        else 'EMPTY'
    end

{%- endmacro %}


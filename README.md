# E-Commerce Database Architecture & Operations Reporting

## Executive Summary
This project outlines the backend relational database schema for a B2B/B2C e-commerce platform built within a **MySQL** environment. It includes the structural architecture (DDL) and the operational reporting scripts (DML) necessary to extract business intelligence regarding inventory velocity, geographic sales distribution, and data integrity.

## System Architecture (Entity Relationship Diagram)
The following schema maps the relational constraints across user data and inventory management:

```mermaid
erDiagram
    DEPARTMENT ||--o{ PRODUCT : "contains"
    CATEGORY ||--o{ PRODUCT : "categorizes"
    CUSTOMER ||--o{ ORDERS : "places"
    ORDERS ||--|{ ORDER_LINE : "has"
    PRODUCT ||--o{ ORDER_LINE : "appears_in"

    DEPARTMENT {
        int department_id PK
        varchar department_name
    }
    CATEGORY {
        int category_id PK
        varchar category_name
    }
    CUSTOMER {
        int customer_id PK
        varchar first_name
        varchar last_name
        varchar city
        varchar state
    }
    PRODUCT {
        int product_id PK
        varchar product_name
        decimal product_price
        int department_id FK
        int category_id FK
    }
    ORDERS {
        int order_id PK
        int customer_id FK
        date order_date
    }
    ORDER_LINE {
        int order_id FK
        int product_id FK
        int quantity
    }

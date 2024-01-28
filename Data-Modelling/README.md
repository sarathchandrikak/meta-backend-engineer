# Data Modelling 


# Introduction 

There are several models that you can choose to create a suitable database system including 
  * Entity Relationship Model
  * Hierarchical Data Model
  * Object-Oriented Data Model
  * Dimensional Data Model

Each model has its advantages and disadvantages and achieves a specific objective. 

## The Entity Relationship Model

This model presents each table as an entity with a set of attributes in an ER diagram. This model considers all types of multiplicities in the relationships between the tables including one-to-one, one-to-many, and many-to-many relationships. 

The Entity Relationship Model plays a major role helping to develop a proper structure of your database system. It is the most prominent and widely used database model that uses the ER Diagram to represent the database structure. 

## Conceptual data model

This is an abstract level of a data element’s structure called entities, where you identify the various data sets and data flow in your business. The main idea of the conceptual model is to present an overall picture of the database system by recognizing the entities involved and the relationships between them. The conceptual data model represents the basis for building the logical data model.

## Logical data model

This model covers a more detailed level than the conceptual model. At this level you should be more specific in terms of the information and relationships as follows:

  * Identify the attributes of each entity.
  * Define the primary keys to identify unique records of data in each table.
  * And specify the foreign keys to create relevant relationships between tables.

## The physical data model

This model specifies a detailed level of the database structure. It’s used to create the internal SQL schema of the database, which is implemented in the DBMS. This model involves:

Defining each attribute with a specific data type such as VARCHAR, INT and Decimal.

And applying relevant constraints such as NOT NULL and DEFAULT.



# Entity Relationship Database Normalization 

In a relational database, if you want to delete or update data, you need (most likely) to do it everywhere. If you miss any field or commit a mistake, you’ll end up with incorrect or inconsistent information. These kinds of problems are referred to as the insert, update and delete anomalies.

To solve these problems, you need to apply the normalization process. This process aims to minimize data duplications, avoid errors during data modifications and simplify data queries from the database. The three fundamental normalization forms are summarized below.


## First Normal Form (1NF)

The 1NF form enforces the data atomicity rule and eliminates unnecessary repeating groups of data. The data atomicity rule means that you can only have one single instance value of the column attribute in any cell of the table.


## Second Normal Form (2NF)

For a relation in a database to be in the second normal form, it must already be in the first normal form. In addition, you need to avoid any partial dependency relationships. These occur when a non-key attribute depends only on one part of the composite primary key (a key that consists of a combination of two or more columns). 


## Third Normal Form (3NF)

For a relation in a database to be in the third normal form, it must already be in the second normal form. In addition, it must have no transitive dependency. This means that any non-key attribute in the table may not be functionally dependent on another non-key attribute in the same table.  


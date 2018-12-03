[![Codacy Badge](https://api.codacy.com/project/badge/Grade/f3add0056df14bd6aa9349e3f7875cbe)](https://www.codacy.com/app/erik-valdivieso/kukulkan-grammar?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=kukulkan-project/kukulkan-grammar&amp;utm_campaign=Badge_Grade)

# Kukulkan Grammar
The Grammar for Kukulkan DSL to defining a domain model with entities and relationships.

## Building

	mvn clean install

## DSL Usage

The Kukulkan DSL 

### Entity declaration

Syntax:

	entity <entity-name> [entity-table-name] {
		[<attribute-name> : <data-type> [<validator>*]
	}

#### Declare an entity with no attributes

	entity Person

#### Declare an entity with attributes

	entity Person {
		name: String required,
		lastName: String
	}

All entities contains an `id` attribute by default.  

Data types:  
- String
- Integer
- Long
- BigDecimal
- Float
- Double
- Boolean
- Date
- LocalDate
- ZonedDateTime
- Instant
- Blob
- AnyBlob
- ImageBlob

## Relationships

Syntax:

	entity <entity-name> (entity-table-name) {
		<relationship-type> [to-source-attribute-name] <attribute-name> : <entity>
	}

Relationship types:
- OneToOne
- OneToMany
- ManyToOne
- ManyToMany

### Unidirectional relationship

	entity Person {
		name: String,
		OneToOne address: Address
	}
	entity Address {
		street: String
	}

### Bidirectional relationship

	entity Person {
		name: String,
		OneToOne (person) address: Address
	}
	entity Address {
		street: String required
	}

Note that in bidirectional relationships an extra element `(person)` is defined .  
In `Person` entity an `address` attribute of type `Address` will be created.  
In `Address` entity a `person` attribute of type `Person` will be created

### Display field
The display field is the attribute to show in CRUD view from an associated entity. By default is the `id` attribute but it can be changed by using the `->` arrow character in the entity declaration.

	entity Person {
		name: String,
		OneToOne address: Address
	}
	entity Address {
		-> street: String required
	}

`street` will be used as display field in Person CRUD view instead `id` attribute

### Relationship to CoreUser
In Kukulkan DSL `CoreUser` is a reserved keyword. It can be associated to any other entity defined by the user but only `OneToOne`, `ManyToOne` and `ManyToMany` unidirectional relationship types are supported.

	entity Person {
		OneToOne user: CoreUser
	}

Is not necessary declare the CoreUser in the domain model.

## Other references

[1] https://tomassetti.me/antlr-mega-tutorial/

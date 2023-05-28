# Architecture Overview

This architecture follows a clean architecture pattern and consists of three main layers: the presentation layer, the domain layer, and the data layer. Each layer has its own set of classes and responsibilities, which are briefly described below.

## Presentation Layer

The presentation layer is responsible for handling the user interface and user interactions. It consists of the following classes:

- `Service`: Implements the `BaseService` interface from the domain layer and acts as a bridge between the presentation layer and the domain layer.
- `ExtendedBloc`: Extends the `Bloc` class and implements the `StateListener` interface. Handles the presentation logic for a specific feature or screen.
- `Bloc`: Base class for business logic components. Provides an interface for interacting with the underlying data and business logic.
- `Widget`: Represents a user interface component in the application.
- `Page`: Combines a `Bloc` instance with a `Widget` instance to represent a specific screen or page in the application.

## Domain Layer

The domain layer contains the core business logic and entities of the application. It consists of the following classes:

- `BaseEntity`: Abstract class serving as the base class for all domain entities.
- `BaseMapper`: Abstract class defining the mapping between domain entities and data models.
- `BaseDataSource`: Abstract class representing a data source for retrieving and manipulating data models.
- `BaseRepository`: Abstract class acting as an intermediary between the domain layer and the data layer.
- `BaseService`: Abstract class serving as a base service interface in the domain layer.

## Data Layer

The data layer is responsible for data persistence and retrieval. It consists of the following classes:

- `BaseModel`: Abstract class representing the data models used in the data layer.
- `Mapper`: Implements the `BaseMapper` interface from the domain layer. Provides the implementation for converting between domain entities and data models.
- `DataSource`: Implements the `BaseDataSource` interface from the domain layer. Represents a concrete data source implementation.
- `Repository`: Implements the `BaseRepository` interface from the domain layer. Provides the data access methods required by the domain layer.

## Bloc Manager

The `Bloc Manager` is a separate module or package that provides classes related to managing business logic components and their states. It consists of the following class:

- `BaseStateListener`: Abstract class defining the contract for a state listener.
- `StateListener`: Concrete implementation of a state listener.

To use this architecture, you can create your own implementations of the various abstract classes based on your specific application requirements. You can extend the base classes provided in each layer and implement the necessary methods and logic.

Please note that some classes in the provided code are incomplete and throw `UnimplementedError`. You will need to complete those classes by providing the necessary implementations for the abstract methods and properties.

Overall, this architecture aims to separate concerns and maintain a clear separation of layers, allowing for easier maintenance, testing, and scalability of the application.

### Overview Diagram

![Architecture](architecture.drawio.png)
![Diagram](diagram.png)

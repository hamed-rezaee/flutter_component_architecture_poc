# What is software architecture?

Software architecture is the conceptual foundation and strategic framework for a software system. It encompasses the fundamental design decisions that shape the system's structure, behavior, and interactions. Like the architectural plan for a building, software architecture defines the arrangement of components, the pathways of data, and the mechanisms for achieving desired qualities such as performance, scalability, and maintainability. It serves as a blueprint that guides developers in creating a cohesive, reliable, and adaptable software solution that aligns with the project's objectives and user needs.

# Difference Between Software Architecture and Design Patterns?

Software architecture and design patterns are both crucial concepts in software development, but they serve distinct purposes and operate at different levels of abstraction. Let's delve into the differences between these two concepts:

### Software Architecture

Software architecture refers to the high-level structure and organization of a software system. It outlines the major components, their interactions, data flows, and the overall design decisions that shape the system.

**Scope:** Architecture provides the fundamental framework for the entire software application. It defines the system's major building blocks, their relationships, and the principles that guide their interactions.

**Abstraction Level:** Architecture operates at a higher level of abstraction, focusing on the system as a whole. It addresses questions like how components collaborate, how data moves, and how non-functional requirements are met.

**Goals:** Architecture addresses key system-wide concerns such as scalability, performance, security, and maintainability. It sets the strategic direction and lays the groundwork for the entire project.

### Design Patterns

Design patterns are reusable solutions to common software design problems. They provide templates for solving specific design challenges and promoting best practices.

**Scope:** Design patterns are smaller-scale solutions that target specific design problems within components or interactions. They help improve the design quality of individual parts of the system.

**Abstraction Level:** Design patterns operate at a lower level of abstraction than architecture. They focus on recurring design problems and offer guidelines for structuring code within components.

**Goals:** Design patterns contribute to modular code, enhanced reusability, and improved code maintainability. They aim to simplify complex design decisions, foster code consistency, and encourage collaboration among developers working on different parts of the system.

## Key Goals of Effective Software Architecture

Crafting a successful software architecture involves aiming for specific objectives that collectively contribute to the creation of a reliable, adaptable, and user-centric system. The following are the core goals that guide the development of effective software architecture:

**Functionality:** The architecture should provide the necessary features and capabilities to meet the intended requirements and fulfill user needs effectively.

**Scalability:** The architecture should support handling increased demands by adding resources or components and maintaining performance and responsiveness.

**Maintainability:** The architecture should make it easy to identify, fix, and update issues or enhancements, minimizing the cost and effort of ongoing maintenance.

**Modularity:** Components should be organized into discrete, cohesive modules that can be developed, tested, and maintained independently, promoting reusability and ease of updates.

**Reusability:** Design decisions should facilitate the reuse of components or patterns across different parts of the system or in future projects.

**Testability:** Designing the architecture to facilitate comprehensive testing, enabling efficient validation of the system's functionality, performance, and reliability.

# Current Mobile Team Architectures

## Deriv P2P Architecture

![Deriv P2P Architecture Overview](p2p_architecture.drawio.png)

### Architecture Components

**BinaryApiWrapper:** This component is responsible for connecting to the Flutter Deriv API. In fact We need this component to make Flutter Deriv API compatible with P2P app.

**BaseAPIRepository:** This is a base class that provides common methods and functionalities for repositories that interact with APIs.

**Features Repositories:** These repositories utilize the BinaryApiWrapper to interact with the Deriv API and provide data to the feature cubits.

**Feature Cubits:** Cubits are a part of the Bloc pattern architecture, commonly used with Flutter apps. They manage the state of the UI related to specific features. Each feature cubit extends the BaseCubit class, which includes states like initState, LoadingState, LoadedState, and ErrorState.

### Problems

**Dependency Inversion and Component Replacement:** The architecture lacks proper dependency inversion, making it challenging to replace components without affecting the entire system.
This can lead to difficulties in swapping out components, such as changing the data source or replacing UI elements, potentially leading to tight coupling and inflexibility.

**Testing Complexity:** The intricate dependency flow and the tight coupling between cubits, repositories, and UI elements can complicate testing.
Testing becomes more complex due to the interwoven nature of components, potentially resulting in less effective unit testing and a higher likelihood of integration issues.

**Limited Base State and Flexibility:** The architecture's base state is limited to a specific set of states, which might not cover all possible scenarios.
This limitation can restrict the flexibility to handle a wider range of UI states and can lead to less adaptable and more rigid user interfaces.

**Lack of DataSource Layer:** The architecture doesn't seem to incorporate a dedicated DataSource layer for handling data retrieval and API communication.
This omission can result in difficulties when trying to change the way the application connects to APIs or external data sources, hindering the ability to adapt to changing requirements or technology advancements.

## Deriv GO Architecture

![Deriv Go Architecture Overview](go_architecture.drawio.png)

### Architecture Components

**Flutter Deriv API (Data Source):** This component serves as the data source for the application, providing access to the Deriv API. It abstracts the API communication details and data retrieval logic.

**Base Feature Service:** Each service has its own base feature service that provides common methods and functionalities for that specific feature.

**Future Services:** These services are responsible for interacting with the Flutter Deriv API. Each service corresponds to a specific feature or domain within the app.

**Future Cubits:** Cubits are used to manage the state of the UI related to specific features. Each cubit is associated with a specific feature and contains the logic for managing UI states.

**Bloc Manager:** This component employs the observer pattern to manage dependencies between different feature cubits. It emits states to dependent cubits based on state changes.

### Problems

**Direct Data Source Connection by Services:** Connecting to the data source (API) is managed directly by the services, potentially leading to tight coupling between the services and the API.
This can make the code less flexible and harder to adapt to changes in the API or data source. It might also lead to difficulties in swapping out the data source if needed.

**Complexity of State Dependency Management by Bloc Manager:** The complexity of managing state dependencies using the Bloc Manager could lead to intricate relationships between different feature cubits.
This complexity might make the application harder to understand, debug, and maintain. It could also lead to challenges in writing effective unit tests for the interactions between cubits.

**Unclear Component Responsibilities:** The architecture might not provide clear and well-defined responsibilities for each component, making it challenging to determine where specific logic should reside.
This lack of clarity can lead to confusion among developers, code that's difficult to maintain, and potential overlaps or gaps in functionality.

# Proposed Architecture

In the dynamic landscape of modern software development, a robust and adaptable architecture is critical to the success of any project. The proposed software architecture, inspired by the principles of Clean Architecture, is aligned with the unique demands of our projects. By seamlessly integrating the core tenets of Clean Architecture with carefully tailored adjustments, we aim to empower our development teams to create applications that are testable, reusable, modular, and scalable and enable developers to collaborate seamlessly.

At the heart of the proposed architecture lies a dedication to fundamental design principles that foster maintainability, flexibility, and growth. We aim to improve how our applications are developed and maintained. The architecture rests on five pivotal pillars that shape its core essence:

**Composition over Inheritance**

In a world where software systems are growing increasingly complex, the principle of composition over inheritance gains even greater significance. This approach advocates building functionalities by composing smaller, more manageable components rather than relying heavily on complex inheritance hierarchies. By embracing composition, our architecture promotes flexibility, maintainability, and easier adaptability to changing business needs.

**Single Responsibility**

The principle of single responsibility underscores the importance of assigning a singular purpose to each module or component. By adhering to this principle, our architecture fosters clarity in design, isolates potential points of failure, and facilitates ease of maintenance. Modules dedicated to a specific task reduce interdependencies, enhancing the overall stability of the system.

**Separation of Concerns**

Clear boundaries between different aspects of the software are achieved through the principle of separation of concerns. By modularizing functionalities based on their distinct responsibilities, our architecture promotes comprehensibility, ease of debugging, and promotes a streamlined development process. This separation also simplifies the integration of new features or changes without causing ripple effects across the entire codebase.

**Open-Closed Principle**

The Open-Closed Principle advocates that software entities should be open for extension but closed for modification. By adhering to this principle, our architecture ensures that new functionalities can be added without altering existing code, thereby reducing the risk of introducing unintended side effects. This promotes a smoother development workflow, reducing regression risks and enhancing code stability.

**Dependency Inversion**

The Dependency Inversion Principle encourages the decoupling of high-level modules from low-level implementation details, promoting a more adaptable and interchangeable architecture. By reversing traditional dependency flows, our architecture mitigates the risks associated with tight coupling, making it easier to substitute components and manage changes without cascading impacts throughout the system.

## Architecture Components

### Core

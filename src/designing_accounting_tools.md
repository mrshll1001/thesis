Chapter 5: Designing Accounting Tools {#design-casestudy}
=========================================

This chapter presents an empirical account of the design process that was undertaken in order to produce software that was later deployed. In addition to this, a technical overview of the software is also presented.

Introduction
----------------

Background (Recap of relevant literature)
------------------------------------------------

Study Scope and Methods
--------------------------------
This section elaborates on the overall design process following the initial portion of fieldwork. The design process is discussed in detail with reference to literature used to ground the specific techniques used.

### Initial Design Work

#### Futures Workshop

### Iterative Development and Design


System Details and Design Rationale
-----------------------------------
This section outlines the systems and design rationale of the software that was developed for deployment. Attention is spent on its federated architecture, and the two main components of the system are discussed along with a provisional data standard that was produced to promote interoperability.

### Overview

#### Federated Architecture

### Rosemary Accounts

#### Type Inferrence

### Accounting Scrapbook
Accounting Scrapbook is a lightweight mobile application that was designed to allow the charity workers to collaborate in collecting and curating information about their work and spending. Within the application, workers may create entries to reflect their everyday work and expenditure such as Images, Quotes, Activities, and Spends. These can then be organised by placing them into one or more *"Scrapbooks"*, allowing them to be grouped thematically and associated with other content.

The following sections details the behaviour and design rationale for each feature of the design.

#### Scrapbooks


#### Types of Entry
The types of entry available to produce in *Accounting Scrapbook* are:

* Images / Photographs
* Spending e.g. expenses
* Quotes
* Activities or Events (Location data with descriptors)

These types of entry were produced to mirror the components of the QA data standard (described above). Similar to *Rosemary Accounts*, the application's database does not differentiate between data types and instead stores all entries as a single class. Unlike in *Rosemary Accounts*, Content Inferrence is not used to dynamically display entries. Instead, a single field is used to denote the "type" of entry as understood by the application and display it appropriately.

**Insert UML diagram**


#### Tags


#### Adding Entries
The app provides several interfaces for adding an entry to the system, each tailored to providing the information for a different type of entry (Image, Spend, Quote, Activity).

##### Adding Images
Adding an entry with images is done by selecting the *Add Images* button on the main menu, taking you to the Add Image screen (**Figure**). At the top of the screen there is a single button labelled *"Choose Images"*. Selecting this button brings up the phone's gallery interface, allowing you to select one or more images that exist on the device already. When this action is complete, the gallery closes and the first of the selected images is placed on the UI to affirm its selection.

When  

##### Adding Spend Data

##### Adding Quotes

##### Adding Activities

##### Common Elements

### Discarded Designs
There were several other components that we considered developing for the research, but were discarded due to limitations on time or because it may have been too disruptive to the daily work of Patchwork.


Discussion
----------------
This section reflects on features and discussions in the design process in order to contribute to teh design requirements of software in this space. In addition to this, comments are made on the appropriateness of techniques utilised develop the designs in this setting.

### Building metaphors

### TBC

Summary / Conclusions
--------------------------------

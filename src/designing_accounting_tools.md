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

### Federated Architecture
As discussed in the [previous chapter](#fieldwork-discussion), one of the design requirements for this space was to support a *Configurable Transparency* which did not impose a specific presentation or collection process onto the worker; thus allowing them to present their work in a manner that makes sense in that moment for whichever purpose they wish. I also noted that this would be achieveable through interoperable, federated, tools; allowing data to be exchanged between systems whilst supporting collection and presentation in various formats. This mirrors the work performed by organisations already since organisations already engage in collecting a wide variety of information to be used for accountability, and recombine it in order to present it to a variety of audiences.

**(note: this gets a little fluffy for this paragraph, check this with a supervisor)**
Producing a federated toolset also challenges the de-facto solution of producing a catch-all *"platform"*. One can produce a system which serves a need at a given time, but you force workers to engage with the metaphors and interactions that the platform allows (more on this later). Similar to the failings of the Charity Commission to support qualitative data @marshall_accountable_2016 a magic platform to do the accounting we need it to inevitably becomes obsolete when society and technology progress, it thus risks causing more harm than good in the long-run when concerning interactions that support Accountability or Transparency. There is also always the risk of a platform acting as a *"silo"*, a [term coined on the Indieweb](https://indieweb.org/silo) to describe a site which retains user data and centralises control over it @indieweb.org_silo_. Other than the interactional risks of silos discussed here, and privacy concerns for sensitive data, there is also the obvious question of what happens to data when a silo goes down, and the political economy of whom owns the "means of production" when concerning producing accountability if it is achieved through the web [@kleiner_telekommunist_2010]. We have previously seen what happens when private capital attempts to own the production of Third Sector financial accounts (ie Sage Accounts, [discussed here](#compiling-accounts)).

To that end, an attempt at a federated approach was present in the design of these systems. As noted by others [@pine_institutional_2014], values are embedded in the design of systems and a (somewhat) federated approach allowed us to embed our own values into the applications and systems designed. Most prominent were the values of *Flexibility* and *Worker Control* (discussed earlier). These are embodied in a federated approach by decoupling components of what would normally be tightly bound. In this way, a worker may use a data collection tool without requiring an account on a platform, whilst an organisation may maintain an account on a hosted service but receive (and retrieve) data from other platforms of services.

This additionally has the benefit of being able to add applications, services, and services to the federation very simply. Creating a potentially very large set of interfaces targeted at a wide variety of potential stakeholders. In this thesis, I concern myself with charity workers and thus the systems developed are targeted at their work; however the federated approach means that other interfaces, views, and interactions for working with the data may be developed *and deployed easily* with other stakeholder groups. In this way I hope the values embedded in the tools developed provide an alternative vision for accounting work where we stop interacting with systems and begin contributing to ecosystems.

This section continues by providing an overview of how an attempt at federation was achieved technically.

#### Data and API Standards
In order to achieve interoperability and move towards a federated ecosystem, applications and services need a common language with which to communicate; allowing them to share and process data amongst themselves.

##### Data
A data standard is a way of defining rules that [dictate how data is described and recorded](https://www2.usgs.gov/datamanagement/plan/datastandards.php) in a particular use case

##### API


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

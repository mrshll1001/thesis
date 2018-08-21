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
Producing a federated toolset also challenges the de-facto solution of producing a catch-all *"platform"*. One can produce a system which serves a need at a given time, but you force workers to engage with the metaphors and interactions that the platform allows (more on this later). Similar to the failings of the Charity Commission to support qualitative data @marshall_accountable_2016 a magic platform to do the accounting we need it to inevitably becomes obsolete when society and technology progress, it thus risks causing more harm than good in the long-run when concerning interactions that support Accountability or Transparency. There is also always the risk of a platform acting as a *"silo"*, a [term coined on the Indieweb](https://indieweb.org/silo) to describe a site which retains user data and centralises control over it [@indieweb.org_silo_nodate]. Other than the interactional risks of silos discussed here, and privacy concerns for sensitive data, there is also the obvious question of what happens to data when a silo goes down, and the political economy of whom owns the "means of production" when concerning producing accountability if it is achieved through the web [@kleiner_telekommunist_2010]. We have previously seen what happens when private capital attempts to own the production of Third Sector financial accounts (ie Sage Accounts, [discussed here](#compiling-accounts)).

To that end, an attempt at a federated approach was present in the design of these systems. As noted by others [@pine_institutional_2014], values are embedded in the design of systems and a (somewhat) federated approach allowed us to embed our own values into the applications and systems designed. Most prominent were the values of *Flexibility* and *Worker Control* (discussed earlier). These are embodied in a federated approach by decoupling components of what would normally be tightly bound. In this way, a worker may use a data collection tool without requiring an account on a platform, whilst an organisation may maintain an account on a hosted service but receive (and retrieve) data from other platforms or services.

This additionally has the benefit of being able to add applications, services, and services to the federation very simply. Creating a potentially very large set of interfaces targeted at a wide variety of potential stakeholders. In this thesis, I concern myself with charity workers and thus the systems developed are targeted at their work; however the federated approach means that other interfaces, views, and interactions for working with the data may be developed *and deployed easily* with other stakeholder groups. In this way I hope the values embedded in the tools developed provide an alternative vision for accounting work where we stop interacting with systems and begin contributing to ecosystems.

This section continues by providing an overview of how a form of federation was achieved technically.

#### Data and API Standards
In order to achieve interoperability and move towards a federated ecosystem, applications and services need a common language with which to communicate; allowing them to share and process data amongst themselves. A standard is a way of defining rules that [dictate how data is described and recorded](https://www2.usgs.gov/datamanagement/plan/datastandards.php) in a particular use, and as such a prototype standard was designed with Patchwork to support later system designs.

This standard was tentatively named *"Qualitative Accounting"* (hereafter *QA*) in reference to the findings from earlier work (namely [@marshall_accountable_2016]), although during the design process it was highlighted how the name might be misconstrued ([discussed here](#link-me)). Regardless of this, the name remained in practice as focus later shifted towards developing the individual tools that implemented it.

The standard contains two main components: a data schema for collecting and annotating data representing money and work; and a Web URI schema which defined expected URI endpoints and behaviour so that systems implementing the standard could communicate with arbitrary domains using Web technologies.

The following sections were also presented as a [public-facing website](https://openlab.ncl.ac.uk/qualitative-accounting/about/) using language more geared towards prospective implementers.


##### Data Schema
The QA data schema is a JSON schema designed to represent an *individual item or context*, and to be as simple and flexible as possible. Not all fields will be required for each item, but having separate schemas for various categories begins to complicate matters and produces the arbitrary distinctions in accounting that the standard was developed to avoid. This way, it is left to the application developers themselves to determine how to interpret various combinations of fields and values that make sense for their application.

(TABLE NO) details the schema's fields.

| Field           | Type                        | Description     
| ---             | ---                         | ---     
| id              | `string`                    | Unique identifier for the transaction created by your system
| date_created    | `date-time`                 | Date the record was created on the system ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601))
| date_given      | `date-time`                 | Date given for the record, to allow for retroactive creation of accounts ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601))
| tags            | `array[string]`             | Qualitative tag descriptors for the item. *No hashtags* (see below)
| quote           | `Quote` (see below)         | Snippet of text to capture sentiment. E.g. "It was a good day - Anon"
| financial_data  | `FinancialData` (see below) | Financial data associated with the item, such as spend or income.
| media           |  `string`                   | URI to a media item, such as an image, document, or video. See below for details.
| location        |  `Location` (see below)     | Geographic location of item, such as an address or lat/long
| description     | `string`                    | Any additional information or notes that the producer would like associated with the item

###### id
This is the unique identifier for the transaction or item generated by your application or system. We recommend that this takes the form of a string in the format of `applicationName_deviceid_transactionid`. The `deviceid` portion is included to help prevent collisions as some software may be designed to run independantly om devices without a centralised service to manage transaction ids (e.g. a smartphone application). How you determine the `deviceid` is up to you. Transaction ID doesn't need to be numerical or incremental at all, but must be alphanumeric and contain no special characters other `-`.

A possible id string for a decentralised set of systems:
```
cool-application_a164-motog_01-01-1970-0000
```
Here the application has generated a unique device id from four random alphanumeric characters and the physical device's model. Their transaction id is an adapted date-time object.

A possible id string for data produced by a centralised system (ie one that has some form of transaction management):

```
cool-application_001_t450
```
In this case, the application doesn't need a complicated device id since all data is handled centrally. The transaction id is similarly simple, simply being a counter with a numerical id for each transaction.

###### date_created
The date and timestamp that the entry was created in the original system. Format should conform to [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601).

###### date_given
Date given by the *user* that the item/context took place. This allows users to retroactively account for items. Format should conform to [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601).

###### tags
Tags allow an item to be given multiple, qualitative, short descriptors. It is recommended that software allows users to enter these tags manually. Transmitted tags should not contain any special characters, including hashtags. Whilst hashtags are useful and understandable, we believe that they are more useful as a visual metaphor for users of a system. We recommend that systems store all parsed hashtags without the hash prefix, so that they can be transmitted and converted to a system's desired format more easily.

###### Quote
A quote represents a verbal or written extract expressing sentiment. Quote objects have two fields, allowing separation of content from attributation

| Field         | Type     | Description
| ---           | ---      | ---
| text          | `string` | Content or body of the quote
| attribution   | `string` | The name of who or what the quote is attributed to

###### FinancialData
An increase or decrease of funds associated with the item. A positive number is associated with income, whilst a negative number is associated with spend.

| Field         | Type     | Description
| ---           | ---      | ---
| currency      | `string` |  Three letter currency code as designated by [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) (e.g. 'GBP' for Pound Sterling)
| value         | `float`  | Financial value associated with the item. *Positive* for income, and *Negative* for expenditure

###### media
A single media item such as an image, document or video file. This should be a URI provided by your system to allow other software to access the media. For software that operates independantly on devices, URIs can be acquired through a service that consumes media data and follows a strict format.

SEE PAGE FOR MORE DETAILS

###### Location
Any geographic location data associated with the item. To allow for flexibility and the potential for protecting some sensitive contexts, this can be as broad or as specific as the user/producing application would like (or can reasonably produce).

| Field         | Type     | Description
| ---           | ---      | ---
| name          | `string` | Name of the location
| address       | `float`  | Address of the location
| latitude      | `string` | Latitude point of the location
| longitude     | `string` | Longitude point of the location

###### description
Any additional notes or text that the producer of the data feels are important. It is recommended to use this field to allow users of the system to enter text freely and provide additional context that may not be captured by the current version of the data standard.


##### URI Schema
Where the data schema describes what constitutes an item representing under QA, the URI Schema defines API end points that an application must implement in order to receive QA information.

This is done so that applications sending information can construct a full URI given only a domain name. From the sending application's point-of-view, this means it can send the QA data anywhere given only a valid domain name.

Under the URI schema, three endpoints are defined to support the sending of data, shown in (Table XYZ). The schema decouples the sending of media and the sending of a data entry that may be associated with that media. This is so that use-cases such as mobile applications may send data entries and media asynchronously, and that upon failing to send a file the rest of the data is not lost and workers may recover the media another way.

| Endpoint                    | HTTP Method | Description                                                                                            |
|--------------               | -------     | ------------------------------------------                                                             |
| `/qa-data`                  | POST        | Accepts a JSON payload to store a single QA data entry                                                 |  
| `/qa-media`                 | POST        | Accepts a form-encoded POST request with form label `media` to support uploading files                 |
| `/qa-media/[sha-1FileHash]` | GET         | Using the `[sha-1FileHash]` as a key, retrieves the media associated with that key to the requester    |

###### Sending Data Entries
Sending Entries involves the sending application performing the following steps:

1. Determining the full URL to send data to, based off of the URI Schema and the domain name
2. Translating its data entries into the QA standard based off of the JSON Schema outlines above, including URIs to any media.
3. Sending the data entry with a HTTP POST request containing the JSON-encoded entry.
4. (optional) If the data entry contains media that is stored locally (e.g. on a phone), send the media separately.



###### Sending Media and Entries with Media
Given the decoupling of JSON data entries with the media item, a problem emerges with sending data entries that have media affiliated with them; since the URI for the media will not be known ahead of time. One solution to this is for the sender to await a response from the recipient so that it may wait and send the entry with an appropriate URI. Another is to agree on a way that URIs pointing to media are constructed, so that applications can independently calculate a canonical reference to the media for transmitting data. We went with the second [for several reasons](#LINK ME) **remember to link me**.

To generate the canonical URI for a file, the application or service makes a cryptographic hash of the file using SHA-1 [@burrows_secure_1995], giving a unique identifier for the file. While SHA-1 is not perfect @biham_collisions_2005 [@de_canniere_finding_2006] it was deemed appropriate for the research as it was lightweight, many programming platforms support it as a hash function natively (e.g. [android](https://stackoverflow.com/questions/5564643/android-calculating-sha-1-hash-from-file-fastest-algorithm#9989835) and [PHP](https://secure.php.net/manual/en/function.sha1-file.php), used in this research), and the use-case in the research would not be working with a large dataset where there were risks of collisions or exposing data to malicious attacks.

After the hash is generated, it acts as a unique key to form part of a URI slug. This slug is then appended to the path `/qa-media/` on a given domain e.g.

```
https://rosemary-accounts.co.uk/qa-media/629095bf6f1d232fe9d21f05be7bea2cf8f8d10f
```

Of course, if the sending application also hosted the media in a manner that was available over the internet (e.g. two hosted web services communicating), it would mean that a URI already existed and the generation step could be skipped.For other cases, such as in local applications (desktop / mobile), means that a URI can be generated and sent as part of the associated data entry seamlessly.


###### Receiving Media and Entries with Media
Receiving media (ie files) is straightforward as well. The receiver must make available a URI endpoint `/qa-media`, which accepts a POST request. This request is expected to have form-encoded data with a single field; `media`, which contains the file being sent.

Upon receiving the file, the service must perform the SHA-1 hash to generate the unique key and then store it as they wish, as long as they provide an endpoint under their domain (`/qa-media/sha-1Filehash`) which points to the file. This means that, if they choose to, a web service can decouple the access and storage of the media further by hosting externally and using their endpoint to redirect to another service whilst keeping the URI canonical. This could be done for redundancy, or to control access to the media where appropriate.

### Rosemary Accounts


#### Type Inference

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

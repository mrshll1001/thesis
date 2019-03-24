Chapter 5: Designing Accounting Tools {#design-casestudy}
=========================================

This chapter presents an empirical account of the design process that was undertaken in order to produce software that was later deployed. In addition to this, a technical overview of the software is also presented.

Introduction
----------------
+ The previous chapter provided an analysis of work practice within a charity, that was then used to propose design requirements for systems
+ This chapter follows from that and describes the design and implementation of systems based around those initial findings
+ New participants are introduced, who affect the process in a variety of capacities
+ The components and items of the system are described with a design rationale
+ A brief reflection on the research's approach to collaboration is given
+ Lesson from the design process are summarised and described at the end

Study Scope and Methods
--------------------------------
This section elaborates on the overall design process following the initial portion of fieldwork. The design process is discussed in detail with reference to literature used to ground the specific techniques used.

### Participants and Collaborators
+ Patchwork were involved throughout the process, and were the most prominent collaborators during this.
+ Edbert's House were also involved and affected the design of the system bringing new problems to light.
+ Gateshead Older People Assembly were involved in a small way but not involved in a particularly serious way.

### Initial Design Work (Futures Workshops)
+ The first piece of design work came when three workshops were held at Patchwork across the summer of 2016.
+ Workshops were inspired by a "futures workshop" but scheduling restrictions required the three phases of a futures workshop to be spread across different days, roughly three to four weeks apart each time.

+ First workshop was designed to elicit reflection on how the organisation communicated its spending and activities
+ A rich picture diagram was built in several layers and reflected upon by the participants

+ Second workshop explored the relationship between the participants and their data.
+ Nine scenarios were presented to the group to discuss and reflect upon.
+ group then were asked to present their own vision for supporting accountability; which they did as a group.

+ Group was given a design brief akin to "magic machines" to imagine how a future version of Patchwork would "do" accountability.
+ given basic office materials to construct the machines
+ workers would then demonstrate their use to each other and myself by taking us to the locations where each machine was designed to be used.

+ Workshops were audio recorded but data was damaged at a later point, leaving only the recording for second workshop intact. The first workshop was partially transcribed before the loss of the raw data.
+ Other details of the workshops were captured through fieldnotes.

### Iterative Development and Design
+ Performed across six months October 2016 -> April 2017 with Patchwork taking the form of fairly standard iterative design work.
+ Accounting Scrapbook was built first to allow a collection process for the data to be performed.
+ Rosemary was built second to give the data somewhere to go.
+ Informal 'crit' sessions were performed across the six months integrated into regular fieldwork sessions where possible.

+ In May Edbert's House expressed interest in joining the research (actually Patrick roped them in but they genuinely seemed keen)
+ An initial meeting with them at their project also involved Gateshead Older People's Assembly (GOPA) who both agreed to be part of the research.
+ Several meetings were had with Edbert's House and GOPA initially to scope how they would be involved, including several "training" sessions on how to use the software that was produced.
+ Edbert's House raised several points about the current design of the software and suggested improvements.
+ Some of these were ratified with GOPA.
+ These will be discussed in depth later.
+ To accommodate these new enthusiastic participants changes were made to the systems across the month of May and into June.

+ The initial designs were deployed for evaluation in June, which is discussed later.

System Details and Design Rationale
-----------------------------------
This section outlines the systems and design rationale of the software that was developed for deployment. Attention is spent on its federated architecture, and the two main components of the system are discussed along with a provisional data standard that was produced to promote interoperability.

### Overview

### Federated Architecture
As discussed in the [previous chapter](#fieldwork-discussion), one of the design requirements for this space was to support a *Configurable Transparency* which did not impose a specific presentation or collection process onto the worker; thus allowing them to present their work in a manner that makes sense in that moment for whichever purpose they wish. I also noted that this would be achieveable through interoperable, federated, tools; allowing data to be exchanged between systems whilst supporting collection and presentation in various formats. This mirrors the work performed by organisations already since organisations already engage in collecting a wide variety of information to be used for accountability, and recombine it in order to present it to a variety of audiences.

+ Critiques of platform capitalism. Introduce platform cooperativism
+ Not trying to build platform coops, but provide an alternative to being "locked in" and silo'd

Producing a federated toolset also challenges the de-facto solution of producing a catch-all *"platform"*. One can produce a system which serves a need at a given time, but you force workers to engage with the metaphors and interactions that the platform allows (more on this later). Similar to the failings of the Charity Commission to support qualitative data @marshall_AccountableExploringInadequacies_2016 a magic platform to do the accounting we need it to inevitably becomes obsolete when society and technology progress, it thus risks causing more harm than good in the long-run when concerning interactions that support Accountability or Transparency. There is also always the risk of a platform acting as a *"silo"*, a [term coined on the Indieweb](https://indieweb.org/silo) to describe a site which retains user data and centralises control over it [@indieweb.org_SiloIndieWeb_]. Other than the interactional risks of silos discussed here, and privacy concerns for sensitive data, there is also the obvious question of what happens to data when a silo goes down, and the political economy of whom owns the "means of production" when concerning producing accountability if it is achieved through the web [@kleiner_TelekommunistManifesto_2010]. We have previously seen what happens when private capital attempts to own the production of Third Sector financial accounts (ie Sage Accounts, [discussed here](#compiling-accounts)).

To that end, an attempt at a federated approach was present in the design of these systems. As noted by others [@pine_InstitutionalLogicsEMR_2014], values are embedded in the design of systems and a (somewhat) federated approach allowed us to embed our own values into the applications and systems designed. Most prominent were the values of *Flexibility* and *Worker Control* (discussed earlier). These are embodied in a federated approach by decoupling components of what would normally be tightly bound. In this way, a worker may use a data collection tool without requiring an account on a platform, whilst an organisation may maintain an account on a hosted service but receive (and retrieve) data from other platforms or services.

This additionally has the benefit of being able to add applications, services, and services to the federation very simply. Creating a potentially very large set of interfaces targeted at a wide variety of potential stakeholders. In this thesis, I concern myself with charity workers and thus the systems developed are targeted at their work; however the federated approach means that other interfaces, views, and interactions for working with the data may be developed *and deployed easily* with other stakeholder groups. In this way I hope the values embedded in the tools developed provide an alternative vision for accounting work where we stop interacting with systems and begin contributing to ecosystems.

This section continues by providing an overview of how a form of federation was achieved technically.

#### Data and API Standards
In order to achieve interoperability and move towards a federated ecosystem, applications and services need a common language with which to communicate; allowing them to share and process data amongst themselves. A standard is a way of defining rules that [dictate how data is described and recorded](https://www2.usgs.gov/datamanagement/plan/datastandards.php) in a particular use, and as such a prototype standard was designed with Patchwork to support later system designs.

This standard was tentatively named *"Qualitative Accounting"* (hereafter *QA*) in reference to the findings from earlier work (namely [@marshall_AccountableExploringInadequacies_2016]), although during the design process it was highlighted how the name might be misconstrued ([discussed here](#link-me)). Regardless of this, the name remained in practice as focus later shifted towards developing the individual tools that implemented it.

The standard contains two main components: a data schema for collecting and annotating data representing money and work; and a Web URI schema which defined expected URI endpoints and behaviour so that systems implementing the standard could communicate with arbitrary domains using Web technologies.

The following sections were also presented as a [public-facing website](https://openlab.ncl.ac.uk/qualitative-accounting/about/) using language more geared towards prospective implementers.


##### Data Schema
The QA data schema is a JSON schema designed to represent an *individual item or context*, and to be as simple and flexible as possible. Not all fields will be required for each item, but having separate schemas for various categories begins to complicate matters and produces the arbitrary distinctions in accounting that the standard was developed to avoid. This way, it is left to the application developers themselves to determine how to interpret various combinations of fields and values that make sense for their application.

(TABLE NO) details the schema's fields.

| Field           | Type                        | Description
| ---             | ---                         | :---------------------------------
| id              | `string`                    | Unique identifier for the transaction created by your system
| date_created    | `date-time`                 | Date the record was created on the system ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601))
| date_given      | `date-time`                 | Date given for the record, to allow for retroactive creation of accounts ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601))
| tags            | `array[string]`             | Qualitative tag descriptors for the item. *No hashtags* (see below)
| quote           | `Quote` (see below)         | Snippet of text to capture sentiment. E.g. "It was a good day - Anon"
| financial_data  | `FinancialData` (see below) | Financial data associated with the item, such as spend or income.
| media           |  `array[string]`            | Array of URIs to media items, such as images, documents, or videos. See below for details.
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
| ----------    | ---      | :--------------------------------
| text          | `string` | Content or body of the quote
| attribution   | `string` | The name of who or what the quote is attributed to

###### FinancialData
An increase or decrease of funds associated with the item. A positive number is associated with income, whilst a negative number is associated with spend.

| Field         | Type     | Description
| ---           | ---      | :---------------------
| currency      | `string` | Three letter currency code as designated by [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) (e.g. 'GBP' for Pound Sterling)
| value         | `float`  | Financial value associated with the item. *Positive* for income, and *Negative* for expenditure

###### media
Media items such as images, documents or video files. This should be an array of URIs provided by systems to allow other software to access the media. For software that operates independently on devices, URIs can be derived through a service that provides the appropriate URI endpoints.

example entry:

``` json
{
  …
  "media": [
    "https://rosemary-accounts.co.uk/qa-media/ebc6df075e0200c451757ba3d051f79b47b2c976",
    "https://rosemary-accounts.co.uk/qa-media/28cf4ef03ac7023ce0dc816b4aab6558d7e6079f",
    "https://rosemary-accounts.co.uk/qa-media/f659164d121f53c10af8b626ec110e2e48ff21bc"
  ],
  …
}
```
+ media was originally a single field rather than an array. This was changed due to feedback later to match workflow.

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
3. Sending the data entry with a HTTP POST request containing a *single* JSON-encoded entry.
4. Repeating step 3 for all data entries.
5. (conditional) If the data entry contains media that is stored locally (e.g. on a phone), send the media separately.

It is simple to determine the target URL for the data based off the URI schema outlined above. Given the URL `https://rosemary-accounts.co.uk`, the application knows from the schema to append the endpoint `/qa-data` to the domain; giving the endpoint as `https://rosemary-accounts.co.uk/qa-data`.

###### Sending Media and Entries with Media
Given the decoupling of JSON data entries with the media item, a problem emerges with sending data entries that have media affiliated with them; since the URI for the media will not be known ahead of time. One solution to this is for the sender to await a response from the recipient so that it may wait and send the entry with an appropriate URI. Another is to agree on a way that URIs pointing to media are constructed, so that applications can independently calculate a canonical reference to the media for transmitting data. We went with the second [for several reasons](#LINK ME) **remember to link me**.

To generate the canonical URI for a file, the application or service makes a cryptographic hash of the file using SHA-1 [@burrows_SecureHashStandard_1995], giving a unique identifier for the file. While SHA-1 is not perfect @biham_collisions_2005 [@decanniere_FindingSHA1Characteristics_2006] it was deemed appropriate for the research as it was lightweight, many programming platforms support it as a hash function natively (e.g. [android](https://stackoverflow.com/questions/5564643/android-calculating-sha-1-hash-from-file-fastest-algorithm#9989835) and [PHP](https://secure.php.net/manual/en/function.sha1-file.php), used in this research), and the use-case in the research would not be working with a large dataset where there were risks of collisions or exposing data to malicious attacks.

After the hash is generated, it acts as a unique key to form part of a URI slug. This slug is then appended to the path `/qa-media/` on a given domain e.g.

```
https://rosemary-accounts.co.uk/qa-media/629095bf6f1d232fe9d21f05be7bea2cf8f8d10f
```

Of course, if the sending application also hosted the media in a manner that was available over the internet (e.g. two hosted web services communicating), it would mean that a URI already existed and the generation step could be skipped.For other cases, such as in local applications (desktop / mobile), means that a URI can be generated and sent as part of the associated data entry seamlessly.


###### Receiving Media and Entries with Media
Receiving media (ie files) is straightforward as well. The receiver must make available a URI endpoint `/qa-media`, which accepts a POST request. This request is expected to have form-encoded data with a single field; `media`, which contains the file being sent.

Upon receiving the file, the service must perform the SHA-1 hash to generate the unique key and then store it as they wish, as long as they provide an endpoint under their domain (`/qa-media/sha-1Filehash`) which points to the file. This means that, if they choose to, a web service can decouple the access and storage of the media further by hosting externally and using their endpoint to redirect to another service whilst keeping the URI canonical. This could be done for redundancy, or to control access to the media where appropriate.

### Rosemary Accounts
Rosemary Accounts is a web application that was designed to support the administration work of budgeting and accounting in small charities, as well as supporting the presentation of this information for consumption by workers and stakeholders. It seeks to make information traversable through explicitly presenting links between information in the form of *tags*.

Rosemary was initially designed using the metaphors of commercial accounting software, before extending these to account for curating accounts of work as well as budgeting. Its name reflects this extension -- since [Sage Accounts](https://www.sage.com/en-gb/) was presented as de-facto standard in financial budgeting, so *Rosemary* takes this a step further since Rosemary comes after Sage in the lyrics of popular folk song *"Scarborough Fair"* @_ScarboroughFairBallad_2018.

The following sections detail the behaviour and design rationale for each feature of the design. At one point, an entire side of the application was discarded (a public-facing API) by participant request. This is discussed in this section as a discarded feature.

#### Producing and Viewing Data
Rosemary supports all of the data types outlined in the *QA* JSON schema. It achieves this by mapping entries onto a `Post` object (Fig XYZ), named in reference to a piece of social media content (since in original designs all entries would form a social-media style timeline).

Rosemary provides several interfaces to generate data in the *QA* format; each attending to different matters of work. For example, the *Add Income* interface operates only on the `financial_data` portion of the schema and produces an entry with a positive value for this field. *Add Expenses* also operates on `financial_data`, but produces a negative value. *Add Events* and *Add Images* work on `location` and `media` respectively, without attention to matters of `financial_data`.

When retrieving data Rosemary provides several visual lenses in different formats. For example when looking at income, all that is shown is a table of income values (FIG). When looking at these same entries as a "Post" on a social feed they are displayed in a manner that makes sense using this metaphor (FIG). The more social-oriented interface also provided an interesting design challenge; while Rosemary provides interfaces that operate on the data schema piecemeal, the federated nature of the system meant that other applications could be developed which operated on the schema in a more holistic manner -- and then send this data to Rosemary. In order to account for these variations, the template used to display a "Post" displays UI elements dynamically, building up the item as it finds data in the entry. As such there is no way in Rosemary to produce a single entry containing all of the QA components -- although it is equipped to present such an entry to someone viewing it.

#### Financial Features
The financial features in Rosemary seek to support an organisation with its administrative work of budgeting. This section outlines the interfaces and features that were implemented in attempt to achieve this.


##### Income and Expenditure
Rosemary provides interfaces to produce data about income

#### Customers and Funders
Part of the work in entering income is making sense of where that income is from, and whether it constitutes a funding pot. To assist with this, Rosemary provides an interface for adding *"Customers and Funders"* to the system, which can be mapped to income. Semantically, a Funder would be an entity giving the organisation money in the form of a charitable grant, whereas a Customer would be someone acquiring services from the charity. This was grounded in the fieldwork as Patchwork were noted to be hiring out the Play Centre building, and as such the design needed to accommodate this. This also had the benefit of the system being able to infer a particular level of unrestricted funds; as all income derived from "Customers" would be unrestricted.

Internally, a single `Customer` entity provides the representation of a Customer or Funder in the system. To differentiate between a Customer and a Funder, a boolean `isFunder` is set when creating (see fig). This makes it simple for other interfaces to retrieve an entire list of `Customer` entities, or just those marked as a "Funder".

##### Costing
Costing work was observed to play a significant role in the production of reporting to charitable funders. During "costing", an expense is set against a particular income stream; usually retrofitted and presented in a way that matches the funding restrictions. This can be done for several reasons: to use up money from a particular fund so that the charity does not have to give any back; or to free up money for piece an expense that otherwise cannot be costed elsewhere in the current funding environment.

An interface was implemented to support costing work; in this interface a worker may look over their funders and grants associated with each funder. They then may take any expense that is "uncosted" and associate it with the fund. Conversely, they may "Uncost" an item to remove it from the fund (FIG).

Internally, this is achieved by establishing a one-to-many relationship between `Post` entities. A single Post may have many children, which are the expenses costed to it.

##### Budget Codes
Many organisations use Budget Codes to help label expenses. While Patchwork do not, it was decided to implement Budget Codes to accommodate other organisations. Budget Codes are used in many ways by organisations: some have only a few, some many; some organisations may give them a numeric code, and some choose not to; some allow multiple budget codes to be applied to an expense, whereas some are strict and allow only one. When considered like this Budget Codes effectively take the same form as Tags in that they are short qualitative descriptors that can be applied to mark up information.

Because of this, Rosemary stores Budget Codes internally as `Tag` entities, with additional optional properties `isBudgetCode` and `budgetCodeNumber`. An interface is provided to then add Budget Codes explicitly to the system (Fig). This differs from how other Tags are added; as there is no explicit interface for that and tags are added in-line, extracted in bulk from Posts.

##### Reconciling
An important part of Patchwork's production of their budget is the "reconciliation" of entries (discussed [here](#linkme)). In short; this requires three components to be matched.

1. An entry in the budget tool
2. A bank statement mirroring the transaction
3. A receipt or invoice for the transaction

The actual matching work is performed entirely offline, by the administrator. Once all components are matched, Patchwork mark up the entry in the budget tool as being "reconciled". To mirror this practice, Rosemary provided a checkbox on entries to allow reconciliation and `Post` entities were given the property `isReconciled` to support this. Reconciled expenses and unreconciled expenses are thus able to be looked up at ease.

#### Public-Facing Profile Page
The heavy use of social media by Patchwork influenced the inclusion of a public-facing profile page. The purpose of this page was to act as an alternative form of summary page suitable for a variety of stakeholders, contrasting the reporting style present on the Charity Commission. The design was heavily influenced by Social Media profile pages; with original designs prominently featuring a "Live" timeline of entries which had been entered into the system. There were also several pages branching off of the main profile page:

+ `/gallery`; a portal collecting all Post objects with image data.
+ `/where`; a portal collecting all Post objects with location data, displaying interactive maps.
+  `/tags` or `/what`; a search interface for a visitor to search for posts based on combinations of one or more tags.

Later, discussions with both Patchwork and \[EH\] lead to the adjustment of the profile page's core interaction; it was determined that it was inappropriate to display a "Live" timeline by default due to an organisation's budget being an inaccurate reflection of their finances until finalised for the year (since spends are moved around) and additional concerns were raised over images posted to the site being made public by default -- as both organisations worked with vulnerable people.

The redesign was implemented alongside the addition of the 'Reports' feature (see below). With the redesign, the Live Timeline is turned off by default for every organisation. The public facing profile page will then display a list of Reports that the organisation has chosen to make public. To support the public-facing reports, each Post contained in the Report is made public. The reflection stage during Report generation means that the organisation has the opportunity to adjust the settings of the Report before releasing it, so that they could remove any sensitive information and keep those Posts private. A setting was also introduced onto a user's account, which allowed them to 'opt-in' to display a Live Timeline (which nobody did despite Michael saying it would be a good idea…).

#### (Discarded) Public-Facing API
The original plans envisioned for Rosemary included a public-facing API which provided endpoints to programmatically retrieve information from the service about an organisation. In this way, other applications could be developed to engage with the data in the system in ways not considered by Rosemary. This would have also supported an envisioned 'final stage' of the deployment which included building some lightweight alternative views on the data.

This was discarded due to a mix of concern and apathy on the part of Patchwork when discussing it. As their work didn't necessitate a familiarity with the term API it was discussed in terms of what an API allowed -- namely that it could support other applications retrieving the data they entered (provided entries were public). At first they didn't quite buy the idea that this was necessary, and later expressed somewhat mild concern that the data in the system could be used to present an inaccurate view of the organisation. In order to ensure their continued support, the feature was dropped in case this became off-putting to other organisations in the future as well. Instead, I made sure to discuss with workers how they felt about the *possibility* of data being made available to other applications to make sense of.

#### Reports
Reports in Rosemary were designed to be a flexible way to produce summaries of work and spending, mirroring the way information is recombined by the organisation for various audiences offline already. To create a report, a worker gives the report a title e.g. *"January Manager's Report"*, *"Trustee Report"*, or *"Public Report 2018"* and then sets a number of parameters for the report:

+ **Start Date** and **End Date** can be used to bound the report, and include information only within a given window. These are mandatory.
+ **Expenses Summary** shows the total outgoing money during the time period.
+ **Income Summary** shows the total and sources of all incoming money during the time period.
+ **Images** displays a gallery of images collected during the time period (without tags or description)
+ **Events and Locations** displays a total for, and details of, Posts marked with Location information during the time period
+ **Quotes** displays a gallery of quotes collected during the time period
+ **Tags Summary** displays the most used tags *that are not budget codes* as areas of work and displays most used budget codes as main costs.
+ **Summary of Work by Grant** takes the most used tags attached to Posts that have been costed against a grant during the time period.
+ **Summary of Costs to Grants** presents a table of total costs against various funding sources during the time period.

Choosing to enable or disable individual parameters was designed to allow the organisation to configure the presentation of the report

#### Importing from elsewhere
+ Importing via elsewhere was important for several reasons
+ Mandated by the federated or decentralised architecture -- need some way of swapping data around
+ Allow

##### Via QA endpoint
+ Designed to support multiple theoretical ways to import data across the web
+ Follows the design guidelines of the QA data standard described earlier
+ Allows organisations to generate access tokens, which can be used to add valid devices and identify who's data this is.

+ Earlier versions simply generated the token, and required manual entry on the device or other system.
+ Following some feedback from participants that it was difficult to type out the token, the token was incorporated in to a JSON structure and encoded as a QR code to be scanned on mobile devices
+ This functionality was added to Accounting Scrapbook as a result of this.

##### Via File Upload
+ Brought up by Edbert's House and ratified with GOPA
+ Wanted to get a backlog of data loaded into the system to start working through.
+ Required export from their existing systems (SaGe, Quickbooks) to do so.
+ These supported exporting to CSV, which would also support Patchwork's excel spreadsheet.

+ to account for different formats and writing a new scraper per format, it was decided to go with a flexible approach
+ system allows for a custom "Mapping" between CSV file headings and the metaphors used in Rosemary.

##### In-Tray
+ Way to collect all imported data in one place and notify the admin staff that there was data to be sorted.
+ Later it differentiated between items added remotely via app or via csv import thanks to feedback.
+ Was originally called the "inbox" but everyone thought it was messages from staff not data that had been collected.
+ Renamed "In-Tray" to better match Patchwork's physical boxes of receipts.
+ Accept all and reject all buttons added by request

##### Exporting Data
+ In case the participants were using this to collect and manage serious data it was written to export all financial data
+ Export was done in a basic flattened version (CSV)
+ Limited to financial data as that was deemed the most sensitive and photographs were being duplicated elsewhere

### Accounting Scrapbook
Accounting Scrapbook is a lightweight mobile application that was designed to allow the charity workers to collaborate in collecting and curating information about their work and spending. Within the application, workers may create entries to reflect their everyday work and expenditure such as Images, Quotes, Activities, and Spends. These can then be organised by placing them into one or more *"Scrapbooks"*, allowing them to be grouped thematically and associated with other content.

The following sections details the behaviour and design rationale for each feature of the design.

#### Scrapbooks
+ Named collections related to anything the worker wanted it to be
+ Were tagged so that anything added to this scrapbook had these tags on
+ Entries could be added to multiple scrapbooks, the idea being you could generate complex lists of tags very quickly without much effort by adding entries to multiple scrapbooks at once.
+ Ability to be colour coded, although notes indicate that the free-colour selection should have been more limited
+ originally called envelopes but had a distinctly "financial" feel to them


#### Types of Entry
The types of entry available to produce in *Accounting Scrapbook* are:

* Images / Photographs
* Spending e.g. expenses
* Quotes
* Activities or Events (Location data with descriptors)

These types of entry were produced to mirror the components of the QA data standard (described above). Similar to *Rosemary Accounts*, the application's database does not differentiate between data types and instead stores all entries as a single class. Unlike in *Rosemary Accounts*, Content Inferrence is not used to dynamically display entries. Instead, a single field is used to denote the "type" of entry as understood by the application and display it appropriately.

**Insert UML diagram**


#### Tags
+ Core building block
+ Originally one-word tags but were later adapted to allow spaces and separated by commas.
+ Originally were parsed as specifically hashtags twitter-like @-handles but this was confusing to some so made it more open

#### Adding Entries
The app provides several interfaces for adding an entry to the system, each tailored to providing the information for a different type of entry (Image, Spend, Quote, Activity).

##### Adding Images
Adding an entry with images is done by selecting the *Add Images* button on the main menu, taking you to the Add Image screen (**Figure**). At the top of the screen there is a single button labelled *"Choose Images"*. Selecting this button brings up the phone's gallery interface, allowing you to select one or more images that exist on the device already. When this action is complete, the gallery closes and the first of the selected images is placed on the UI to affirm its selection.

+ originally operated as a camera, but workers mentioned they often took multiple photos at once and this would be a lot of work

##### Adding Spend Data
+ straightforward interface to add spend data.
+ Only spend data is incorporated as the app shouldn't be accommodating grant income

##### Adding Quotes
+ straightforward interface to add quotes data, matching the standard

##### Adding Activities
+ Originally named events but workers found this confusing as events were something big ie "AGMs"
+ This was true across the board.
+ Pressing the button opened a map which allowed you to choose the location for the activity.
+ Those with Google Maps installed had functionality through this, but additional "Open Street Map" compatability was built in if the phone did not have GSF installed.

##### Common Elements
+ Scrapbook dialog box
+ Adding tags was originally done manually but became an auto-complete box after feedback


Discussion
----------------
This section reflects on features and discussions in the design process in order to contribute to teh design requirements of software in this space. In addition to this, comments are made on the appropriateness of techniques utilised develop the designs in this setting.

### Building metaphors and mapping - The work of standards
+ Some of the most important work in the design of the data standard and the tooling was around language used and metaphors
+ Scrapbooks were originally called envelopes and changed. Activities were called Events and had to be changed
+ Rosemary used the metaphor of a budgeting and accounting tool because that's what "made sense" to the workers while it was actually a weird hybrid of social media and data repository.
+ The mapping work was important, coming to the fore during the import data functionality but was present. The idea of a standard is to prevent the need for mapping going forward but the work of standards will require important ways to develop mapping processes to support workers and publishers.


### Open Data, Infrastructure, Tools and Platforms
+ Despite a deliberate design choice to take a decentralised approach workers still viewed it as a platform
+ Lack of engagement around the idea of a data standard
+ More engagement around the design of tools around that, despite the standard being the glue for tools
+ This lead to the standard being iterated on as a result of the tooling whereas the opposite is supposed to be true
+ Charities don't really care about open data so much as they care about being able to do their jobs; and any means that they can use to demonstrate to funders about this is going to be considered
+ That's why the metaphors were important and how the privacy features were built in -- a budgeting tool shouldn't provide a live view so much as snapshots.

### My role as designer
+ Held loads of crits and got feedback on the software but workers did not really take up the "design" mantle
+ Were a lot more engaged when it came to Rosemary and AS but this still didn't translate to a lot of actual sitting down
+ Weren't interested in early sketches, so implementation began before proper feedback was given
+ Again the charity focus was around doing their jobs, despite all romantic notions of "participatory design" they struggled to afford me time every week and crits were threaded through field visits rather than being in a specific "design space"
+ Their work is primarily care-giving in the various contexts (Youth Work, Elderly People, Social Care) and the transparency work around that is just administration or gets in the way
+ Trusted me as a "designer" or "computer person" to build them something that would make their lives easier
+ Designers should consider the political economy of the work they're performing as design-as-a-resource and the capacity for people to design in a participatory way is limited by that context.

Summary / Conclusions
--------------------------------

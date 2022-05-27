### Note
This document is a clone of the README.md document submitted with the assessment for which this project was developed.

Directories have been structured in a specific way to meet the guidelines of the assessment. This cloned document is not part of the assessment, but is included with this repository for context. As such, this document contains non-functional links to images; the links being copied from the original document. It is important for assessment purposes that the linked images function properly in the original document located in the file path the brief demands; necessarily the viewing experience for the version in this repository.

Stay brilliant!

# Hopper Coffee Marketplace

## Source Code

The source code for this project can be found [here.](https://github.com/Champ-Dog/marketplace-app)

Should the link above not function, you can manually enter this URL:

https://github.com/Champ-Dog/marketplace-app

## Deployment

The deployed app for this project can be found [here.](https://still-basin-63741.herokuapp.com/)

Should the link above not function, you can manually enter this URL:

https://still-basin-63741.herokuapp.com/

## Description

The purpose of this application ('Hopper') is to provide a marketplace for the retail of specialty coffee, catered to brewing at home or in the office. It allows merchants to provide coffee beans for sale, and customers to select and purchase from the available products.

Hopper allows users to create an account and profile, and select between *merchant* or *customer* roles. Merchants will have an inventory created for them, where they can upload information and images for the beans they wish to sell. Customer accounts allow the access to carts; which allows a customer to select or remove various products, adjust the amounts, and purchase the selected items.*

Hopper provides functionality to create, edit, or remove addresses; provide and edit profile information and profile images (for example a company logo); and to create, edit, examine, and remove coffees available for purchase. Account functionality such as secure sign-ins, handling and changing of passwords and email address, removing accounts, and logging out after inactivity is provided by the Devise gem.

**Note: Actual purchasing has not been implemented; this is currently approximated by removing all items a customer has selected from circulation on the app*

### Target Audience

The target audience for this application are coffee roasters and consumers in the specialty coffee market. Whilst this accounts for a small portion of the total coffee market, it is a growing sector; and commodity coffees are already widely available and readily accessible both online and in supermarkets.

### Tech Stack

This application makes use of the following technologies, platforms, and languages:

**Website**
- HTML
- CSS
- Bulma CSS framework

**Programming**
- Ruby
- Rails

**Deployment**
- Heroku

**CDN**
- Cloudinary
  
### Sitemap and Navigation

![Sitemap for Hopper coffee marketplace application](./docs/sitemap.png)

The homepage for the site shows the available Coffees. A navbar provides navigation functionality to the app. From the navbar, users can be directed to sign-up or login screens, visit their profile, logout, or return to the home page. Users with customer accounts will also be able to access their carts from the navbar.

From the Account/Profile page, Users will be able to add, edit or remove addresses, and merchants will be able to manage their inventory by creating, editing, or removing available coffees.

### Screenshots

![Screenshot of index/home page](./docs/index.png)

![Screenshot of profile page](./docs/profile.png)

![Screenshot of product page](./docs/product.png)

![Screenshot of Cart page](./docs/carts.png)

![Screenshot of inventory page](./docs/inventory.png)

![Screenshot of a form in the app](./docs/form.png)

## What problem does this project solve?

### Consumers

Currently, to purchase specialty coffee for home use, a consumer must have some amount of prior knowledge: either knowing a particular roasting company, or a cafe that sells retail packs. To purchase coffee online often requires visiting the websites of multiple coffee roasters to find a suitable bean. This is inconvenient, makes comparisons difficult, and limits options.

### Roasters

Roasters have limited opportunities to expand their reach and brand awareness, as online customers must directly visit a company website. Search results and various advertising options often fail to capture the distinction between specialty and commodity providers, encouraging potential customers to "stick to what they know."
Additionally, there is limited ROI for advertising in this market sector, as retail is often a minor portion of total sales.

## Why is this problem worth solving?

Australian coffee consumers are among the most discerning in the world. Internationally, Australia is renowned as a leader in the specialty sector of the coffee industry; and is home to one of the biggest annual events.

However, the specialty coffee industry faces a number of challenges. Supermarkets are increasingly trying to provide "premium" options in the coffee aisle. Major players such as Nestle are acquiring boutique roasting companies to capture some of the specialty market. Pod-based technologies represent a significant improvement in quality over traditional instant coffees, and in convenience and cost compared to many other brew-at-home options. These developments siphon quality-conscious consumers, keeping them in the commodity section of the coffee market; while also converting some existing specialty consumers with a product that is "good enough," or "better," but significantly more available, convenient, and accessible.

Amongst consumers of specialty coffee, there is growing demand for brew-at-home coffee; traditionally a market considered the purview of commodity coffee. This has increased in the wake of the COVID-19 pandemic, with significant shifts towards suburban cafes and home brewing. In the past years, there have been growing attempts by specialty roasters to increase penetration of the brew-at-home market, seen in the adoption of pod and other 'instant' offerings, and increased focus on retail sales in cafes.

This project aims to provide an improved online shopping experience for consumers, by providing a central hub for retail coffees specifically for the specialty sector. For customers, this represents greater convenience in comparing offerings, finding suitable beans, and discovering unfamiliar brands. For the roasters, this represents a low-cost, low-effort solution to drive sales for the brew-at-home market, and to improve reach and brand awareness in a growing market sector.

## Abstractions

This application tracks the following entities:
- Users
- Profiles
- Addresses
- Roles
- Inventories
- Coffees
- Carts

### Users

Users is a model provided by the Devise gem, and is used to track user accounts. This stores and validates email address, stores and encrypts passwords, allows for password recovery, handles user sessions, and other functions relating to securing accounts and secure usage of the app.

The Users sign-up screen also contains fields to collect the necessary information for Profiles.

### Profiles

Profiles track further information about users. Some of the information a Profile requires is intended for billing purposes, however billing and payment are not implemented in the app. However, the app was designed as though these features were included, to simulate a functional commercial application. Specifically, *Names* and *Contact Numbers* are required by the Profile, which would be necessary for live payments.

*Usernames* are to identify a user to other users in the app, without revealing their actual identities. In the case of a merchant, this will likely be their business name. Although neither use-case is currently implemented in the app, Usernames would be used for messaging between customers and merchants, and displayed when viewing a merchant's entire inventory.

*Profile images* can also be attached. This is primarily to allow a merchant to attach a company logo, however it can also be used by customers should they desire it. Most information for the Profile is provided on account creation, along with the *User* information; but profile images are provided later (if at all) through the 'Account' page which displays profile and address information.

Profiles are the "foundation" for many features of the application. Profiles have roles assigned to them, determining what actions, visual elements, and other entities are available in the app. They connect a user to their addresses, inventories (for merchants), and carts/orders (for customers).

### Addresses

Addresses are also included to simulate a "live" purchasing environment. These are separate to Profiles for both functional and philosophical reasons: Profiles are meant to represent or track the end-user, merchant or customer. An individual or organisation may *have* an address, but is not part of them. Functionally speaking, there are situations where a user may want to store multiple addresses. This is included in one of the user stories for an app, where a customer may want to store addresses for deliveries to home and a workplace.

### Roles

Roles have been implemented through the Rolify gem. These are used to represent the differences between a customer and a merchant in the application. Authorisation for different actions depends on the role assigned to a particular profile, as well as other behaviours. For example, when the *merchant* role is assigned to a Profile, an inventory is also created and associated with that Profile. The merchant role also allows the creation of Coffees in the app. The *customer* role allows the creation of Carts, which are discussed in detail below.

Roles will also influence what is visible to a user of the app: merchant accounts will not see options to "add to cart" for coffees, or to "view cart", and customers will not see the option to view or manage an Inventory, for example.

### Inventories

Inventories primarily serve as a "container" for Coffees. Their implementation has changed somewhat from the initial design of the app. Originally, an Inventory would keep track of stock levels for various coffees as well as; but it was decided during development to instead move this function to the Coffee model instead. 

As such, Inventories currently add little to the functionality of the app (the conceptual desire for a merchant to manage their inventory separately to their profile aside). Inventories will allow in future for merchants to have a "shopfront" within the application, where customers can see all of their available products outside of the mixed coffee index currently available.

In the current implementation, the current functional contribution of Inventories is to provide a separate page for merchants to manage, add, and remove Coffees.

### Coffees

These track the core product for sale in the application, and obviously need to be modelled accordingly. Coffees include information such as region, name, price, and available quantity. There is also information about roast style (i.e., filter, espresso, or multipurpose "omni" roasts), to allow customers to make better decisions about what coffee is best suited to their preferences and needs. Coffees can also be given a description, which a merchant can use to describe the flavour of a coffee, or other interesting characteristics they may wish to convey to customers.

### Carts

Carts serve a dual-purpose in the application. They fill the role of a "shopping cart" that is common to many online retail applications, and are also used to simulate purchases in lieu of a "live" environment. Carts are implemented as a joining table for Profiles and Coffees, allowing a user to select coffees for later purchase. While each "add to cart" action actually creates a separate item/record in the database, the user experience affords the imitation of a single collective cart, without the need for a separate database entity.

The "View Cart" experience is provided by returning all records associated with the current user's Profile, and from this page the user may also increase or decrease the amount of a particular item, or remove it. As coffees are added or removed, the available quantity of that coffee is adjusted appropriately. Purchasing is mimicked by destroying all cart records associated with the user *without* refunding the coffee quantity, effectively taking the purchased items out of circulation in the app.

## ERD and Database Relations

![ERD diagram for Hopper coffee marketplace app](./docs/market_erd_v1.2.4.png)

*Users* has: 
- "One mandatory to one mandatory" relationship with a *Profile*

*Profiles* has:
- "One mandatory to one mandatory" relationship with a *User*
- "One mandatory to many optional" relationship with *Addresses*
- "One mandatory to one optional" relationship with an *Inventory*
- "One mandatory to many optional" relationship to *Carts*

*Addresses* has:
- "Many optional to one mandatory" relationship to *Profiles*

*Inventories* has:
- "One optional to one mandatory" relationship to *Profiles*
- "One mandatory to Many optional" relationship to *Coffees*

*Coffees* has:
- "Many optional to one mandatory" relationship to *Inventories*
- "One mandatory to many optional" relationship to *Carts*

*Carts* has:
"Many optional to one mandatory" relationship to *Coffees*
"Many optional to one mandatory" relationship to *Profiles*

Rolify provides a *Roles* table, which has a "One mandatory to many optional" relationship to *Profiles_Roles* (and vice-versa), which itself has a "Many optional to one mandatory" relationship to *Profiles* (and vice-versa). These are not included in the ERD as they are implemented separately through the Rolify gem and did directly impact the design of the application.

## Models and Relations

The **User** model, created through Devise, handles authentication for the app. It `has_one` Profile, meaning it can be associated to one Profile. This association does not necessarily enforce that it *must* have a Profile, but this is functionally enforced by the configuration of the app. Information for a Profile model is collected simultaneously to User information, and a Profile built. A Profile cannot be built without valid information in each of it's fields, meaning an error will be raised if an attempt is made to sign up as a new User without also providing information for the creation of a Profile.

An instance of the **Profile** model `belongs_to` a User model. It *must* be linked to a User account to be valid, through a `user_id` reference. A Profile `has_many` Addresses, meaning it can have one, none, or multiple Addresses associated to it. A Profile also `has_one` Inventory and `has_many` Carts: neither of these relationships are intended or implemented to be mandatory. 

Note: A Profile can also have one, or many, roles; which is handled by Rolify. Rolify generates a *Roles* table, and a joining table between Profile and Roles, to avoid a hypothetical "many-to-many" relationship, as a Profile may have many Roles and a given Role could be shared by many Profiles. However, in the current implementation, a Profile can only have one of two Roles, as the visual elements and Controller actions that assign roles are conditional on a role having not yet been assigned.

An instance of the **Address** model `belongs_to` a Profile model. It cannot be created, and is not valid, without this association through a `profile_id` reference. There is not any model that `belongs_to` an Address.

The **Inventory** model functions as a "container" for Coffees. An instance of this class will `belong_to` a Profile, which is mandatory - and Inventory instance cannot exist without a valid association to a Profile. It `has_many` Coffees, which is optional: it may have none, one, or many Coffees associated to it.

The **Coffee** model represents the coffees being sold on the platform. A given Coffee object `belongs_to` an Inventory; this association is mandatory. A Coffee `has_many` Carts associated to it; this phrase sounds unusual but is explained in the next paragraph. The relationship to Carts is optional: a Coffee is not intended to require a cart.

The **Carts** models represents transactions to take place on the platform. A given Cart `belongs_to` both a Profile (the buyer), and a Coffee (the item being purchased); one of each only. These associations are both mandatory, a Cart object cannot exist without being associated with both a Profile and Coffee. The intended implementation allows a user a "View Cart" function, will return all Cart records associated to their profile. These records are deleted upon purchase.

## Schema

![Schema diagram for the application, including the Roles and Profiles_Roles tables absent in ERD](./docs/market_schema.png)

## Third-Party Services

This project makes use of two third-party services. *Heroku* is used for deployment/hosting; and *Cloudinary* is used as a Content Delivery Network for image hosting.

## User Stories

**Zach:** As a business owner, I want to be able to create a merchant account, so that users will know they can buy from me.
**Paul:** As a business owner, I want to be able to offer a selection of whole beans to customers for at-home use.
**Dan:** As a roaster, I want to be able to track and update our available inventory, so that we (and customers) know how much we have available.
**Kobi:** As a merchant, I want to upload images and descriptions of our product to better entice customers.
**Kate:** As a customer, I want to select multiple items from different roasters, so I don't have to order one-at-a-time.
**Kate:** I also want to be able to check and manage what coffees I have selected, so I can change my orders before purchase.
**Jay:** As a customer, I want to be able to choose from different roast profiles, so I can choose the best beans for my brew method.
**Lauren:** As a customer, I want to be able to store multiple addresses, so I can order for home and for the office.
**Patrick:** As a customer, I want to keep my account secure, so I can shop confidently.
**Terry:** I want to be able to create an account in the app, to save my details for later use.
**Terry:** I also want to be able to delete my account, so that my information isn't unnecessarily stored online.
**Kristen:** I want to be able to create a customer account, to make purchasing simple.
**Josh:** I want to be able to edit information in my account, so I can keep it up-to-date when things change.
**Nathan:** As a customer, I want to search by different origins and roast profiles, to find the bean that's right for me.* - Marked for optional implementation if time permits
**Janet:** As a roaster, I want to be able to message customers regarding orders, to confirm details or highlight any issues.* - Marked for optional implementation if time permits

## Task Allocation and Tracking

This type of planning and organisation is definitely not one of my strengths, so the implementation has been sub-optimal. Allocating and tracking tasks throughout the project involved a combination of a [Trello/Kanban board](https://trello.com/b/9VKAXyq9/hopper), a development journal/log, a collection of sticky notes and pages torn from notebooks, and a moderate amount of "this feels like what should be done next."

After attaining approval for the proposal, user stories were developed and then transferred to the project Trello board (if the link above is not working, the URL is https://trello.com/b/9VKAXyq9/hopper). Many of the high-level components of the app (most of the necessary models, for example) were apparent; between these and the User Stories it was possible to discern most of the major tasks required. On the board, cards were created for each of the high-level components, other features, and some of the configuration tasks that would be necessary to make the app work as intended. Many of these cards were also assigned User Stories to which they specifically related. Models and other high-level components were assigned checklists denoting the separate tasks required for their proper implementation (see image below). Some of these cards were moved immediately to the "Backlog" section, as features that were non-essential. Several more cards were added as the project continued and new tasks were realised or small pockets of work became necessary.

![Image of Kanban card for Inventory model, showing checklist of steps for completion](./docs/trello.png)

The project met with several initial setbacks, which made predicting time for tasks difficult. Only a few of the cards on the Kanban were assigned due dates, and of these, several went past their deadlines.

A daily development journal was kept for the majority of the project, detailing what tasks were underway, some of the problems encountered, attempted solutions and approached, and what had been completed/needed more work the next day. This journal also included a "To-Do" list of outstanding tasks that arose during development that were not foreseen in the initial planning. There was some amount of overlap between these and some of the cards added to the Kanban board, mostly to ensure they were seen and attended to. However, several items on the journal To-Do List were not suitable for the project board, such as noting specific bugs or errors that were encountered. The journal was also used to store specific code snippets that were removed from an area of the code base but might be needed elsewhere. 

![Image showing part of development journal](./docs/journal.png)


## Wireframes

![Image showing wireframe for Coffee Index](./docs/wireframe-index.png)

![Image showing wireframe for individual coffee pages/'show'](./docs/wireframe-product.png)

![Image showing wireframe for Profiles](./docs/wireframe-profile.png)

![Image showing wireframe for Forms](./docs/wireframe-forms.png)
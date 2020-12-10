# Changelog
All notable changes to this project will be documented in this file.

## [2.2.0] - 2020-12-10

### ConnectCore [2.1.0]
#### Added
- Added in3 payment method
- Added support for preselected default payment method in the checkout

#### Fixed
- IP Address is now filtered, preventing error when retrieving 2 ip addresses from the customer.
- Fix error 'Type "" is not a known type.' when placing a backend order with a non-MultiSafepay payment method.

### ConnectAdminHtml [1.2.0]
#### Added
- Added configuration for in3 payment method
- Add configuration option for choosing default preselected payment method in the checkout

### ConnectFrontend [1.2.0]
#### Added
- Added in3 to checkout
- Added support for preselected default payment method in the checkout

## [2.1.1] - 2020-11-30

### ConnectCore [2.0.1]
#### Fixed
- Fixed instantiation error of fileDriver interface in backend and after placing a transaction
- Disabled Billing Suite payment methods for admin backend orders

### ConnectAdminHtml [1.1.1]
#### Fixed
- Fixed instantiation error of fileDriver interface in backend and after placing a transaction

## [2.1.0] - 2020-11-11

### ConnectCore [2.0.0]
#### Added
- Added support for order currency
- Added Good4Fun gift card
- Added support for custom transaction description and custom refund description
- Added MultiSafepay refund_id to the refund transaction in the Magento Payment.
- Added http-factory-guzzle package as a dependency for PSR-17 factories
- Added an event for adding or changing the transaction request data before it is sent to MultiSafepay
- Added support for Magento 2.4.1 and PHP 7.4
- Added delivery details to every transaction request
- Added user-agent to every transaction request

#### Fixed
- Trying to refund with 0 amount will now throw an error
- Disable Second Chance for admin backend orders
- Added support for all the street lines (Before only street line 1 and 2 were supported)
- Added dependencies in module.xml and composer.json

#### Removed
- Removed the use of pending_payment order status. For new orders, the 'new' order state will be used.
- Removed version constant. Versions are now retrieved from the composer.json file
- Removed custom factories to be replaced by http-factory-guzzle factories

#### Changed
- Rebrand Klarna to the latest standards
- Upgraded the PHP-SDK to version 4

### ConnectAdminHtml [1.1.0]
#### Added
- Added Good4Fun gift card to the gift cards configuration
- Added custom description configuration fields
- Added a section in the 'General Information' tab where all the MultiSafepay module versions can be found
- Added a configuration option for using either the base currency or order currency

#### Fixed
- Added dependencies in module.xml and composer.json
- Removed setup_version from module
- Enabled all configuration fields to be configured for seperate store views
- Fixed the link to the Github CHANGELOG.md in the 'General Information' tab

#### Changed
- Changed the config settings to 'Stores > Settings > Configuration > MultiSafepay' due to exceptionally large POST data 
on the 'Payment Methods' page
- Rebrand Direct Bank Transfer to Request To Pay
- Rebrand Klarna to the latest standards

### ConnectFrontend [1.1.0]
#### Added
- Added Good4Fun gift card to the checkout
- Added missing gift card logos

#### Fixed
- Fixed notification url leading to ReflectionException on some server configurations
- Fixed error message when SecureToken parameters are missing
- Added support for Magento terms and services checkbox agreement
- Added dependencies in module.xml and composer.json
- Removed setup_version from module
- For some billing suite methods, an automatic invoice will not be sent anymore

#### Changed
- Rebrand Klarna to the latest standards
### ConnectMSI [1.0.1]
#### Fixed
- Added dependencies in module.xml and composer.json

### ConnectCatalogInventory [1.0.1]
#### Fixed
- Added dependencies in module.xml and composer.json

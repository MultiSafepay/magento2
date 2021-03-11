# Changelog
All notable changes to this project will be documented in this file.

## [2.5.0] - 2021-03-11
#### Added
- Added 3 generic gateways and 3 generic giftcards.
- Added customizable pending_payment status when redirecting to the payment page.
- Added the possibility to modify the "Success page" and cancel payment return URLs for PWA storefronts.
- Added compatibility for the MagePrince ExtrafeePro extension. (Payment fees are now correctly displayed in the checkout)

#### Fixed
- Fixed missing preselected flag for creditcard gateways
- Fixed wrong default title in the config for American Express.
- Fixed a checkout error when creditcard is preselected
- Fixed a bug where recurring methods that are used for Magento Vault were always active

#### Changed
- Code refactoring in the generic gateways and transaction shopping cart parts of the plugin for code improvement, readability and better performance.
- Refactored the payment components by decreasing the amount of javascript files
- Changed composer dependencies to support Magento 2.2.
- Removed the recurring methods from the default preselected payment method list.

## [2.4.0] - 2021-02-22
### Added
- Added generic gateway feature for the possibility to add a gateway, which you can customize yourself.
  For more information, please see our [Magento 2 plugin docs](https://docs.multisafepay.com/integrations/plugins/magento2/).
- Added Magento 2 Vault support for credit card payment methods. For more information about the Magento 2 Vault feature, please see [Magento DevDocs](https://devdocs.magento.com/guides/v2.4/payments-integrations/vault/vault-intro.html)
- Added support for Magento 2 Instant Purchases (Works only for Vault supported payment methods). Please see the guide how to use and configure Magento 2 Instant purchase feature in [Magento DevDocs](https://docs.magento.com/user-guide/sales/checkout-instant-purchase.html)
### Changed
- Code refactoring in big parts of the plugin for code improvement, readability and better performance

## [2.3.1] - 2021-02-16

#### Added
-  GraphQL support in a separate module [multisafepay-magento2-graphql](https://github.com/MultiSafepay/magento2-graphql)

### ConnectCore [2.2.1]
#### Fixed
- Fixed undefined index for Afterpay and in3
- Fixed wrong api key being used for MultiSafepay requests with a multi store setup
- Fixed wrong store locale being sent in orders that were created in the admin backend

### ConnectAdminHtml [1.3.1]
#### Fixed
- Alphabetically ordered the payment gateways in the 'Payment Gateways' tab and 'Default selected method' list

### ConnectFrontend [1.3.1]
#### Fixed
- Fixed wrong api key being used for MultiSafepay requests with a multi store setup
- Fixed order status sometimes not going to processing after it has been invoiced

## [2.3.0] - 2021-01-26

### ConnectCore [2.2.0]
#### Added
- Added support for Mageplaza Reward Points

#### Fixed
- Fixed wrong store locale being sent in admin backend orders
- Fixed Uncaught TypeError with string to float conversion for Fooman Surcharge
- Fixed order e-mails not being sent in some cases for backend orders

#### Changed
- Added retrieval of icons from local directory for Givacard, Wellness gift card and Winkel Cheque
- Improved custom totals and added support for exclusions

### ConnectAdminHtml [1.3.0]
#### Added
- Added sensitive and environment types to configuration fields
- Added configuration field for excluding custom totals

### ConnectFrontend [1.3.0]
#### Added
- Added function to restore quote when using back button on the MultiSafepay payment page
- Added icons for Winkel Cheque, Wellness gift card and Givacard

#### Fixed
- Fixed bug "Uncaught TypeError: Cannot read property 'observe' of undefined"
- Fixed duplicate id's for birthday checkout field for in3 and Afterpay

#### Changed
- Changed the way checkout fields are observed and default method is selected.
- Updated Trustly logo to new branding standards

#### Removed
- Removed duplicate check for sending invoice e-mail

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

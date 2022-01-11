# Changelog
All notable changes to this project will be documented in this file.

## [2.16.0] - 2022-01-11
### Added
- Added checker if order is actually processing before returning 'ok' for notification requests
- Added options for selecting separate behaviours of cancelling MutliSafepay order payment link
- Added options for selecting separate order status for different MultiSafepay statuses
- Added error when using adjustment for shopping cart refund

### Changed
- Shipping prices excluding tax are now re-calculated based on the shipping prices including tax

### Fixed
- Fixed an issue where sometimes no error message shown with declined AfterPay transaction
- Fixed an issue where validate API key button uses default store view always (Thanks to @thlassche)
- Fixed an issue where encrypted password doesn't get correct
- Fixed an issue where failed shopping cart refunds in rare cases wouldn't be able to log ApiException and ClientExceptionInterface errors.
- Fixed an issue where the setting order comments fails on Magento 2.4.3 (Thanks to @Tjitse-E)
- Fixed an issue where the wrong Api key is used to generate SecureToken (Thanks to @Hexmage)
- Fixed an issue related to Swagger error

## [2.15.0] - 2021-11-30
### Added
- Added a separate option for when to send the order confirmation email for the Bank Transfer payment method
- Added a button to verify the API Key before saving the config.
- Added compatibility with [Adobe Commerce Gift Card Accounts](https://docs.magento.com/user-guide/catalog/product-gift-card-accounts.html)
- Added back REST API compatibility, including an end point for retrieving the payment link after order creation.
- Added the possibility to fetch transaction data in the transaction overview.

### Fixed
- Fixed an issue where the wrong shipping tax rate was being sent when using VAT ID validation
- Fixed an issue where frontend fetches API tokens for CC component, while payment type is configured as redirect (Thanks to @thlassche)

### Changed
- Changed the API Key fields to be obscured for added security, they are now also stored with encryption provided by the Encryptor from the Magento Framework
- Updated the credit card logo
- MultiSafepay Account data is now dynamically retrieved via an API request for Google Pay Direct
- Improved logging for Magento payment gateway, client and shipping requests.
- Changed the Google Pay button background to be transparent instead of white.
- Made changes in the way the payment link is retrieved from the order.
- Extended direct ApplePay with requiredBillingContactFields

## [2.14.2] - 2021-11-03
### Fixed
- Fixed an issue with AfterPay Date of Birth date picker field

## [2.14.1] - 2021-11-01
### Fixed
- Fixed an issue related to empty Edenred payment method config

## [2.14.0] - 2021-10-29
### Added
- Added iDEAL and Direct Debit Vault
- Added Edenred

### Fixed
- Fixed an issue with Vault and Manual capture
- Fixed an issue where the transaction type for Direct Debit would not be saved

### Changed
- Changed the dependency on Guzzle6-adapter from '*' to '^2.0', because Guzzle6-adapter '^1.0' does not implement Psr-7
- Changed composer type from 'library' to 'metapackage'
- Changed the Vault 'Save for later use' checkbox to be default unchecked instead of checked for MultiSafepay payment methods
- Changed the module to not only return an 'ng' on notification failure and show more information about why the notification process failed

## [2.13.0] - 2021-10-15
### Added
- Added Apple Pay Direct
- Added Google Pay Direct/Redirect
- Added WeChat Pay Redirect

### Fixed
- Fixed an error notice when postal code was left empty (Thanks to @thlassche)
- Fixed Credit Card Payment Component not showing on IE due to new JS syntax (thanks to @thlassche)
- Fixed the utm_nooverride parameter not being picked up in Google Analytics because of a trailing slash (Thanks to @peterjaap)

### Changed
- Changed the placement of the iDEAL issuers dropdown to be on top of the billing address instead of below it.

## [2.12.4] - 2021-10-07
### Fixed
- Fixed a refund issue for manual captured payments

### Changed
- Updated the MultiSafepay credit card component javascript library from V1 to V2.

## [2.12.3] - 2021-10-04
### Fixed
- Fixed a bug where division by zero issue appeared for custom totals in getting tax rate method.
- Fixed a bug where an error would be thrown if the locale was null.
- Fixed a bug with the FPT/WeeeTax calculation when set excluding tax.

## [2.12.2] - 2021-09-07
### Fixed
- Fixed a bug where some specific orders with other than credit card payment methods couldn't be refunded.
- Fixed an issue where invoice emails were being sent after some time for orders with Billing Suite payment methods from the legacy plugin.
- Fixed an issue where there were duplicate controllers with the legacy plugin, causing an error on transaction placement.

## [2.12.1] - 2021-09-02
### Fixed
- Fixed a bug related to incorrect shipping tax calculation with a specific tax configuration.
- Fixed a bug which causes an 'Integrity constraint violation: 1052 Column ‘increment_id’ in where clause is ambiguous' error if there is another increment_id.

## [2.12.0] - 2021-08-27
### Added
- Added compatibility with Adobe Commerce Gift Wrapping plugin.
- Payment links can now be used for both order confirmation emails and order comment emails.

### Changed
- Code refactored for order service methods.
- We are now removing sensitive data from the payment after the customer has been redirected.
- Changed the resolution of payment icons to be more in line with Magento core payment icons
- Added date picker field for Date of Birth checkout fields to further increase the consistency of input
- Dropped support for Magento 2.2.x versions.
- Deleted unnecessary order savings for better performance
- Changed event listeners from controller_action_predispatch to backend_auth_user_login_success for checking the new released plugin versions. (Thanks to @Tjitse-E)
- Improved the UX/UI for General Information page

### Fixed
- Fixed a bug where some POST notification can be restricted because of CSRF validation.
- Fixed PHP Mess detector issues.
- Fixed a bug where Vault cards would not be stored because of a type error.
- Fixed a bug where for some custom totals with a value of '0.0' an error would occur on transaction creation.

## [2.11.0] - 2021-07-30
### Added
- Added automatic cancellation of MultiSafepay pretransactions for non-paid canceled orders.
- Added plugin version to the system report log
- Added possibility to skip automatic invoice creation after MultiSafepay payment.

### Fixed
- Fixed a bug where manual invoices for backend created orders did not go to processing state.
- Fixed a bug where filling in certain wrong values for the Date of birth field for AfterPay and in3 caused an error
- Fixed a bug where "Unable to unserialize value" errors were logged for every product.
- Fixed a bug where the shipping description in the transaction would cause an error if it was null (thanks to @florisschreuder)
- Fixed a bug where some header elements were still visible inside the checkout (Thanks to @Davie82)
- Fixed a bug where the MultiSafepay payment component external js file could not be loaded when using Magento javascript minification

### Changed
* Improved several UI and UX elements:
  - Added a notice with a link to the MultiSafepay Account under the API key field
  - Added enabled/disabled indicators next to the gateways and giftcards
  - Added a MultiSafepay mention to the Payment configuration page at *Stores > Configuration > Sales > Payment Methods* with a link to sign up. Clicking on configuration will redirect to the MultiSafepay General Settings page

## [2.10.2] - 2021-07-20
### Fixed
- Fixed a bug where the default store url was being used for payment links in backend orders.
- Fixed a bug related to generating secure token in Magento Open Source 2.4.2
- Fixed a bug where shopping cart refunds with 0 amounts would not throw an error. (Thanks to @reense)
- Fixed a bug where if an FPT is used, it in some cases wouldn't get picked up

## [2.10.1] - 2021-06-25
### Fixed
- Fixed a bug related to TypeError in ShipmentSaveAfterObserver. (Thanks to @Davie82)
- Fixed a bug related to GET notifications where orders would stay in pending_payment status
- Removed trailing comma for compatibility with IE11 in frontend plugin. (Thanks to @barryvdh)

## [2.10.0] - 2021-06-17
### Added
- Added support MultiSafepay Credit Card component support for credit card payment methods.
- (dev) Added integration test coverage for secure token class, custom total builder and additional data builders.

### Fixed
- Fixed a bug related to special cases where some invoices skip the order payment method.
- Fixed a bug related to wrong showing qty on the payment page for items with decimal qty
- Fixed issue related to preselected customer group id for customer session
- Fixed support page typo's.

### Changed
- Moved setting pending_payment status from Redirect controller to Gateway Request Builder
- Changed the notification method from 'GET' to 'POST'.
- Updated the PHP-SDK version to version 5.
- Dropped support for PHP 7.1. Because of this, Magento versions up to version 2.2.9 are not supported anymore.
- Improved the logging for the notification actions

## [2.9.0] - 2021-06-03
### Added
- (dev) Added integration test coverage for all the plugin utils, services and order request builders.
- Added check if order was paid by gifcard, then will change payment method to one of giftcard payment methods.
- Added translations for some checkout fields. (Thanks to @Davie82)
- Added possibility to translate description phrase on MultiSafepay payment page.
- Added new logo for Bancontact payment method.

### Fixed
- Fixed a bug related to combined payment filters.
- Fixed a bug where in some cases the customer group id would retrieve wrong value.
- Fixed a bug where in some cases the shipping tracks array can't contain 0 index.
- Fixed TypeError for MultiSafepay payment method on notification.
- Fixed a bug where the checkout would restore the first quote, when trying to create a second order in the same session.

### Changed
- Deleted sensitive payment data from the transaction logs.

## [2.8.1] - 2021-05-19
### Fixed
- Fixed a bug in payment validation transaction type constant scope, changed it from private to public.
- Fixed a bug in AfterPay and in3 payment methods related to phone_number field name.

## [2.8.0] - 2021-05-12
### Added
- Added separate phone number field for AfterPay & in3, which will already be filled in if the phone number is present in the billing address.
- Added notification about new versions of plugin in admin panel.
- Added System report to downloadable log archive for improved debugging.
- Added the possibility to change direct gateway methods to redirect.

### Fixed
- Fixed a bug where 'File not found' error would occur when trying to download log files with ROOT path set to 'pub'.
- Fixed a bug where in some cases the order confirmation e-mail would be sent when a transaction is expired. (Thanks to @basvanpoppel)

### Changed
- Changed the logs zip archive to be stored temporarily inside the var/tmp directory instead of the root directory.
- Changed the retrieval of the shipping tax from a calculation based method on the amount to retrieving it via a rate request to improve the accuracy.
- Changed the info logs into debug and added transaction data to the log. Also deleted unnecessary multisafepay-debug.log file.

## [2.7.1] - 2021-04-19
### Changed
- Code refactored for gateway additional data validators.
- (dev) Orders are now being retrieved with OrderRepositoryInterface instead of OrderInterfaceFactory
- (dev) Reduced multiple orderRepository save calls

### Fixed
- Fixed an issue where the shipment status update was only being done in the adminhtml scope. It will now trigger from all scopes, including the REST API.
- Fixed validators giving an error when field for choosing specific has been left empty
- (dev) Fixed DS constant not being available and replaced it with DIRECTORY_SEPARATOR constant

## [2.7.0] - 2021-04-09
### Added
- Added option to set no default for default selected payment method.
- Added a download button to download a zip file with the MultiSafepay log files

### Fixed
- Fixed an error that happened when trying to open orders with an expired transaction.
- Fixed issue related to a missed tax amount in Fooman Surcharge custom totals
- Fixed error when choosing 'miss' gender with AfterPay
- Fixed an error that happened during checkout when there is a custom total in the cart with float as a string value ("0.000")
- Fixed issue where default pending status would get used instead of the one from the MultiSafepay config

### Changed
- For bank transfer payments, the redirect to the payment page has been brought back. Like with Magento 1, customers will now get redirected to the payment page where they can see the bank transfer details.

### Removed
- Removed order status check and reopening a cancelled order process from the Success controller, since it is already being done by the Notification controller instead.

## [2.6.0] - 2021-03-26
### Added
- Added support for disabling the shopping cart on the MultiSafepay payment page
- Added information about the Magento edition to the order request.
- Added additional quote masked_id and entity_id parameters to the cancel and success payment urls

### Fixed
- Fixed error when creating transaction without available phone number
- Fixed a bug where the wrong processing status was set for the notifications

### Removed
- Removed obsolete emandate field from Direct Debit checkout

### Changed
- Changed validation for direct payment methods to prevent 400 (Bad Request) errors on selecting payment method
- Improved the logging for the notification offline actions

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
- Fixed undefined index for AfterPay and in3
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
- Fixed duplicate id's for birthday checkout field for in3 and AfterPay

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

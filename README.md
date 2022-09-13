<p align="center">
    <img src="https://camo.githubusercontent.com/517483ae0eaba9884f397e9af1c4adc7bbc231575ac66cc54292e00400edcd10/68747470733a2f2f7777772e6d756c7469736166657061792e636f6d2f66696c6561646d696e2f74656d706c6174652f696d672f6d756c7469736166657061792d6c6f676f2d69636f6e2e737667" width="400px" position="center">
</p>

# MultiSafepay plugin for Magento 2

[![Build](https://img.shields.io/github/workflow/status/multisafepay/magento2/ExtDN%20Static%20Analysis?style=for-the-badge)](https://github.com/MultiSafepay/magento2/actions)
[![Codecov](https://img.shields.io/codecov/c/github/multisafepay/magento2-core?style=for-the-badge)](https://app.codecov.io/gh/MultiSafepay/magento2-core)
[![Latest stable version](https://img.shields.io/github/v/release/multisafepay/magento2?style=for-the-badge)](https://packagist.org/packages/multisafepay/magento2)
[![Total downloads](https://img.shields.io/packagist/dt/multisafepay/magento2?style=for-the-badge)](https://packagist.org/packages/multisafepay/magento2/stats)
[![License](https://img.shields.io/github/license/multisafepay/magento2?style=for-the-badge)](https://github.com/MultiSafepay/magento2/blob/master/LICENSE.md)

Easily integrate MultiSafepay payment solutions into your Magento 2 webshop with our free plugin.
The latest release includes unit/integration testing and it is built on the Magento payment provider gateway structure.

Before you get started, read MultiSafepay Docs - [Magento 2](https://docs.multisafepay.com/docs/magento-2) for:

- Supported payment methods
- Upgrades from version v1.14 and below

## About MultiSafepay

MultiSafepay is a collecting payment service provider, which means we take care of electronic contracts, technical details, and payment collection for each payment method. You can start selling online today and manage all your transactions in one place.

## Prerequisites

- You will need a [MultiSafepay account](https://testmerchant.multisafepay.com/signup). Consider a test account first.
- Magento Open Source version 2.3.x & 2.4.x
- PHP 7.2+

## License
[Open software license (OSL 3.0)](https://github.com/MultiSafepay/Magento2Msp/blob/master/LICENSE.md)

## Modules

The plugin consists of several modules:

- [multisafepay-magento2-core](https://github.com/MultiSafepay/magento2-core): Provides core functionalities
- [multisafepay-magento2-frontend](https://github.com/MultiSafepay/magento2-frontend): Enables payment gateways in the Magento checkout
- [multisafepay-magento2-adminhtml](https://github.com/MultiSafepay/magento2-adminhtml): Enables/disables payment gateways and edits settings in the Magento backend
- [multisafepay-magento2-msi](https://github.com/MultiSafepay/magento2-msi): Handles stock when MSI is enabled
- [multisafepay-magento2-catalog-inventory](https://github.com/MultiSafepay/magento2-catalog-inventory): Handles stock when MSI is disabled
- [multisafepay-magento2-graphql](https://github.com/MultiSafepay/magento2-graphql): Extends and adds GraphQL queries and mutations
- [multisafepay-magento2](https://github.com/MultiSafepay/magento2): Meta package that installs all above modules

### Module dependencies
The meta-package has a dependency on MSI. This means the MSI modules must be available (but not necessarily enabled) in your store.

If you have removed MSI (e.g. with a composer-replace trick like [yireo/magento2-replace-inventory](https://github.com/yireo/magento2-replace-inventory)), you can't install the meta-package. To integrate with MultiSafepay, instead of installing the meta-package, install the magento2-frontend module and the magento2-catalog-inventory module.

The magento2-frontend module has a dependency on the magento2-core and magento2-adminhtml modules, so they are all installed together. In some cases, you also then need a stock-handling module. Since MSI is not available, you can install the magento2-catalog-inventory module instead.

The installation process is the same for the Adobe Commerce version.

## How to install

1. For developers, we recommend installing the composer packages separately so you can finetune which modules you need.

For merchants, we recommend installing the whole package via composer:

```
composer require multisafepay/magento2
```

2. To enable all MultiSafepay modules, run the following:
   
```
php bin/magento module:enable MultiSafepay_ConnectCore MultiSafepay_ConnectAdminhtml MultiSafepay_ConnectFrontend
```

3. When you disable MSI in Magento 2, you must also disable the MultiSafepay MSI module by running:
```
php bin/magento module:enable MultiSafepay_ConnectMSI
```

4. If you have a Magento 2 environment with MSI disabled, to enable the MultiSafepay CatalogInventory module instead, run:
```
php bin/magento module:enable MultiSafepay_ConnectCatalogInventory
```

5. Run the following commands:
```
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy
```

### Versioning

This package installs multiple modules that are available in other repositories via composer.
Unlike the separate modules it installs, it does not adhere to semantic versioning.
To find out which version you are running for the seperate modules, run the following:

```
composer show -v | grep multisafepay
```

## Support

- Create an issue on this repository.
- Email <a href="mailto:integration@multisafepay.com">integration@multisafepay.com</a>
- Start a conversation on our Magento Slack channel [#multisafepay-payments](https://magentocommeng.slack.com/messages/multisafepay-payments/).

## Contributors

If you see an opportunity to make an improvement, we invite you to create a pull request, create an issue, or email <integration@multisafepay.com>

As a thank you for your contribution, we'll send you a MultiSafepay t-shirt, making you part of the team!

## Want to be part of the team?

Are you a developer interested in working at MultiSafepay? Check out our [job openings](https://www.multisafepay.com/careers/#jobopenings) and feel free to get in touch!

#!/bin/bash
composer config github-oauth.github.com $GLOBAL_GITHUB_TOKEN

REPO_SUFFIX=""
if [[ $GITHUB_REPOSITORY == *"internal"* ]] ; then
    REPO_SUFFIX="-internal"
fi

# PHP-SDK
if [[ $(curl -s -u ${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN https://api.github.com/repos/MultiSafepay/php-sdk${REPO_SUFFIX}/branches | grep -iGc '"name": "'${CURRENT_HEAD_REF}'"') == 1 ]]; then
    PHP_SDK_BRANCH_NAME=${CURRENT_HEAD_REF}
else
    PHP_SDK_BRANCH_NAME="master"
fi
git clone -b ${PHP_SDK_BRANCH_NAME} --single-branch https://${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN@github.com/MultiSafepay/php-sdk${REPO_SUFFIX}.git ./package-source/multisafepay/php-sdk/

# MAGENTO 2 META PACKAGE
if [[ $(curl -s -u ${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN https://api.github.com/repos/MultiSafepay/magento2${REPO_SUFFIX}/branches | grep -iGc '"name": "'${CURRENT_HEAD_REF}'"') == 1 ]]; then
    CORE_MODULE_BRANCH_NAME=${CURRENT_HEAD_REF}
else
    CORE_MODULE_BRANCH_NAME="master"
fi
git clone -b ${CORE_MODULE_BRANCH_NAME} --single-branch https://${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN@github.com/MultiSafepay/magento2${REPO_SUFFIX}.git ./package-source/multisafepay/magento2/

# MAGENTO 2 CORE MODULE
if [[ $(curl -s -u ${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN https://api.github.com/repos/MultiSafepay/magento2${REPO_SUFFIX}-core/branches | grep -iGc '"name": "'${CURRENT_HEAD_REF}'"') == 1 ]]; then
    CORE_MODULE_BRANCH_NAME=${CURRENT_HEAD_REF}
else
    CORE_MODULE_BRANCH_NAME="master"
fi
git clone -b ${CORE_MODULE_BRANCH_NAME} --single-branch https://${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN@github.com/MultiSafepay/magento2${REPO_SUFFIX}-core.git ./package-source/multisafepay/magento2-core/

# MAGENTO 2 ADMIN MODULE
if [[ $(curl -s -u ${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN https://api.github.com/repos/MultiSafepay/magento2${REPO_SUFFIX}-adminhtml/branches | grep -iGc '"name": "'${CURRENT_HEAD_REF}'"') == 1 ]]; then
    ADMIN_MODULE_BRANCH_NAME=${CURRENT_HEAD_REF}
else
    ADMIN_MODULE_BRANCH_NAME="master"
fi
git clone -b ${ADMIN_MODULE_BRANCH_NAME} --single-branch https://${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN@github.com/MultiSafepay/magento2${REPO_SUFFIX}-adminhtml.git ./package-source/multisafepay/magento2-adminhtml/

# MAGENTO 2 FRONTEND
if [[ $(curl -s -u ${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN https://api.github.com/repos/MultiSafepay/magento2${REPO_SUFFIX}-frontend/branches | grep -iGc '"name": "'${CURRENT_HEAD_REF}'"') == 1 ]]; then
    ADMIN_MODULE_BRANCH_NAME=${CURRENT_HEAD_REF}
else
    ADMIN_MODULE_BRANCH_NAME="master"
fi
git clone -b ${ADMIN_MODULE_BRANCH_NAME} --single-branch https://${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN@github.com/MultiSafepay/magento2${REPO_SUFFIX}-frontend.git ./package-source/multisafepay/magento2-frontend/

# MAGENTO 2 CATALOG INVENTORY
if [[ $(curl -s -u ${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN https://api.github.com/repos/MultiSafepay/magento2${REPO_SUFFIX}-catalog-inventory/branches | grep -iGc '"name": "'${CURRENT_HEAD_REF}'"') == 1 ]]; then
    ADMIN_MODULE_BRANCH_NAME=${CURRENT_HEAD_REF}
else
    ADMIN_MODULE_BRANCH_NAME="master"
fi
git clone -b ${ADMIN_MODULE_BRANCH_NAME} --single-branch https://${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN@github.com/MultiSafepay/magento2${REPO_SUFFIX}-catalog-inventory.git ./package-source/multisafepay/magento2-catalog-inventory/

# MAGENTO 2 MSI
if [[ $(curl -s -u ${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN https://api.github.com/repos/MultiSafepay/magento2${REPO_SUFFIX}-msi/branches | grep -iGc '"name": "'${CURRENT_HEAD_REF}'"') == 1 ]]; then
    ADMIN_MODULE_BRANCH_NAME=${CURRENT_HEAD_REF}
else
    ADMIN_MODULE_BRANCH_NAME="master"
fi
git clone -b ${ADMIN_MODULE_BRANCH_NAME} --single-branch https://${GITHUB_ACTOR}:$GLOBAL_GITHUB_TOKEN@github.com/MultiSafepay/magento2${REPO_SUFFIX}-msi.git ./package-source/multisafepay/magento2-msi/

composer config repositories.multisafepay "path" "package-source/multisafepay/*"
composer config minimum-stability dev
composer config prefer-stable false

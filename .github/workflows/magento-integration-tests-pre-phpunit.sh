#!/bin/bash
composer config github-oauth.github.com $GLOBAL_GITHUB_TOKEN

REPO_SUFFIX=""
if [[ $GITHUB_REPOSITORY == *"internal"* ]] ; then
    REPO_SUFFIX="-internal"
fi

REPOSITORIES=$(cat <<HERE
php-sdk${REPO_SUFFIX}
magento2${REPO_SUFFIX}
magento2${REPO_SUFFIX}-core
magento2${REPO_SUFFIX}-frontend
magento2${REPO_SUFFIX}-adminhtml
magento2${REPO_SUFFIX}-catalog-inventory
magento2${REPO_SUFFIX}-msi
HERE
)

for REPOSITORY in $REPOSITORIES; do
    composer config repositories.multisafepay-$REPOSITORY vcs git@github.com:MultiSafepay/$REPOSITORY.git
done

composer config minimum-stability dev
composer config prefer-stable false

composer require yireo/magento2-replace-bundled:^4.1 --no-update

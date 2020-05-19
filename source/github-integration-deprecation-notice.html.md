---
title: GitHub Integration Deprecation Notice
---

# GitHub Integration Deprecation Notice

Last updated: 6th April, 2020

The PigCI GitHub Integration will be removed at the end of April 2020\. I wanted to outline the reasons why & what's going to happen next.

When I made PigCI I wanted to help developers track their Rails apps memory usage, database queries & request time during their test suite to help improve their apps. The GitHub integration was a nice way to display this data, which also offered the potential for me to fund further development.

In the latest release of the [pig-ci-rails](https://github.com/PigCI/pig-ci-rails) ruby gem, I removed the mechanism which used PigCI's GitHub Integration to pass or fail a commits check depending on if they exceed a sensible metric threshold. This was replaced with a mechanism that will return a response when tests finish, that most testing services (Like GitHub Actions & CircleCI) will understand, that will pass or fail a commit instead.

## Less is better

The requirement to use the GitHub Integration to see results was a bad user experience. Instead of adding the library & seeing the benefit of the gem really fast, it required extra setup. It sucked!

Limiting the potential users to people who'd use the gem, have a GitHub account & wanted to install the app was terrible in hindsight. The latest version will work whether you're using Github, Bitbucket or GitLab with most testing services. It also requires less setup, so it's massively better!

## The GitHub Marketplace…

I had pretty high hopes when I initially saw what the GitHub Marketplace offered. I could build on top of their platform, then once I reached their verified threshold I could start a premium tier (e.g. users with private repositories), which I planned to use to help fund future development (I was thinking more frameworks & languages).

The GitHub Marketplace has been a massive disappointment.

<img src="/images/github-marketplace-paused.png" class="border img-thumbnail mx-auto d-block" alt="Reviews of verification requests are currently paused as we work to improve the process"/>

<img src="/images/github-marketplace-cant-sell-another-way.png" class="border img-thumbnail mx-auto d-block" alt="If you're listing an app on GitHub Marketplace, you can't list your app with a free pricing plan if you offer a paid service outside of GitHub Marketplace."/>

The GitHub Marketplace has quietly not been allowing any new apps to reach verified status for the last few months, this annoyance has been compounded by their guidelines saying I'm not allowed to be [listed on the GitHub marketplace if I offer a paid service outside of GitHub Marketplace](https://developer.github.com/marketplace/selling-your-app/github-marketplace-pricing-plans/).

I looked into setting up a subscription service via Stripe, but this ran the risk of not being allowed to listed in the marketplace in the future. It also felt like a waste of resources, when I already had a marketplace integration written.

I am [not the only developer](https://github.community/t5/GitHub-API-Development-and/GitHub-app-marketplace-submission-review-time/m-p/50462) who has invested in developing for the GitHub Marketplace, just to be left in the dark about when we could monetise our work. When I contacted GitHub support about this, they took over a month to reply to my request for more information.

So I'm a bit miffed off about the GitHub Marketplace. I could have potentially spent my time setting up Stripe instead of waiting around to be told I need to wait some more.

## The future

I'm going to shutdown the GitHub Integration at the end of April 2020, this will also mean the current PigCI.com website will be rebuilt. I intend to open source the current codebase & launch a new version that just focuses on the gem.

I intend to keep developing the Ruby Gem in my spare time, but I have zero intentions of worrying about platform specific integrations.

The pig-ci-rails gem will remain open source & freely available. Instead of trying to monetise it by attaching an unnecessary premium tier, I'm going to use it to help promote my services as a Rails Consultant.

I'd like to thank everyone who added PigCI on Github. I hope you understand why I'm removing the GitHub Integration & will continue to find the gem useful.

Thanks, <br />
- Mike

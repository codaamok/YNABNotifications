# YNABNotifications

A PowerShell Azure Functions app which sends a pushover notification to my phone for whenever there are transactions pending approval or categorisation. This runs on a schedule as a timer trigger function, where the schedule is defined in `TimerTrigger\function.json`.

The native push notifications for YNAB do not fit my needs. I want to be actively engaged with my budget as much as possible, but I also want to avoid manually importing my transactions. Therefore I want to be notified whenever there are transactions pending approval or categorisation as frequently as possible.

I import my transactions from all my accounts using [syncforynab.com](https://syncforynab.com/).

# Set up

1. Create Azure Function App
2. Create Azure Key Vault and configure to use new RBAC access policy
3. Delegate Azure Function App `Key Vault Secrets User` role
4. Create secrets for YNAB API, Pushover app and user keys
5. Create application settings for the Azure Function:
   1. `YNAB_API_KEY` containing the YNAB API key
   2. `PUSHOVER_APP_KEY` and `PUSHOVER_USER_KEY` containing the Pushover app key and user key respectively
6. Publish the content in this repository to the Azure Function

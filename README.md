# YNABNotifications

A PowerShell Azure Functions app which sends a pushover notification to my phone for whenever there are transactions pending approval or categorisation. This runs on a schedule as a timer trigger function, where the schedule is defined in `TimerTrigger\function.json`.

The native push notifications for YNAB do not fit my needs. I want to be actively engaged with my budget as much as possible, but I also want to avoid manually importing my transactions. Therefore I want to be notified whenever there are transactions pending approval or categorisation as frequently as possible.

I import my transactions from all my accounts using [syncforynab.com](https://syncforynab.com/).

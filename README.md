# Salesforce Trigger Practice Project

This project is a small Salesforce DX exercise focused on building and testing Apex triggers using a clean, professional workflow.  
It includes a trigger, a handler class, and a full unit test class deployed to a scratch org using Salesforce CLI.

## Included Components
- **AccountRatingTrigger** – Trigger on Account (before insert/update)
- **AccountRatingHandler** – Applies a Rating value based on AnnualRevenue
- **AccountRatingHandlerTest** – Unit tests covering Hot/Warm/Cold logic

## How to Deploy
~~~bash
sf project deploy start -d force-app
~~~

## How to Run Tests
~~~bash
sf apex test run -n AccountRatingHandlerTest -w 10
~~~

## Logic Summary
- Revenue > 1,000,000 → `Hot`
- Revenue > 100,000 → `Warm`
- Otherwise → `Cold`

This project is part of my continuous practice to strengthen Apex, testing, and Salesforce DX development workflows.

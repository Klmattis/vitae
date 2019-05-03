# Vitae
Résumé contract for public identification

## Background
On a fundamental level, smart contracts can be used as a store of information. This project, "vitae", is a use-case for this functionality.
By providing a résumé template as a contract, a user can create and store their own CVs on the blockchain. Changes to the document can be tracked,
and the document can be viewed by anyone without the need of a file transfer.

## Implementation
The project uses the contract factory design pattern to allow other users the ability to create their own résumé contracts.
Restrictions are placed such that noone may change an existing contract besides the contract owner. Vitae is a submodule of the Portfolio project,
which interacts with the contract through a user interface. At this time, only the first résumé is displayed.

A live version of the project can be found at https://port-fol.io/vitae.

## Install
Use the following steps to install the application locally:
1. Clone this repository under your portfolio/ethereum/ directory.
2. Run the following in the vitae directory:
```bash
npm install 
```

## Compile
Use the following steps to compile the vitae smart contract:
1. Run the following in the vitae directory:
```bash
node compile.js
```
2. Confirm that the vitae/build/ directory contains Vitae.json and VitaeFactory.json.

## Deploy
Use the following steps to compile the vitae smart contract:
1. Run the following in the vitae directory:
```bash
node deploy.js
```
2. In your terminal, take note of the address of the newly deployed contract.
3. Within /vitae/factory.js, replace the existing contract address with your own from step 2.

See Klmattis/portfolio for instructions on running the application used to view this project.

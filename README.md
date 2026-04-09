# Solidity-for-Pythonists: Thinking about State, Storage, and, Deterministic Data
A structured Solidity learning repository for Python and SQL-minded developers. Focused on understanding smart contracts as deterministic, stateful systems—covering storage, mappings, events, and querying blockchain data through a data engineering lens.

# Solidity for Pythonists

Thinking in State, Storage, and Deterministic Data

---

## 🧠 Mental Model

The basic workflow for working with Solidity (.sol) files is:

1. Create or edit a contract
2. Compile it
3. Deploy it to a blockchain
4. Interact with the deployed contract

---

## ❗ Key Difference from Python

Unlike Python, Solidity code is NOT run directly.

Smart contracts must be:

1. **Compiled**
2. **Deployed** to a blockchain environment (local VM, testnet, or mainnet)

Only then can they be used.

---

## 🧱 What is a Smart Contract?

A deployed contract is a **stateful program (or API) living on-chain**.

It is NOT just a temporary script or function.

It has:

* **State variables** → stored data (like a database)
* **Functions** → logic that interacts with that data

---

## 🔄 Types of Interactions

### 🟢 Call (Read-only)

* Does NOT change state
* Does NOT cost gas
* Example: reading a value

### 🔴 Transaction (Write)

* Changes state
* Costs gas
* Recorded permanently on-chain
* Example: updating a value

---

## ⚙️ Core Workflow

### Compile

* Converts `.sol` → **bytecode + ABI**

### Deploy

* Creates a **live instance** of the contract
* Assigns it a **contract address**

### Interact

* Use the ABI/UI to call functions
* Either:

  * Read (call)
  * Write (transaction)

---

## 📦 What is the ABI?

The **ABI (Application Binary Interface)** is:

* The interface used to interact with a contract
* Defines:

  * Available functions
  * Inputs and outputs

Think of it like:

> a contract’s API specification

---

## ⚠️ Compiler vs Deployment

* **Compiler environment** ≠ **Deployment environment**

### Compiler

* Must match the contract’s `pragma`
* Use stable versions (avoid nightly builds)

### Deployment Environment

Determines where the contract lives:

* Local (Remix VM)
* Testnet
* Mainnet
* External wallet/provider

---

## 🧠 Final Intuition

You are NOT:
❌ running a script

You ARE:
✅ deploying a permanent program
✅ that stores data
✅ and is interacted with over time

---

## 🚀 Learning Path

1. Remix IDE basics
2. First contract
3. State + storage
4. Transactions + gas
5. Mappings and structs








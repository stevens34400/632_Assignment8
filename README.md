# 632_Assignment8

## Project Overview

This project involves creating a family tree using Prolog, a logic programming language. The family tree is represented through a series of facts and rules that define relationships such as parent, sibling, grandparent, cousin, and descendant.

## Files

- `family_tree.pl`: Contains the Prolog code defining the family tree relationships.

## How to Run

1. Ensure you have SWI-Prolog installed on your system. You can download it from [SWI-Prolog's official website](https://www.swi-prolog.org/).
2. Open a terminal and navigate to the directory containing `family_tree.pl`.
3. Start the Prolog interpreter by typing `swipl`.
4. Load the family tree file by entering `[family_tree].`.
5. You can now query the family tree. For example:
   - To find all children of a person: `children(john, Children).`
   - To check if two people are siblings: `sibling(mary, michael).`
   - To find all descendants of a person: `descendant(X, john).`

## Family Tree Logic

The family tree is built using the following relationships:

- **Parent-Child**: Defined using `parent/2` facts.
- **Gender**: Specified using `male/1` and `female/1` predicates.
- **Grandparent**: A person is a grandparent if they are a parent of a parent.
- **Sibling**: Two people are siblings if they share at least one parent.
- **Cousin**: Two people are cousins if their parents are siblings.
- **Descendant**: A recursive relationship where a person is a descendant if they are a child or a descendant of a child.

## Example Queries

- Find all grandparents of `jessica`: `grandparent(X, jessica).`
- List all siblings of `david`: `siblings(david, Sibs).`
- Determine if `kevin` and `lily` are cousins: `cousin(kevin, lily).`

This README provides a basic understanding of the project and how to interact with the Prolog code to explore the family tree relationships.

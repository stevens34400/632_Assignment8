% -------------------------
% Facts: basic relationships
% -------------------------
% These facts define the parent-child relationships in the family tree.
% Each fact states that the first person is a parent of the second person.

parent(john, mary).
parent(john, michael).
parent(susan, mary).
parent(susan, michael).

parent(mary, jessica).
parent(robert, jessica).
parent(mary, david).
parent(robert, david).

parent(michael, kevin).
parent(linda, kevin).
parent(michael, lily).
parent(linda, lily).

% These facts define the gender of each person.
% 'male' and 'female' predicates are used to specify gender.

male(john).
female(susan).
female(mary).
male(michael).
male(robert).
female(linda).
female(jessica).
male(david).
male(kevin).
female(lily).

% ------------------------------------
% Derived relationships using rules
% ------------------------------------
% These rules define more complex relationships based on the basic facts.

% X is grandparent of Y if X is parent of Z and Z is parent of Y
% This rule finds a grandparent by looking two generations up.

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% X and Y are siblings if they share a parent and are not the same person
% This rule checks if two people have at least one common parent.

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% X and Y are cousins if their parents are siblings
% This rule finds cousins by checking if their parents are siblings.

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2).

% ------------------------------------
% Recursive relationships
% ------------------------------------
% These rules define relationships that can be determined recursively.

% X is a descendant of Y if Y is parent of X
% This is the base case for the descendant relationship.

descendant(X, Y) :-
    parent(Y, X).

% or if Y is parent of Z and X is a descendant of Z
% This recursive rule allows finding descendants through multiple generations.

descendant(X, Y) :-
    parent(Z, X),
    descendant(Z, Y).

% ------------------------------------
% Utility for grouping
% ------------------------------------
% These utility predicates help in grouping related individuals.

% children(Parent, ListOfChildren)
% This predicate finds all children of a given parent and returns them as a list.

children(Parent, Children) :-
    findall(C, parent(Parent, C), Children).

% siblings(Person, ListOfSiblings)
% This predicate finds all siblings of a given person and returns them as a sorted list to remove duplicates.

siblings(Person, Sibs) :-
    findall(S, sibling(Person, S), Temp),
    sort(Temp, Sibs).  % remove duplicates if any

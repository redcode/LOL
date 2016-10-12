# LOL
Copyright © 2016 Manuel Sainz de Baranda y Goñi.  
Released under the terms of the [MIT License](LICENSE).

A small OOP library for Lua.

### Demo
```
require "LOL"

-- Create a base class
Hero = LOL.new_class()

-- Create a derived class
BruceWillis = LOL.new_class(Hero)

-- Create instances
hero = Hero:new()
john_mcclane = BruceWillis:new()
```  

### Test
```
Base class
----------
  Hero:is_class()    => true
  Hero:is_instance() => false
  hero:is_class()    => false
  hero:is_instance() => true

Derived class
-------------
  BruceWillis:is_class()     => true
  BruceWillis:is_instance()  => false
  john_mcclane:is_class()    => false
  john_mcclane:is_instance() => true

Inheritance
-------------
  Hero:is_ancestor_of(Hero)                    => false
  Hero:is_ancestor_of(hero)                    => false
  Hero:is_ancestor_of(BruceWillis)             => true
  Hero:is_ancestor_of(john_mcclane)            => true
  hero:is_ancestor_of(Hero)                    => false
  hero:is_ancestor_of(hero)                    => false
  hero:is_ancestor_of(BruceWillis)             => true
  hero:is_ancestor_of(john_mcclane)            => true
  BruceWillis:is_ancestor_of(Hero)             => false
  BruceWillis:is_ancestor_of(hero)             => false
  BruceWillis:is_ancestor_of(BruceWillis)      => false
  BruceWillis:is_ancestor_of(john_mcclane)     => false
  john_mcclane:is_ancestor_of(Hero)            => false
  john_mcclane:is_ancestor_of(hero)            => false
  john_mcclane:is_ancestor_of(BruceWillis)     => false
  john_mcclane:is_ancestor_of(john_mcclane)    => false
  Hero:is_descendant_of(Hero)                  => false
  Hero:is_descendant_of(hero)                  => false
  Hero:is_descendant_of(BruceWillis)           => false
  Hero:is_descendant_of(john_mcclane)          => false
  hero:is_descendant_of(Hero)                  => false
  hero:is_descendant_of(hero)                  => false
  hero:is_descendant_of(BruceWillis)           => false
  hero:is_descendant_of(john_mcclane)          => false
  BruceWillis:is_descendant_of(Hero)           => true
  BruceWillis:is_descendant_of(hero)           => true
  BruceWillis:is_descendant_of(BruceWillis)    => false
  BruceWillis:is_descendant_of(john_mcclane)   => false
  john_mcclane:is_descendant_of(Hero)          => true
  john_mcclane:is_descendant_of(hero)          => true
  john_mcclane:is_descendant_of(BruceWillis)   => false
  john_mcclane:is_descendant_of(john_mcclane)  => false
  Hero:is_kind_of(Hero)                        => true
  Hero:is_kind_of(hero)                        => true
  Hero:is_kind_of(BruceWillis)                 => false
  Hero:is_kind_of(john_mcclane)                => false
  hero:is_kind_of(Hero)                        => true
  hero:is_kind_of(hero)                        => true
  hero:is_kind_of(BruceWillis)                 => false
  hero:is_kind_of(john_mcclane)                => false
  BruceWillis:is_kind_of(Hero)                 => true
  BruceWillis:is_kind_of(hero)                 => true
  BruceWillis:is_kind_of(BruceWillis)          => true
  BruceWillis:is_kind_of(john_mcclane)         => true
  john_mcclane:is_kind_of(Hero)                => true
  john_mcclane:is_kind_of(hero)                => true
  john_mcclane:is_kind_of(BruceWillis)         => true
  john_mcclane:is_kind_of(john_mcclane)        => true
```
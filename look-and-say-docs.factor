! Copyright (C) 2024 Aleksander Sabak.
! See https://factorcode.org/license.txt for BSD license.
USING: help.markup help.syntax kernel lists sequences strings ;
IN: look-and-say

HELP: <look-and-say>
{ $values
    { "seed" string }
    { "list" list }
}
{ $description "Creates a lazy linked list representing a " { $link look-and-say } " sequence starting from a given seed to be used with the " { $vocab-link "lists" } " vocabulary." }
;

HELP: look-and-say
{ $class-description "An infinite linked list starting from " { $slot "car" } " an continuing in " { $slot "cdr" } " which is constructed lazily if not present." $nl
"Implements " { $link "lists-protocol" } "." }
;

HELP: next-look-and-say
{ $values
    { "string" string }
    { "string'" string }
}
{ $description "Calculates the next value in a look-and-say sequence: for each run of identical elements in " { $snippet "string" } " the resulting " { $snippet "string'" } " will contain the length of that run and that element." }
{ $examples
    { $example "USING: look-and-say prettyprint ;"
        "\"1\" next-look-and-say ."
        "11"
    }
    { $example "USING: look-and-say prettyprint ;"
        "\"11\" next-look-and-say ."
        "21"
    }
    { $example "USING: look-and-say prettyprint ;"
        "\"111221\" next-look-and-say ."
        "312211"
    }
    { $example "USING: look-and-say prettyprint ;"
        "\"AAAAAABBBCCCCCD\" next-look-and-say ."
        "6A3B5C1D"
    }
}
;

ARTICLE: "look-and-say" "The look-and-say sequence"
"The " { $vocab-link "look-and-say" } " vocabulary implements the " { $url "https://oeis.org/A005150" "look-and-say" } " sequence. Its first element is 1 (thought the vocabulary allows arbitrary strings as seeds) and generates following elements by \"describing\" previous elements:"
{ $list
  "1 is one 1, so the second element is 11"
  "11 is two 1s, so the third element is 21"
  "21 is one 2 and one 1, so the fourth element is 1211"
  "1211 is one 1, one 2, and two 1s, so the fifth element is 111221"
  "111221 is three 1s, two 2s and one 1, so the sixth element is 312211"
  "and so on..."
}
"The only digits that appear in the sequence seeded with 1 are 1, 2, and 3." $nl
"This vocabulary represents elements of the sequence as strings, since their string representations are what matters to the definition of the sequence."
;

ABOUT: "look-and-say"

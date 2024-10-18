! Copyright (C) 2024 Aleksander Sabak.
! See https://factorcode.org/license.txt for BSD license.
USING: accessors kernel lists make math math.parser sequences ;
IN: look-and-say


: next-look-and-say ( string -- string' )
  dup empty? [ [ unclip-slice 1 spin [
    2dup = [ drop [ 1 + ] dip ]
    [ spin number>string % , 1 swap ] if
  ] each swap number>string % , ] "" make ] unless ;


TUPLE: look-and-say car cdr ;

: <look-and-say> ( seed -- list ) f look-and-say boa ;


INSTANCE: look-and-say list

M: look-and-say nil? drop f ;

M: look-and-say car car>> ;

M: look-and-say cdr [ cdr>> ]
  [ dup car>> next-look-and-say
    <look-and-say> [ swap cdr<< ] keep ] ?unless ;

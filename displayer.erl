%% @author Rodrigo Magalhaes de Castro - mdecas01
%% @doc This module represents the displayer actor for the application that
%%      will display the results from the converter calculation.
 
-module(displayer).
-export([display/0]).
 
display() ->
  receive
    {fareinheit, F} ->
      io:format("~p C is ~p F~n", F ),
      display();
    {celsius, C} ->
      io:format("~p F is ~p C~n", C ),
      display();
    {stop}->
      io:format("displayer process stopping.~n");   
    Message ->
      io:format("~p is not recognized.~n", [Message]),
      display()
   end.
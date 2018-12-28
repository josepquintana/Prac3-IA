(define (problem Mars01)
    (:domain mars)
    (:requirements :strips :fluents :adl :typing)
    (:objects
        town1 town2 - town
        warehouse1 warehouse2 - warehouse
        rover1 - rover
        supply1 supply2 - supply
        person1 person2 person3 - person
    )
    (:init
        (connected warehouse1 town1)
	    (connected town1 town2)
	    (connected town2 warehouse2)

        (petition supply1 town1)
        (petition supply2 town1)
        (petition person1 town1)
        (petition person2 town1)
        (petition person3 town1)

        (at_position warehouse1 supply1)
        (at_position warehouse1 supply2)
        (at_position town2 person1)
        (at_position town2 person2)
        (at_position town2 person3)
        (at_position warehouse1 rover1)

        (= (fuel rover1) 20)
    )
    (:goal  (forall
                (?c - cargo)
                (assigned ?c)
            )
    )
)

(define (problem Mars01)
    (:domain mars)
    (:requirements :strips :adl :typing)
    (:objects
        town1 town2 town3 - town
        warehouse1 warehouse2 - warehouse
        rover1 rover2 - rover
        supply1 supply2 supply3 supply4 - supply
        person1 person2 person3 - person
    )
    (:init
        (connected warehouse1 town2)
	    	(connected town1 town2)
	    	(connected town2 warehouse2)
	    	(connected town1 warehouse2)
	    	(connected town3 warehouse1)

        (petition supply1 town1)
        (petition supply2 town1)
        (petition supply3 town2)
        (petition supply4 town3)
        (petition person1 town1)
        (petition person2 town1)
        (petition person3 town3)

        (at_position warehouse1 supply1)
        (at_position warehouse1 supply2)
        (at_position warehouse2 supply3)
        (at_position warehouse2 supply4)
        (at_position town2 person1)
        (at_position town3 person2)
        (at_position town2 person3)
        (at_position warehouse1 rover1)
        (at_position warehouse2 rover2)
    )
    (:goal  (forall
                (?c - cargo)
                (assigned ?c)
            )
    )
)

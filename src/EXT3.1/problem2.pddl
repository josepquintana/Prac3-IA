(define (problem Mars01)
    (:domain mars)
    (:requirements :strips :fluents :adl :typing)
    (:objects
        town1 town2 town3 town4 - town
        warehouse1 warehouse2 - warehouse
        rover1 rover2 - rover
        supply1 supply2 supply3 - supply
        person1 person2 person3 person4 - person
    )
    (:init
        (connected warehouse1 warehouse2)
	    	(connected town1 town2)
	    	(connected town2 town3)
	    	(connected town1 town4)
	    	(connected warehouse2 town3)
	    	(connected warehouse2 town1)

        (petition supply1 town2)
        (petition supply2 town4)
        (petition supply3 town1)
        (petition person1 town3)
        (petition person2 town3)
        (petition person3 town4)
        (petition person4 town2)

        (at_position warehouse1 supply1)
        (at_position warehouse1 supply2)
        (at_position warehouse2 supply3)
        (at_position town4 person1)
        (at_position town1 person2)
        (at_position town3 person3)
        (at_position town4 person4)
        (at_position warehouse1 rover1)
        (at_position warehouse2 rover2)

        (= (priority_metric) 0)

        (= (fuel rover1) 40)
				(= (fuel rover2) 30)

        (= (priority supply1 town2) 3)
        (= (priority supply2 town4) 2)
        (= (priority supply3 town1) 1)
        (= (priority person1 town3) 2)
        (= (priority person2 town3) 3)
        (= (priority person3 town4) 1)
				(= (priority person4 town2) 2)


    )
    (:goal  (forall
                (?c - cargo)
                (assigned ?c)
            )
    )
    (:metric minimize (priority_metric))
)

(define (problem Mars01)
    (:domain mars)
    (:requirements :strips :fluents :adl :typing)
    (:objects
        town1 town2 town3 - town
        warehouse1 warehouse2 - warehouse
        rover1 - rover
        supply1 supply2 - supply
        person1 person2 person3 - person
    )
    (:init
        (connected warehouse1 town1)
	    (connected town1 town2)
	    (connected town2 town3)
	    (connected town2 warehouse2)
	    
        (petition supply1 town1)
        (petition supply2 town1)
        (petition person1 town1)
        (petition person2 town1)
        (petition person3 town1)
        (petition person3 town3)
        
        (at_position warehouse1 supply1)
        (at_position warehouse1 supply2)
        (at_position town2 person1)
        (at_position town2 person2)
        (at_position town2 person3)
        (at_position warehouse1 rover1)
        
        (= (priority_metric) 0)
        
        (= (fuel rover1) 9)
        (= (total_fuel) 0)
        
        (= (priority supply1 town1) 3)
        (= (priority supply2 town1) 3)
        (= (priority person1 town1) 3)
        (= (priority person2 town1) 3)
        (= (priority person3 town1) 1)
        (= (priority person3 town3) 3)
        
        
    )
    (:goal  (forall
                (?c - cargo)
                (assigned ?c)
            )
    )
    (:metric minimize (+ (* 1 (total_fuel)) (* 1 (priority_metric))))
)


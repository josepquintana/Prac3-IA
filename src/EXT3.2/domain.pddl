(define (domain mars)
    (:requirements :strips :fluents :adl :typing)
    (:types 
        localizable
        rover cargo - localizable
        person supply - cargo
        base
        warehouse town - base
    )
    (:functions
        (fuel ?r - rover)
        (priority ?c - cargo ?b - base)
        (priority_metric)
        (total_fuel)
    )
    (:predicates
        ;;static predicates
        (connected ?b1 - base ?b2 - base)
        (petition ?c - cargo ?b - base)

        ;; Non-static predicates:
        
        (at_position ?b - base ?l - localizable)
        (in_rover ?r - rover ?c - cargo)
	    (assigned ?c - cargo)
    )

    (:action load_supp
        :parameters (?s - supply ?r - rover ?b - base)
        :precondition (and 
                          (at_position ?b ?s) 
                          (at_position ?b ?r)
                          (not (assigned ?s))
                          (not (exists
                              (?p - person)
                              (in_rover ?r ?p)
                          ))
                          (not (exists
                              (?s1 - supply)
                              (in_rover ?r ?s1)
                          ))
                      )         
        :effect (and 
                    (in_rover ?r ?s) 
                    (not (at_position ?b ?s)) 
                )
    )
        
    (:action load_pers
        :parameters (?p - person ?r - rover ?b - base)
        :precondition (and 
                          (at_position ?b ?p) 
                          (at_position ?b ?r)
                          (not (assigned ?p))
                          (not (exists
                              (?s - supply)
                              (in_rover ?r ?s)
                          ))
                          (not (exists
                              (?p1 - person ?p2 - person)
                              (and
                                  (not (= ?p1 ?p2))
                                  (in_rover ?r ?p1)
                                  (in_rover ?r ?p2)
                              )
                          ))
                      )
        :effect (and 
                    (in_rover ?r ?p) 
                    (not (at_position ?b ?p))
                )
    )


    (:action unload_supp
        :parameters (?s - supply ?r - rover ?b - base)
        :precondition (and 
                          (at_position ?b ?r) 
                          (in_rover ?r ?s)
                      )
        :effect (and 
                    (at_position ?b ?s) 
                    (not (in_rover ?r ?s))
                    (when
                        (petition ?s ?b)
                        (and
                            (increase (priority_metric) (- 3 (priority ?s ?b)))
                            (assigned ?s)
                        )
                    )
                )
    )

    (:action unload_pers
        :parameters (?p - person ?r - rover ?b - base)
        :precondition (and 
                          (at_position ?b ?r) 
                          (in_rover ?r ?p)
                      )
        :effect (and 
                    (at_position ?b ?p) 
                    (not (in_rover ?r ?p)) 
                    (when
                        (petition ?p ?b)
                        (and
                            (increase (priority_metric) (- 3 (priority ?p ?b)))
                            (assigned ?p)
                        )
                    )
                )
    )

    (:action drive
        :parameters (?r - rover ?b1 - base ?b2 - base)
        :precondition (and
                          (>= (fuel ?r) 1)
                          (at_position ?b1 ?r) 
                          (or 
                              (connected ?b1 ?b2) 
                              (connected ?b2 ?b1)
                          )
                      )
        :effect (and 
                    (at_position ?b2 ?r) 
                    (not (at_position ?b1 ?r))
                    (decrease (fuel ?r) 1)
                    (increase (total_fuel) 1)
                )
    )

)

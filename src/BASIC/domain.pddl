(define (domain mars)
    (:requirements :strips :adl :typing)
    (:types 
        localizable
        rover cargo - localizable
        person supply - cargo
        base
        warehouse town - base
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
                      )         
        :effect (and 
                    (in_rover ?r ?s) 
                    (not (at_position ?b ?s)) 
                    (not (assigned ?s))
                )
    )
        
    (:action load_pers
        :parameters (?p - person ?r - rover ?b - base)
        :precondition (and 
                          (at_position ?b ?p) 
                          (at_position ?b ?r)
                      )
        :effect (and 
                    (in_rover ?r ?p) 
                    (not (at_position ?b ?p))
                    (not (assigned ?p))
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
                        (assigned ?s)
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
                        (assigned ?p)
                    )
                )
    )

    (:action drive
        :parameters (?r - rover ?b1 - base ?b2 - base)
        :precondition (and
                          (at_position ?b1 ?r) 
                          (or 
                              (connected ?b1 ?b2) 
                              (connected ?b2 ?b1)
                          )
                      )
        :effect (and 
                    (at_position ?b2 ?r) 
                    (not (at_position ?b1 ?r))
                )
    )

)

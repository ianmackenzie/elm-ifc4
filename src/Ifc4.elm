module Ifc4 exposing (Allowed)

import Iso10303 as Step


type Allowed
    = Allowed Never


type Entity a
    = Entity Step.Entity


entity : String -> List Step.Attribute -> Entity a
entity typeName attributes =
    Entity (Step.entity typeName attributes)


toStepEntity : Entity a -> Step.Entity
toStepEntity (Entity stepEntity) =
    stepEntity


type alias WallStandardCase =
    Entity
        { wallStandardCase : Allowed
        }


type alias Wall =
    Entity
        { wall : Allowed
        , wallStandardCase : Allowed
        , wallElementedCase : Allowed
        }


wallStandardCase : { name : String } -> Entity { a | wallStandardCase : Allowed }
wallStandardCase given =
    entity "IFCWALLSTANDARDCASE" []


wall : { name : String } -> Entity { a | wall : Allowed }
wall given =
    entity "IFCWALL" []

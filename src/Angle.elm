module Angle
    exposing
        ( Angle
        , Radians
        , acos
        , asin
        , atan
        , atan2
        , cos
        , degrees
        , inDegrees
        , inRadians
        , inTurns
        , perDegree
        , perRadian
        , perTurn
        , radians
        , sin
        , tan
        , turns
        )

import Quantity exposing (Quantity(..), Rate)


type Radians
    = Radians


type alias Angle =
    Quantity Radians


radians : Float -> Angle
radians numRadians =
    Quantity numRadians


inRadians : Angle -> Float
inRadians (Quantity numRadians) =
    numRadians


degrees : Float -> Angle
degrees numDegrees =
    radians (pi * (numDegrees / 180))


inDegrees : Angle -> Float
inDegrees angle =
    180 * (inRadians angle / pi)


turns : Float -> Angle
turns numTurns =
    radians (2 * pi * numTurns)


inTurns : Angle -> Float
inTurns angle =
    inRadians angle / (2 * pi)


perDegree : Quantity units -> Quantity (Rate units Radians)
perDegree quantity =
    Quantity.per (degrees 1) quantity


perRadian : Quantity units -> Quantity (Rate units Radians)
perRadian quantity =
    Quantity.per (radians 1) quantity


perTurn : Quantity units -> Quantity (Rate units Radians)
perTurn quantity =
    Quantity.per (turns 1) quantity


sin : Angle -> Float
sin (Quantity angle) =
    Basics.sin angle


cos : Angle -> Float
cos (Quantity angle) =
    Basics.cos angle


tan : Angle -> Float
tan (Quantity angle) =
    Basics.tan angle


asin : Float -> Angle
asin x =
    Quantity (Basics.asin x)


acos : Float -> Angle
acos x =
    Quantity (Basics.acos x)


atan : Float -> Angle
atan x =
    Quantity (Basics.atan x)


atan2 : Quantity units -> Quantity units -> Angle
atan2 (Quantity y) (Quantity x) =
    Quantity (Basics.atan2 y x)

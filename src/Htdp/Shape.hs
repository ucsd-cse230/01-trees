module Htdp.Shape where

import Htdp.Data.Image ( Image, Color )
import qualified Diagrams.TwoD as D
import qualified Diagrams as D
import Diagrams ( (^&) )
import Diagrams.Util ( (#) )

data Mode = Solid | Outline
  deriving Eq

solid, outline :: Mode
solid = Solid
outline = Outline

applyMode :: Mode -> Color -> Image -> Image
applyMode Solid color image = image # D.fc color
                                    # D.lc color
applyMode Outline color image = image # D.lc color

circle :: Float -> Mode -> Color -> Image
circle r mode color = D.circle r # applyMode mode color

ellipse :: Float -> Float -> Mode -> Color -> Image
ellipse w h mode color = D.ellipseXY (w / 2) (h / 2) # applyMode mode color

line :: Float -> Float -> Color -> Image
line x y color = D.strokeLine (D.fromVertices [0 ^& 0, x ^& (-y)]) # D.lc color

addLine :: Image -> Float -> Float -> Float -> Float -> Color -> Image
addLine image x0 y0 x1 y1 color =
  (D.strokeLocLine (D.fromVertices [x0 ^& (-y0), x1 ^& (-y1)]) # D.lc color)
  `D.atop`
  (image # D.alignL # D.alignT)

emptyImage :: Image
emptyImage = mempty

triangle :: Float -> Mode -> Color -> Image
triangle sideLength mode color = D.triangle sideLength # applyMode mode color

rightTriangle :: Float -> Float -> Mode -> Color -> Image
rightTriangle = _

isoscelesTriangle :: Float -> Float -> Mode -> Color -> Image
isoscelesTriangle = _

triangleSSS :: Float -> Float -> Float -> Mode -> Color -> Image
triangleSSS = _

triangleASS :: Float -> Float -> Float -> Mode -> Color -> Image
triangleASS = _

triangleSAS :: Float -> Float -> Float -> Mode -> Color -> Image
triangleSAS = _

triangleSSA :: Float -> Float -> Float -> Mode -> Color -> Image
triangleSSA = _

triangleAAS :: Float -> Float -> Float -> Mode -> Color -> Image
triangleAAS = _

triangleASA :: Float -> Float -> Float -> Mode -> Color -> Image
triangleASA = _

triangleSAA :: Float -> Float -> Float -> Mode -> Color -> Image
triangleSAA = _

square :: Float -> Mode -> Color -> Image
square size mode color = D.square size # applyMode mode color

rectangle :: Float -> Float -> Mode -> Color -> Image
rectangle w h mode color = D.rect w h # applyMode mode color

rhombus :: Float -> Float -> Mode -> Color -> Image
rhombus = _

star :: Float -> Mode -> Color -> Image
star = _

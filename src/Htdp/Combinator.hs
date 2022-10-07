module Htdp.Combinator
  ( Alignment, low, mid, high
  , overlay
  , overlayOffset
  , overlayAlign
  , placeImage
  , placeImages
  ) where

import qualified Diagrams as D
import Diagrams.Util ( (#) )
import Htdp.Data.Image

data Alignment = Low | Mid | High

low, mid, high :: Alignment
low = Low
mid = Mid
high = High

overlay :: Image -> Image -> Image
overlay = D.atop

overlayAlign :: Alignment -> Alignment -> Image -> Image -> Image
overlayAlign xAlignment yAlignment i1 i2 = overlayAlignOffset xAlignment yAlignment i1 0 0 i2

overlayOffset :: Image -> Float -> Float -> Image -> Image
overlayOffset i1 x y i2 = overlayAlignOffset mid mid i1 x y i2

xAlignFunc :: Alignment -> Image -> Image
xAlignFunc Low = D.snugL
xAlignFunc Mid = D.snugCenterX
xAlignFunc High = D.snugR

yAlignFunc :: Alignment -> Image -> Image
yAlignFunc Low = D.snugB
yAlignFunc Mid = D.snugCenterY
yAlignFunc High = D.snugT

overlayAlignOffset :: Alignment -> Alignment -> Image -> Float -> Float -> Image -> Image
overlayAlignOffset xAlignment yAlignment i1 x y i2 = newImage # D.snugCenterXY
  where
    newImage = i1 # xAlignFunc xAlignment # yAlignFunc yAlignment
              `D.atop`
              i2 # xAlignFunc xAlignment # yAlignFunc yAlignment # D.moveOriginBy (D.V2 (-x) y)

overlayXY :: Image -> Float -> Float -> Image -> Image
overlayXY i1 x y i2 = overlayAlignOffset low high i1 x y i2

underlay :: Image -> Image -> Image
underlay i1 i2 = overlay i2 i1

underlayAlign :: Alignment -> Alignment -> Image -> Image -> Image
underlayAlign xAlignment yAlignment i1 i2 = overlayAlign xAlignment yAlignment i2 i1

underlayOffset :: Image -> Float -> Float -> Image -> Image
underlayOffset i1 x y i2 =
  i2 # D.translateX (-x) # D.translateY (-y)
  `D.atop`
  i1

underlayXY :: Image -> Float -> Float -> Image -> Image
underlayXY i1 x y i2 = underlayAlignOffset low high i1 x y i2

underlayAlignOffset :: Alignment -> Alignment -> Image -> Float -> Float -> Image -> Image
underlayAlignOffset xAlignment yAlignment i1 x y i2 =
  i2 # xAlignFunc xAlignment # yAlignFunc yAlignment # D.translateX (-x) # D.translateY (-y)
  `D.atop`
  i1 # xAlignFunc xAlignment # yAlignFunc yAlignment

beside :: Image -> Image -> Image
beside = (D.|||)

besides :: [Image] -> Image
besides = D.hcat

besideAlign :: Alignment -> Image -> Image -> Image
besideAlign yAlignment i1 i2 = (i1 # yAlignFunc yAlignment) D.||| (i2 # yAlignFunc yAlignment)


besidesAlign :: Alignment -> [Image] -> Image
besidesAlign yAlignment is = besides (yAlignFunc yAlignment <$> is)

above :: Image -> Image -> Image
above = (D.===)

aboves :: [Image] -> Image
aboves = D.vcat

aboveAlign :: Alignment -> Image -> Image -> Image
aboveAlign xAlignment i1 i2 =
  (i1 # xAlignFunc xAlignment)
  D.===
  (i2 # xAlignFunc xAlignment)

abovesAlign :: Alignment -> [Image] -> Image
abovesAlign xAlignment is = aboves (xAlignFunc xAlignment <$> is)

placeImage :: Image -> Float -> Float -> Image -> Image
placeImage image x y scene = newImage # D.snugCenterXY
  where
    newImage = image
               `D.atop`
               scene # D.alignTL # D.moveOriginBy (D.V2 x (-y))
              
placeImages :: [Image] -> [(Float, Float)] -> Image -> Image
placeImages images coords scene = foldl (\tempScene (i, (x, y)) -> placeImage i x y tempScene) scene (zip images coords)

placeImageAlign :: Image -> Float -> Float -> Alignment -> Alignment -> Image -> Image
placeImageAlign = _

placeImagesAlign :: [Image] -> [(Float, Float)] -> Alignment -> Alignment -> Image -> Image
placeImagesAlign = _

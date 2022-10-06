module Htdp.Combinator
  ( Alignment, low, mid, high
  , overlay
  , overlayAlign
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
overlayAlign xAlignment yAlignment i1 i2 =
  i1 # xAlignFunc xAlignment # yAlignFunc yAlignment
  `D.atop`
  i2 # xAlignFunc xAlignment # yAlignFunc yAlignment
  where
    xAlignFunc :: Alignment -> Image -> Image
    xAlignFunc Low = D.alignL
    xAlignFunc Mid = D.centerX
    xAlignFunc High = D.alignR

    yAlignFunc :: Alignment -> Image -> Image
    yAlignFunc Low = D.alignB
    yAlignFunc Mid = D.centerY
    yAlignFunc High = D.alignT

overlayOffset :: Image -> Float -> Float -> Image -> Image
overlayOffset = _

overlayAlignOffset :: Alignment -> Alignment -> Image -> Float -> Float -> Image -> Image
overlayAlignOffset = _

overlayXY :: Image -> Float -> Float -> Image -> Image
overlayXY = _

underlay :: Image -> Image -> Image
underlay = _

underlayAlign :: Alignment -> Alignment -> Image -> Image -> Image
underlayAlign = _

underlayOffset :: Image -> Float -> Float -> Image -> Image
underlayOffset = _

underlayXY :: Image -> Float -> Float -> Image -> Image
underlayXY = _

underlayAlignOffset :: Alignment -> Alignment -> Image -> Float -> Float -> Image -> Image
underlayAlignOffset = _

beside :: Image -> Image -> Image
beside = _

besides :: [Image] -> Image
besides = _

besideAlign :: Alignment -> Image -> Image -> Image
besideAlign = _

besidesAlign :: Alignment -> [Image] -> Image
besidesAlign = _

above :: Image -> Image -> Image
above = _

aboves :: [Image] -> Image
aboves = _

aboveAlign :: Alignment -> Image -> Image -> Image
aboveAlign = _

abovesAlign :: Alignment -> [Image] -> Image
abovesAlign = _

placeImage :: Image -> Float -> Float -> Image -> Image
placeImage = _

placeImages :: [Image] -> [(Float, Float)] -> Image -> Image
placeImages = _

placeImageAlign :: Image -> Float -> Float -> Alignment -> Alignment -> Image -> Image
placeImageAlign = _

placeImagesAlign :: [Image] -> [(Float, Float)] -> Alignment -> Alignment -> Image -> Image
placeImagesAlign = _

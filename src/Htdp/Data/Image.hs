module Htdp.Data.Image
  ( Image
  , width
  , height
  , rotate

  , Color
  , makeColor
  , makeColorI
  , rgbaOfColor
  , mixColors
  , addColors
  , dim
  , bright
  , light
  , dark
  , withRed
  , withGreen
  , withBlue
  , withAlpha
  , greyN

  , black, white, red, green, blue, yellow, cyan, magenta, rose, violet, azure
  , aquamarine, chartreuse, orange
  ) where

import Diagrams.Core ( QDiagram )
import Data.Monoid ( Any )
import Diagrams.Backend.Rasterific
import Diagrams.TwoD ( V2 )
import Diagrams.Prelude ( Colour )
import Data.Colour.Names

import qualified Diagrams as D


type Image = QDiagram Rasterific V2 Float Any

width :: Image -> Float
width = D.width

height :: Image -> Float
height = D.height

rotate :: Float -> Image -> Image
rotate = _


type Color = Colour Double

makeColor :: Float -> Float -> Float -> Float -> Color	 
makeColor = _

makeColorI :: Int -> Int -> Int -> Int -> Color
makeColorI = _

rgbaOfColor :: Color -> (Float, Float, Float, Float)
rgbaOfColor = _

mixColors :: Float -> Float -> Color -> Color -> Color	
mixColors = _

addColors :: Color -> Color -> Color
addColors = _

dim :: Color -> Color
dim = _

bright :: Color -> Color
bright = _

light :: Color -> Color
light = _

dark :: Color -> Color
dark = _

withRed :: Float -> Color -> Color
withRed = _

withGreen :: Float -> Color -> Color
withGreen = _

withBlue :: Float -> Color -> Color
withBlue = _

withAlpha :: Float -> Color -> Color
withAlpha = _

greyN :: Float -> Color
greyN = _

rose :: Color
rose = _

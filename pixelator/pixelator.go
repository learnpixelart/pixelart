package main

import (
    "fmt"
     _ "image"
    "image/color"
    "image/png"
    "log"
    "os"
)


// check if divod exists built-in - different name or such ??
func divmod(numerator, denominator int) (quotient, remainder int) {
	quotient  = numerator / denominator   // integer division, decimals are truncated
	remainder = numerator % denominator
	return
}


func rgba( c color.NRGBA ) int {
  // todo/fix:  conversion not working!!!!
  var num int = 0        // check if can use rgba as variable name???
  num += int(c.R << 24 )
  num += int(c.G << 16)
  num += int(c.B << 8)
  num += int(c.A)
  return num
}



func main() {

    path := os.Args[1]

    f, err := os.Open( path )
    if err != nil {
        log.Fatal(err)
    }
    defer f.Close()

    // imData, imType, err := image.Decode(file)
    // if err != nil {
    //    fmt.Println(err)
    // }

    // fmt.Println(imData)
    // fmt.Println(imType)

    fmt.Printf( "==> reading %s...\n", path )

    img, err := png.Decode( f )
    if err != nil {
        log.Fatal(err)
    }

    bounds := img.Bounds()
    image_width  := bounds.Max.X
    image_height := bounds.Max.Y

    fmt.Println( bounds )     // (0,0)-(12000,12000)

    width  := 24     // desired minified size
    height := 24

    cols  := 10
    rows  := 10

    // calculate pixel size / density / resolution
    //   how many pixels per pixel?
    xsize, xoverflow := divmod( image_width,  width*cols )
    ysize, yoverflow := divmod( image_height, height*rows )

    fmt.Printf( "minify image size from (%dx%d) to (%dx%d) - (%dx%d) with (%dx%d) tiles\n",
             image_width, image_height,
             width*cols, height*rows,
             width, height, cols, rows  )
    fmt.Printf( "  pixel size (%dx%d) - %d pixel(s) per pixel\n",
             xsize, ysize, xsize*ysize )
    if xoverflow > 0 || yoverflow > 0 {
      fmt.Printf( "    overflow x: %d, y: %d pixel(s)\n",
            xoverflow, yoverflow )
    }


    for x := 0; x < width*cols; x++ {
        for y := 0; y < height*rows; y++ {
           if x % width == 0 && y % height == 0 {
               // fmt.Printf( "  %d/%d\n", x, y )
               fmt.Print( "." )
           }

           pixels := make( map[color.NRGBA]int )
           for n:=0; n < xsize; n++ {
              for m:=0; m < ysize; m++ {


                // color := (color.RGBA) img.At( x, y )
                prepixel :=  img.At( x*xsize+n,
                                      y*ysize+m )
              // ncolor :=  nimg.ColorModel().Convert(color)
              // check if easier way to conver??
               pixel := color.NRGBAModel.Convert(prepixel).(color.NRGBA)

               pixels[ pixel ] += 1

               if x == 0 && y == 0 && n==0 && m==0 {
                  fmt.Printf( "  color(%d,%d,%d,%d)\n",
                        pixel.R, pixel.G, pixel.B, pixel.A )
                 // val := rgba( pixel )
                  // fmt.Printf( "%d - %0x\n", val, val )
                  fmt.Println( prepixel )
               }
              }
           }

           if len( pixels ) != 1 {
               fmt.Printf( "!! (%d/%d):\n", x, y )
               fmt.Println( pixels )
           }

           if x == 0 && y == 0 {
               fmt.Println( pixels )
           }


        }
    }
    fmt.Print( "\n" )


    fmt.Println( img.At( 0, 0 ) )   // {82 114 131 255}

    fmt.Println( "bye" )
}
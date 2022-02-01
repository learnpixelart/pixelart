package main

import (
    "fmt"
    "image"
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



func main() {

    path := os.Args[1]

    f, err := os.Open( path )
    if err != nil {
        log.Fatal(err)
    }
    defer f.Close()


    fmt.Printf( "==> reading %s...\n", path )

    img, err := png.Decode( f )
    if err != nil {
        log.Fatal(err)
    }

    bounds := img.Bounds()
    image_width, image_height := bounds.Max.X, bounds.Max.Y

    fmt.Println( bounds )     // e.g. (0,0)-(12000,12000)

    width, height := 24, 24     // desired minified size

    cols, rows := 10, 10


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


    img_pix := image.NewRGBA( image.Rect(0,0, width*cols, height*rows) )

    faux_transparent_pixel_i  := color.RGBA{82, 114, 131, 255}
    faux_transparent_pixel_ii := color.RGBA{81, 114, 132, 255}

    transparent_pixel      := color.RGBA{0, 0, 0, 0}

    for x := 0; x < width*cols; x++ {
        for y := 0; y < height*rows; y++ {
           if x % width == 0 && y % height == 0 {
               // fmt.Printf( "  %d/%d\n", x, y )
               fmt.Print( "." )
           }

           pixels := make( map[color.RGBA]int )
           for n:=0; n < xsize; n++ {
              for m:=0; m < ysize; m++ {

                prepixel :=  img.At( x*xsize+n,
                                     y*ysize+m )
                // check if easier way to convert??
                pixel := color.RGBAModel.Convert(prepixel).(color.RGBA)
                pixels[ pixel ]++

               if x == 0 && y == 0 && n==0 && m==0 {
                  // fmt.Printf( "  color(%d,%d,%d,%d)\n",
                  //      pixel.R, pixel.G, pixel.B, pixel.A )
                  fmt.Println( pixel )
               }
              }
           }

           if len( pixels ) != 1 {
               fmt.Printf( "!! (%d/%d):\n", x, y )
               fmt.Println( pixels )
           }

           sum := 0
           max_count := 0
           max_pixel := transparent_pixel
           for pixel, count := range pixels {
              sum += count
              if count > max_count {
                max_count = count
                max_pixel = pixel
              }
           }

           if max_pixel == faux_transparent_pixel_i ||
              max_pixel == faux_transparent_pixel_ii {
             img_pix.Set(x, y, transparent_pixel )
           } else {
             img_pix.Set(x, y, max_pixel )
           }

           if x == 0 && y == 0 {
               fmt.Println( pixels )
               fmt.Println( sum, max_count, max_pixel )
           }


        }
    }
    fmt.Print( "\n" )


    fmt.Println( img.At( 0, 0 ) )   // {82 114 131 255}


    fout, _ := os.Create( "./pix.png")
    png.Encode( fout, img_pix )


    fmt.Println( "bye" )
}
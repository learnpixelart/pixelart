package main

import (
    "fmt"
    "image"
    // "image/color"
    "image/png"
    "log"
    "os"
    "strconv"
)




func main() {
    /// arguments:
    //   [1]  -   input_file / image
    //   [2]  -   input_size  in pixels e.g. 512   (assumes square image - width==height e.g. 512x512)
    //   [3]  -   output_file / image
    //   [4]  -   ouput_size in pixels eg. 24

    path            := os.Args[1]
    pixel_in, _     := strconv.Atoi( os.Args[2] )

    outpath         := os.Args[3]
    pixel_out, _    := strconv.Atoi( os.Args[4] )


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

    // assert pixel size
    if image_width != pixel_in || image_height != pixel_in {
        log.Fatal( "!! ERROR - wrong input width x height" )
    }


    width, height := pixel_out, pixel_out     // desired minified size


    // todo/fix:  handle "overflow" if not perfect pixel density
    //
    // 2400x2400  (50x50)
    //   assume 48px per pixel 48x50 =  2400
    //
    //  e.g.   50.times {|i| puts "#{24+i*48} => #{i}," }



    // use an array of ints e.g
    //    [24, 72, ...],
    //     0 => 24
    //     1 => 72 etc.
    //
    pixel_offsets := make( []int, pixel_out )


    // pixel per pixel
    ppp := pixel_in / pixel_out
    // fmt.Println( ppp )

    for i := 0; i < pixel_out; i++ {
        offset := ppp/2 + i*ppp
        // fmt.Println(offset, i)
        pixel_offsets[i] = offset
    }

    // fmt.Println( pixel_offsets )



    img_pix := image.NewRGBA( image.Rect( 0, 0, width, height ) )

    for x := 0; x < pixel_out; x++ {
        for y := 0; y < pixel_out; y++ {
            pixel := img.At( pixel_offsets[x],
                             pixel_offsets[y] )
            img_pix.Set( x, y, pixel )
       }
    }

    fmt.Printf( "saving %s...\n", outpath )
    fout, _ := os.Create( outpath )
    png.Encode( fout, img_pix )


    fmt.Println( "bye" )
}
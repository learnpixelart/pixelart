package main

import (
    "flag"
    "fmt"
    "image"
    // "image/color"
    "image/png"
    "log"
    "os"
    "strconv"
)



func calc_steps( width int, new_width int, center bool ) []int {
  // todo/fix: assert new_width is smaller than width

  // fmt.Printf( "==> from: %dpx  to: %dpx\n", width, new_width )

  indexes := make( []int, new_width )

  base_step   := width / new_width    // pixels per pixel

  err_step    := (width % new_width) * 2   // multiply by 2
  denominator := new_width * 2          // denominator (in de - nenner  e.g. 1/nenner 4/nenner)

  // fmt.Println( "" )
  // fmt.Println( "base_step (pixels per pixel):" )
  // fmt.Printf(  "  %d   -  %d * %dpx = %dpx\n", base_step, base_step, new_width,base_step*new_width )
  // fmt.Printf(  "err_step  (in 1/%d*2):", width )
  // fmt.Printf(  "  %d / %d   - %d / %d = +%dpx overflow\n", err_step, denominator,
  //                                   err_step*new_width, denominator,
  //                                   err_step*new_width/denominator )
  // fmt.Println( "" )


  // initial pixel offset
  index := 0
  err   := err_step/2   //  note: start off with +err_step/2 to add overflow pixel in the "middle"

  if center  {
      index += base_step/2
  }

  for i := 0; i < new_width; i++  {
    if err >= denominator {    // ## overflow
        // fmt.Printf( "    -- overflow %d/%d - add +1 pixel offset to %d\n", err, denominator, i )
      index += 1
      err   -= denominator
    }

    // fmt.Printf( "%d => %d  -- %d / %d\n", i, index, err, denominator )

    indexes[i] = index

    index += base_step
    err   += err_step
  }

  return indexes
}






func main() {
    var top_x int
    var top_y int

    flag.IntVar( &top_x, "top_x", 0, "top x" )
    flag.IntVar( &top_y, "top_y", 0, "top y" )

    flag.Parse()


    /// arguments:
    //   [0]  -   input_file / image
    //   [1]  -     input_size_x / width   in pixels e.g. 512
    //   [2]  -     input_size_y / height  in pixels e.g. 512
    //   [3]  -   output_file / image
    //   [4]  -     ouput_size_x / width  in pixels eg. 24
    //   [5]  -     ouput_size_y / height in pixels eg. 24

    args := flag.Args()

    path            := args[0]
    width, _        := strconv.Atoi( args[1] )
    height, _       := strconv.Atoi( args[2] )

    outpath         := args[3]
    new_width, _    := strconv.Atoi( args[4] )
    new_height, _   := strconv.Atoi( args[5] )


    steps_x := calc_steps( width,  new_width,  true )
    steps_y := calc_steps( height, new_height, true )

    // fmt.Printf( "steps_x %v\n", steps_x )
    // fmt.Printf( "steps_y %v\n", steps_y )


    // fmt.Printf( "top_x %d, top_y %d\n", top_x, top_y )
    // fmt.Println( "" )


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
    fmt.Println( bounds )     // e.g. (0,0)-(12000,12000)

    // assert pixel size
    //  image_width, image_height := bounds.Max.X, bounds.Max.Y
    // if image_width != pixel_in || image_height != pixel_in {
    //    log.Fatal( "!! ERROR - wrong input width x height" )
    // }


    img_pix := image.NewRGBA( image.Rect( 0, 0, new_width, new_height ) )

    for x, step_x := range steps_x  {
        for y, step_y := range steps_y {
            pixel := img.At( top_x + step_x,
                             top_y + step_y )
            img_pix.Set( x, y, pixel )
       }
    }

    fmt.Printf( "saving %s...\n", outpath )
    fout, _ := os.Create( outpath )
    png.Encode( fout, img_pix )


    fmt.Println( "bye" )
}
package main

import (
    "fmt"
    // "image"
    "image/png"
    "log"
    "os"
)

func main() {

    path := os.Args[1]

    file, err := os.Open( path )
    if err != nil {
        log.Fatal(err)
    }
    defer file.Close()

    // imData, imType, err := image.Decode(file)
    // if err != nil {
    //    fmt.Println(err)
    // }

    // fmt.Println(imData)
    // fmt.Println(imType)

    fmt.Println( "==> reading %s...", path )

    img, err := png.Decode( file )
    if err != nil {
        log.Fatal(err)
    }
    fmt.Println( img.Bounds() )     // (0,0)-(12000,12000)

    fmt.Println( img.At( 0, 0 ) )   // {82 114 131 255}

    fmt.Println( "bye" )
}
# Pop Art Helpers


Use the free pop art image helpers
to turn your pixel art
into multi-million dollar pop art orginals!




## Usage

Let's try the portrait of Frida (Kahlo) ![](i/frida_kahlo-24x24.png)
in the classic 24×24pixel art format:

``` ruby
require 'popart'

frida = Image.read( 'i/frida_kahlo-24x24.png' )
```



### Double Frida (2×1)

Let's try `Image#double` also known as `Image#two` or `Image#double_ii`:

``` ruby
YELLOW = '#ff0000'   # let's try a yellow background (color in rgb)

popart = frida.double( background: YELLOW )
popart.save( 'i/frida_kahlo-double.png' )
popart.zoom(8).save( 'i/frida_kahlo-double@8x.png' )
```

And voila - Las Dos Fridas :-)

![](i/frida_kahlo-double.png)

8x <br>
![](i/frida_kahlo-double@8x.png)



### Triple Frida  (3×1)

Let's try `Image#triple` also known as `Image#three` or `Image#double_iii`:

``` ruby
popart = frida.triple( background: YELLOW )
popart.save( 'i/frida_kahlo-triple.png' )
```

And voila!

![](i/frida_kahlo-triple.png)



### Thirty Fridas Is Better Than One (6×5)

Let's try `Image#thirty` also known as `Image#double_xxx`:

``` ruby
popart = frida.thirty( background: YELLOW )
popart.save( 'i/frida_kahlo-thirty.png' )
```

And voila!

![](i/frida_kahlo-thirty.png)



### Forty-Two Fridas Is Better Than One (7×6)

Let's try `Image#fortytwo` also known as `Image#double_xlii`:

``` ruby
popart = frida.fortytwo( background: YELLOW )
popart.save( 'i/frida_kahlo-fortytwo.png' )
```

And voila!

![](i/frida_kahlo-fortytwo.png)



### Two Hundred Fridas Is Better Than One (20×10)

Let's try `Image#twohundred` also known as `Image#double_cc`:

``` ruby
popart = frida.twohundred( background: YELLOW )
popart.save( 'i/frida_kahlo-twohundred.png' )
```

And voila!

![](i/frida_kahlo-twohundred.png)


And so on.





## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.



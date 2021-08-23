# ocaml-gtag

Binding to [google-gtag-module](https://github.com/nuxt-community/google-gtag-module)

## What does ocaml-cordova-plugin-firbase do ?

`gtag` allows you to send event data to Google Analytics, Google Ads,
and Google Marketing Platform. You can see more details in the [gtag.js oficial
documentation](https://developers.google.com/analytics/devguides/collection/gtagjs/)

## How to install and compile your project by using this plugin ?

You can use opam by pinning the repository with:
```Shell
opam pin add gtag https://github.com/Thibaut-Gudin/ocaml-gtag
```

to compile your project, use:
```Shell
dune build @install
```

Finally, install the "gtag" plugin with:
```Shell
cordova plugin add gtag
```


## How to use it?

### `Gtag.available`
This function indicates if the *gtag* function is available in your
current dev environment, you should made an evaluation with it before
trying to use *Gtag.gtag*.

### `Gtag.gtag`
This is the main function that sends an event to the Google servers, the
first argument indicates the *event* send, the second argument indicates
the name of the *event*.
The third argument is an object of type `Ojs.t` (the object you ask to
send to Google), this type is used because it can cover different kind
of values by itself.
You will mainly use the `Ojs.obj` function in order to create the object
you need to send. This function turn an array of type `("property name",
*property value*)` into an object with a "key-value" structure. The
`property name` is always a string but the *property value* has to be
an `Ojs.t` value, but depending of the value you want to put into your
property, you can easily do the conversion with the help of the [functions from the Ojs
library](https://github.com/LexiFi/gen_js_api/blob/bee3b595898fdaf7db0366a9b1a009db9a6c6026/lib/ojs.mli)


Example
```Ocaml
Gtag.gtag ~event:"event" ~event_name:"example"
        (Ojs.obj
           (Array.of_list
              [("page_title", Ojs.string_to_js "Example Page");
              ("anonymize_ip", Ojs.bool_to_js true)]))
```

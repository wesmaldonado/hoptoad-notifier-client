= hoptoad-notifier-client

* Nothing yet, no website, this is it.

== DESCRIPTION:

Sends exceptions to Hoptoad [http://www.hoptoadapp.com/] using HTTParty


== FEATURES/PROBLEMS:

* Easy to use in non-rails apps and less code than doing it yourself.
* Can pass in 'request' and 'response' as optional arguments.

== SYNOPSIS:

  HoptoadNotifierClient.configure do |toad|
    toad.api_key = 'your-api-key'
  end
  begin
    raise 'Not a happy camper!'
  rescue => ex
    HoptoadNotifierClient.notify(ex)
  end

== REQUIREMENTS:

* HTTParty

== INSTALL:

* TODO (sudo gem install, anything else)

== LICENSE:

(The MIT License)

Copyright (c) 2008 Wes Maldonado 

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# travis-timecop
Test example to figure out bug with Timecop while run under travis

On my local machine, I get the following time values

````
Timecop.freeze("2015-03-01")
=> 2015-03-01 00:00:00 -0800
Timecop.freeze(1.month.from_now)
=> 2015-04-01 00:00:00 -0700
````

On Travis CI vm:
````
Timecop.freeze("2015-03-01")                                                     
=> 2015-03-01 00:00:00 +0000                                                                     
Timecop.freeze(1.month.from_now)                                                 
=> 2015-03-28 23:00:00 +0000 # WEIRD!
````

But then if it you do it this way, it works:
````
Timecop.freeze("2015-03-01")                                                     
=> 2015-03-01 00:00:00 +0000                                                                
Timecop.freeze(Time.now + 1.month)                                             
=> 2015-04-01 00:00:00 +0000
````

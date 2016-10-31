# Jungle Beat

A linked list utilizing the following methods:
* append
* prepend
* count
* insert
* find
* include?
* pop

To run this application, clone down this repository.
From the command line:
> require "./lib/jungle_beat"
> jb = JungleBeat.new
=> <JungleBeat list=<LinkedList head=nil #234567890890> #456789045678>
> jb.append("deep doo ditt woo hoo shu")
=> "deep doo ditt woo hoo shu"
> jb.count
=> 6
> jb.list.count
=> 6
> jb.play
=> # plays the sounds deep doo ditt woo hoo shu

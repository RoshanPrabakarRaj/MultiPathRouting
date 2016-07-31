#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     20                         ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(energymodel)    EnergyModel 
set val(x)      1351                      ;# X dimension of topography
set val(y)      100                      ;# Y dimension of topography
set val(stop)   10.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)
set 1hnf [open Neighborlist.tr w]
$ns trace-all $1hnf
set 2hnf [open 2hop_Neighbors.tr w]
$ns trace-all $2hnf
set rt [open Routingtable.tr w]
$ns trace-all $rt
#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON \
				-energyModel $val(energymodel) \
					-idlePower 1.0 \
					-rxPower 1.0 \
					-txPower 1.0 \
          		 -sleepPower 0.001 \
          		 -transitionPower 0.2 \
          		 -transitionTime 0.005 \
				-initialEnergy 30

#===================================
#        Nodes Definition        
#===================================
#Create 20 nodes
set n(0) [$ns node]
$n(0) set X_ 1001
$n(0) set Y_ 300
$n(0) set Z_ 0.0
$ns initial_node_pos $n(0) 20
set n(1) [$ns node]
$n(1) set X_ 859
$n(1) set Y_ 416
$n(1) set Z_ 0.0
$ns initial_node_pos $n(1) 20
set n(2) [$ns node]
$n(2) set X_ 801
$n(2) set Y_ 196
$n(2) set Z_ 0.0
$ns initial_node_pos $n(2) 20
set n(3) [$ns node]
$n(3) set X_ 695
$n(3) set Y_ 297
$n(3) set Z_ 0.0
$ns initial_node_pos $n(3) 20
set n(4) [$ns node]
$n(4) set X_ 645
$n(4) set Y_ 475
$n(4) set Z_ 0.0
$ns initial_node_pos $n(4) 20
set n(5) [$ns node]
$n(5) set X_ 784
$n(5) set Y_ 531
$n(5) set Z_ 0.0
$ns initial_node_pos $n(5) 20
set n(6) [$ns node]
$n(6) set X_ 568
$n(6) set Y_ 274
$n(6) set Z_ 0.0
$ns initial_node_pos $n(6) 20
set n(7) [$ns node]
$n(7) set X_ 585
$n(7) set Y_ 158
$n(7) set Z_ 0.0
$ns initial_node_pos $n(7) 20
set n(8) [$ns node]
$n(8) set X_ 738
$n(8) set Y_ 66
$n(8) set Z_ 0.0
$ns initial_node_pos $n(8) 20
set n(9) [$ns node]
$n(9) set X_ 898
$n(9) set Y_ 141
$n(9) set Z_ 0.0
$ns initial_node_pos $n(9) 20
set n(10) [$ns node]
$n(10) set X_ 514
$n(10) set Y_ 33
$n(10) set Z_ 0.0
$ns initial_node_pos $n(10) 20
set n(11) [$ns node]
$n(11) set X_ 402
$n(11) set Y_ 238
$n(11) set Z_ 0.0
$ns initial_node_pos $n(11) 20
set n(12) [$ns node]
$n(12) set X_ 406
$n(12) set Y_ 386
$n(12) set Z_ 0.0
$ns initial_node_pos $n(12) 20
set n(13) [$ns node]
$n(13) set X_ 497
$n(13) set Y_ 496
$n(13) set Z_ 0.0
$ns initial_node_pos $n(13) 20
set n(14) [$ns node]
$n(14) set X_ 606
$n(14) set Y_ 614
$n(14) set Z_ 0.0
$ns initial_node_pos $n(14) 20
set n(15) [$ns node]
$n(15) set X_ 363
$n(15) set Y_ 569
$n(15) set Z_ 0.0
$ns initial_node_pos $n(15) 20
set n(16) [$ns node]
$n(16) set X_ 283
$n(16) set Y_ 380
$n(16) set Z_ 0.0
$ns initial_node_pos $n(16) 20
set n(17) [$ns node]
$n(17) set X_ 253
$n(17) set Y_ 234
$n(17) set Z_ 0.0
$ns initial_node_pos $n(17) 20
set n(18) [$ns node]
$n(18) set X_ 307
$n(18) set Y_ 105
$n(18) set Z_ 0.0
$ns initial_node_pos $n(18) 20
set n(19) [$ns node]
$n(19) set X_ 397
$n(19) set Y_ 19
$n(19) set Z_ 0.0
$ns initial_node_pos $n(19) 20

for {set i 0} {$i<$val(nn)} {incr i} {
	$n($i) color yellowgreen
	$ns at 0.0 "$n($i) color yellowgreen"
}

$ns at 0.0 "$n(0) color blue"
$ns at 0.0 "$n(0) add-mark m0 dodgerblue hexagon"
$ns at 0.0 "$n(0) label Sink"
for {set i 1} {$i<$val(nn)} {incr i} {
	$ns at 0.0 "$n($i) add-mark m1 darkgreen"
}
for {set i 0} {$i<$val(nn)} {incr i} {
	set energy($i) 100
}
proc sleepPower {node} {
	global array names energy ns array names n
	set ti 0.005
	set energy($node) [expr $energy($node)-0.001]
	$ns at [expr [$ns now]+$ti] "sleepPower $node"
}

proc activeMode {node} {
	global array names energy ns array names n
	set energy($node) [expr $energy($node)-1.0]
}
for {set i 0} {$i<$val(nn)} {incr i} {
	sleepPower $i
}

#neighbor discovery
for {set i 0} {$i<$val(nn)} {incr i} {
	set neighborlist($i) [list]
	set 2hopneighbor(i) [list]
	set x_pos1 [$n($i) set X_]
	set y_pos1 [$n($i) set Y_]
	for {set j 0} {$j<$val(nn)} {incr j} {
		if {$j!=$i} {
			set x_pos2 [$n($j) set X_]
			set y_pos2 [$n($j) set Y_]
			set x_pos [expr $x_pos1-$x_pos2]
			set y_pos [expr $y_pos1-$y_pos2]
			set v [expr $x_pos*$x_pos+$y_pos*$y_pos]
			set d [expr sqrt($v)]
			set nd($i,$j) $d
			#puts "Distance from $i to $j:$d"
			if {$d<250} {
				$n($i) add-neighbor $n($j)
			}
			if {$d>250 && $d<400} {
				lappend 2hopneighbor($i) $j
			}
		}
	}
	set neighbor1 [$n($i) neighbors]
	foreach nb1 $neighbor1 {
		set now [$ns now]
		puts "The neighbor for node $i are:$nb1"
		set idv [$nb1 id]
		puts "$idv"
		lappend neighborlist($i) $idv
	}
}
#One hop table formation
for {set i 0} {$i<$val(nn)} {incr i} {
	puts $1hnf "Orginator Neighbors"
	puts $2hnf "Node $i"
	puts $2hnf "2-hopNeighbors"
	puts $2hnf "________________"
	puts $1hnf "_____________________"
	foreach ni $neighborlist($i) {
		puts $1hnf "$i        $ni"
	}
	foreach h2ni $2hopneighbor($i) {
		puts $2hnf "$h2ni"
	}
}

#Routing table
puts $rt "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	puts $rt "RouteFrom 	RouteTo		Route"
	puts $rt "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	for {set des 0} {$des<$val(nn)} {incr des} {
		for {set j 0} {$j<$val(nn)} {incr j} {
			if {$des!=$j} {
				lappend route($j,$des) $j
				set s $j
				set flag 0
				set RN $s
				puts "Route from $j to $des"
				while {$RN!=$des} {
					puts "RN:$RN"
					foreach rn $neighborlist($RN) {
						if {$rn==$des} {
							set flag 1
						}
					}
					if {$flag==1} {
						set RN1 $des
					} else {
						set x_pos1 [$n($des) set X_]
						set y_pos1 [$n($des) set Y_]
						set dL [list]
						foreach rnod $neighborlist($RN) {
							set x_pos2 [$n($rnod) set X_]
							set y_pos2 [$n($rnod) set Y_]
							set x_pos [expr $x_pos1-$x_pos2]
							set y_pos [expr $y_pos1-$y_pos2]
							set v [expr $x_pos*$x_pos+$y_pos*$y_pos]
							set D2 [expr sqrt($v)]							
							lappend dL $D2
							set dis($des,$rnod) $D2
						}
						set dis1 [lsort -real $dL]
						set mindis [lindex $dis1 0]
						foreach i $neighborlist($RN) {
							if {$i!=$des} {
								if {$mindis==$dis($des,$i)} {
									set RN1 $i
								}
							}
						}
					}
					set RN $RN1
					lappend route($j,$des) $RN
					puts "$RN"
				}
				puts $rt "$j		$des		$route($j,$des)"
			}			
		}
	}
puts "Enter the Source node ID (1-19)"
set sn [gets stdin]
$ns at 0.0 "$n($sn) label source"
set dn 0
#Multiple Paths
set nnei [llength $neighborlist($sn)]
puts "NNEI:$nnei"
for {set i 0} {$i<$nnei} {incr i} {
	set NRn [lindex $neighborlist($sn) $i]
	lappend aroute($i) $sn
		if {$NRn!=$dn} {
			foreach rnv $route($NRn,$dn) {
				lappend aroute($i) $rnv
			}
		}
		$ns at [$ns now] "$ns trace-annotate \"Available route($i): $aroute($i)\""
	puts "AROUTE($i): $aroute($i)"
}
#===================================
#        Agents Definition        
#===================================
proc attach-cbr-traffic {node sink size interval} {
	global ns
	set source [new Agent/UDP]
	$source set class_ 2
	$ns attach-agent $node $source
	set traffic [new Application/Traffic/CBR]
	$traffic set packetSize_ $size
	$traffic set interval_ $interval
	$traffic attach-agent $source
	$ns connect $source $sink
	return $traffic
}

set null [new Agent/LossMonitor]
$ns attach-agent $n($sn) $null
set cbr [attach-cbr-traffic $n($dn) $null 100 0.05]
$ns at 0.0 "$cbr start"
$ns at 10.0 "$cbr stop"
#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n($i) reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run

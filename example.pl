use lib './blib';
use lib './blib/arch/';
use lib './blib/lib/';
use Net::MDNS::Client ':all';

my $q = make_query("host by service", "", "local.", "perl", "tcp");
print "Query is !$q!\n";
query( "host by service", $q);

while (1)
	{
		if (process_network_events())
			{
				while (1) {
				#print "Found host: ",join(", ", get_a_result($q, "host by service")), "\n";
				print "Found host: ",scalar(get_a_result("host by service", $q)), "\n";
				sleep 1;
				}
			}
	}
				

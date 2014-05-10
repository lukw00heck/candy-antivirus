package IsKernel::CandyAntivirus::EngineResponse;

use warnings;
use strict;
use v5.14;

=pod
Description:
	Creates a new object
Parameters
	response - the response generated by the engine
	status - the status of the response, if any
Returns
	A reference to the object
=cut
sub new
{
	(my $class, my $response, my $status) = @_;
	my $self = {};
	
	$self->{"PrintResponse"} = $response;
	$self->{"LogResponse"} = localtime." ".$response;
	$self->{"Status"} = $status;
	bless $self, $class;	
	return $self;
}

=pod
Description:
	Returns the response in print form
Parameters:
	None
Returns:
	The response in print form
=cut
sub get_print_response
{
	my $self = shift;
	return $self->{"PrintResponse"};
}

=pod
Description:
	Returns the response in log form
Parameters:
	None
Returns:
	The response in log form
=cut
sub get_log_response
{
	my $self = shift;
	return $self->{"LogResponse"};
}

=pod
Description:
	Returns the response status
Parameters:
	None
Returns:
	An code representing the status of the engine response
=cut
sub get_status
{
	my $self = shift;
	return $self->{"Status"};
}

1;
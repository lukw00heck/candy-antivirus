package IsKernel::Infrastructure::FileHelper;

use warnings;
use strict;
use v5.14;

=pod
Description:
	Creates a new instance of FileHelperBase
Parameters:
	path - the path to the file used by the logger
Returns
	A reference to the object
=cut
sub new
{
	(my $class, my $path) = @_;
	my $self->{"path"} = $path;
	bless $self, $class;
	return $self; 
}

=pod
Description:
	Sets the file path of the object.
Parameters:
	None
Returns
	None
=cut
sub set_path
{
	(my $self, my $new_path) = @_;
	$self->{"path"} = $new_path;
}


=pod
Description:
	Gets the file path used by the object
Parameters:
	path - the new path
Returns
	None
=cut
sub get_path
{
	my $self = shift;
	my $temp = $self->{"path"};
	return $temp;
}


=pod
Description:
	Appends the string to the object file
Parameters:
	message - the message which will be appended
Returns
	None
=cut
sub append_to_file
{
	(my $self, my $message) = @_;
	open(my $handle, 
		 ">>",
		 $self->get_path(),
		) or die("Could not append message to file");
	print $handle $message;
	close($handle);
}

=pod
Description
	Returns the content of the file as an array
Parameters:
	None
Returns:
	An array containing every line of the content
=cut
sub get_content_as_array
{
	(my $self) = @_;
	open(my $handle, 
		 "<",
		 $self->get_path()
		) or die("Could not open file");
	my @lines = <$handle>;
	close($handle);
	return @lines;
}

=pod
Description
	Returns the content of the file as a string
Parameters:
	None
Returns:
	A string containing the entire content of the file
=cut
sub get_content_as_string
{
	(my $self) = @_;
	my @lines = $self->get_content_as_array();
	my $result = join("",@lines);
	return $result;
}

=pod
Description:
	Creates a file at the specified path with the specified content
Parameters:
	path - the path to the file
	content - the content of the file as a scalar
Returns:
	Nothing 
=cut
sub write_to_file
{
	(my $self, my $content) = @_;
	open(my $handle, ">", $self->get_path()) or die("Could not create file at ".$self->get_path());
	print $handle $content;
	close($handle);
}

=pod
Description
	Deletes a file
Parameters:
	None
Returns:
	Nothing
Type:
	Public
=cut
sub delete_file
{
	(my $self) = @_;
	unlink $self->get_path();
}

#END OF MODULE
1;
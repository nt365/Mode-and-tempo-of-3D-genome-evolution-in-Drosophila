#!/usr/bin/perl -w

use strict;

my $mate1 = shift;
my $mate2 = shift;
my $u1 = shift;
my $u2 = shift;
my $p = shift;
my $n = shift;

open(P1IN,"gunzip -c $mate1 |");
open(P2IN,"gunzip -c $mate2 |");
open(P1OUT,">","$p/split_$n.P1.fa");
open(P2OUT,">","$p/split_$n.P2.fa");

while(my $id1 = <P1IN>){
    my $seq1 = <P1IN>;
    my $tem1 = <P1IN>;
    my $qua1 = <P1IN>;

    my $id2  = <P2IN>;
    my $seq2 = <P2IN>;
    my $tem2 = <P2IN>;
    my $qua2 = <P2IN>;

    chomp $id1;
    chomp $seq1;
    chomp $tem1;
    chomp $qua1;

    chomp $id2;
    chomp $seq2;
    chomp $tem2;
    chomp $qua2;

    $seq1 =~ s/GCTGAGGGATCCCTCAGC/\t/;
    my @ar1 = split("\t",$seq1);
    my $split=0;
    if(scalar(@ar1)==2 && length($ar1[0])>=18 && length($ar1[1])>=18){
	my $p1 = $ar1[0];
	my $p2 = reverse($ar1[1]);
	$p2 =~ tr/ATGC/TACG/;
	$id1 =~ s/@/>/;
	print P1OUT $id1,"\n",$p1,"\n";
	print P2OUT $id1,"\n",$p2,"\n";
	$split=1;
    }

    $seq2 =~ s/GCTGAGGGATCCCTCAGC/\t/;
    my @ar2 = split("\t",$seq2);
    if(scalar(@ar2)==2 && length($ar2[0])>=18 && length($ar2[1])>=18){
	my $p1 = reverse($ar2[0]);
	my $p2 = $ar2[1];
	$p1 =~ tr/ATGC/TACG/;
	$id2 =~ s/@/>/;
	print P1OUT $id2,"\n",$p1,"\n";
	print P2OUT $id2,"\n",$p2,"\n";
	$split=1;
    }

    if($split==0){
	$id1 =~ s/@/>/;
	$id2 =~ s/@/>/;
	print P1OUT $id1,"\n",$seq1,"\n";
	print P2OUT $id1,"\n",$seq2,"\n";
    }

}
close(P1IN);
close(P2IN);

open(U1IN,"gunzip -c $u1 |");
while(my $id1 = <U1IN>){
    my $seq1 = <U1IN>;
    my $tem1 = <U1IN>;
    my $qua1 = <U1IN>;

    chomp $id1;
    chomp $seq1;
    chomp $tem1;
    chomp $qua1;

    $seq1 =~ s/GCTGAGGGATCCCTCAGC/\t/;
    my @ar1 = split("\t",$seq1);
    my $split=0;
    if(scalar(@ar1)==2 && length($ar1[0])>=18 && length($ar1[1])>=18){
	my $p1 = $ar1[0];
	my $p2 = reverse($ar1[1]);
	$p2 =~ tr/ATGC/TACG/;
	$id1 =~ s/@/>/;
	print P1OUT $id1,"\n",$p1,"\n";
	print P2OUT $id1,"\n",$p2,"\n";
	$split=1;
    }
}
close(U1IN);

open(U2IN,"gunzip -c $u2 |");
while(my $id1 = <U2IN>){
    my $seq1 = <U2IN>;
    my $tem1 = <U2IN>;
    my $qua1 = <U2IN>;

    chomp $id1;
    chomp $seq1;
    chomp $tem1;
    chomp $qua1;

    $seq1 =~ s/GCTGAGGGATCCCTCAGC/\t/;
    my @ar1 = split("\t",$seq1);
    my $split=0;
    if(scalar(@ar1)==2 && length($ar1[0])>=18 && length($ar1[1])>=18){
	my $p1 = $ar1[0];
	my $p2 = reverse($ar1[1]);
	$p2 =~ tr/ATGC/TACG/;
	$id1 =~ s/@/>/;
	print P1OUT $id1,"\n",$p1,"\n";
	print P2OUT $id1,"\n",$p2,"\n";
	$split=1;
    }
}
close(U2IN)

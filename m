Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:35574 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753665AbcGTIwz (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 20 Jul 2016 04:52:55 -0400
Date: Wed, 20 Jul 2016 10:52:46 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ARM: shmobile: r8a7794: tidyup SDHI register size on DTSI
Message-ID: <20160720085246.GA1673@katana>
References: <1469002759-2860-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <1469002759-2860-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -		reg = <0 0xee100000 0 0x200>;
> +		reg = <0 0xee100000 0 0x384>;

All other r8a779x.dtsi have 0x328 there.


--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXjzveAAoJEBQN5MwUoCm2pusP/2R9o/uP9x6XMCHiE8PCBW+S
OdtSb0FzyFD0ONkJsLxEYOD66NpMd3L3QuBr0lL/lB/K/IkBpAWrowZQpMgfBEyt
/wXG3ZBvPdG6Tt0xUvRVPsNENlt41Ni4k9rfWAMGAyLGO4IYTUxw9cvKiJpZWstb
RXIS7viM3pvf+Y7hCHW3zpf7TmGxu5WftxFxwqeUt5YtJx0pyNzumzn3JLit+4ud
RyMBmC/3cLrL81xs4j15hHCJUABT1zrP/aAPsv09nnR9hV9GG+VFZAHYqp2UeykG
3Fyrut1yl+fx1BY/lG16rKyfh3NCgo9oaW7Ri4gC1IoE8Dui7k5dx6fdEWubKRc3
23TuTU4JvSPK8QaG7VIjrrFFd/zEYtOpEH2RldY6wrJIPm/o9Zoev9qHvrXb+MtE
yD+ZOYbuPwPf+TfPNrNDMCWCJPO19Elr4aIUc7wMmceAJ6FCi1x9Q3wlj1iUGR/O
vWCN+zooHnnmMArobllCIPl6HxiMXHaFK/eQlaZT9mzvdMbwTZbMaLDb/+LIj9c6
TxoJ4jpapU3LiJc+lldOfLHV0v5etjqcZBT8O5A2R3MIbuRAFnB0cc2us0k3xmmE
8JgO0gXLFdbZTETOoALjFdw7MoOlU0g0m25j92SWIUCVMJi4g+xpzuPOuiHnAfpD
8f+qCp7Eb7yQUh9xaUj7
=IFMz
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:56797 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753557AbcEMWRe (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 13 May 2016 18:17:34 -0400
Date: Sat, 14 May 2016 00:17:26 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PULL REQUEST] renesas/topic/gen3-sdio for renesas-drivers
Message-ID: <20160513221726.GA1720@katana>
References: <20160513123045.GA12309@katana>
 <CAMuHMdW13P=EbkukgNCt+OENqpH0LJY3L-F9N=y5zEhiyjhfpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW13P=EbkukgNCt+OENqpH0LJY3L-F9N=y5zEhiyjhfpw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> BTW, for renesas-drivers, please don't base pull requests on the previous
> version, as that may cause massive conflicts when creating the next version
> (many for-next trees may be rebased).

Rebased for-next trees? Uhhh...

> I'd rather merge your staging/ks7010 branch (which is based on non-changing
> v4.6-rc7) and a branch containing the two mmc commits (based on a stable
> commit, too, or Ulf's mmc/next if everything else fails).

Understood. Will do next time!

Thanks and have a nice weekend,

   Wolfram


--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXNlJ2AAoJEBQN5MwUoCm2PooP/3Zu/085ve5/ZWDgcweI7GtO
PiCvtbBCnU/vquOX8dAvx3BGAD2V8cEc2wzriXAm21boF1o+TY7wipyEjo0iGgD8
JSBWEq7Dl3CWj96/lMZw/qg2Qd0PIEicumcFDxBZjJ0420six/v7rVuAwuPwnrkr
/bZHlB2ftDkz9lypq8jDcbwHro5ClITOBiuCgl156lfJdDZc+kP9jHtxOMQ0mZpS
EUNH0btAgq2C3obsvRjvEzbbmpGi3JjZwTw9yrbWOMXmB4fG+B3J6HI+XOF88bzW
YFBJz7PTBUBoIBcmuK+fUZFW1jyBMacTPsrp2X0jtuuFvcS6mspBrHClhQQwufAa
wf27bj7JtGpVCul9Zrm9wSwly7iMG0jrT4V5RCKVYPut4zJPQO59a1yqnfcYLlVX
s8CSZ05Xg8KLOpX4XI75orvMxbp3zHeQxJ7GCEVeaMsCqGtflCabPlOsxrpyk5wM
XK3GkV3D76QhoiyiXitNr8eYVMO52540HHsBs3DcPi9F34+tf3GH32FgHtYL9P6Z
M7MY6wLePD66+8KwYnmJkauQAB/9oSl/ul9h/eOrZjloSh0q/yYAcu+knBSGMnEg
BSkQu0bkToru1Q59SjahCNpWpTklJzI2ReBT32vvqQ/vtFQmV3Y7IOSqkjx/GGCJ
l5gmSXBWGL5m66bO4cSX
=/jQh
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--

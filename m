Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:32934 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753359AbdAZKEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 05:04:00 -0500
Date: Thu, 26 Jan 2017 11:03:56 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170126100355.GA1435@katana>
References: <20170104173954.3135-1-wsa+renesas@sang-engineering.com>
 <20170112224353.GB1490@katana>
 <20170113083719.GE2269@verge.net.au>
 <20170113083928.GD1446@katana>
 <20170126100116.GC21851@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <20170126100116.GC21851@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 11:01:17AM +0100, Simon Horman wrote:
> On Fri, Jan 13, 2017 at 09:39:28AM +0100, Wolfram Sang wrote:
> > > Sorry for missing these.
> > > I have queued them up for v4.11.
> >=20
> > Thank you!
>=20
> On my r8a7796/salvator-x I see the following with this series applied:
>=20
> sh_mobile_sdhi ee140000.sd: timeout waiting for hardware interrupt (CMD13)

Do you have the HS200 enablement patches in that branch? They are
currently in -next.


--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYicmLAAoJEBQN5MwUoCm20WkP/i9FfPtFKiPEqk4uiDDR7DHh
GK2l+mANx4fmHeYyttqtgyFYwL4tHDS5t5jIJEvbci0j+LoQUBZl3bifJfhUooP8
Gf90qRLpkUkN2KygWlH6LVyAwDVx/mku1g0v05p2s2NXDjDEXMaSTrIvr5EXF1AQ
MI6QSjmk+kkB1zG4P779pqJGH6esd2LhbRhB35VlqzuUgOxrU6dhAnRZUywL3pZW
n5PwFxN6ADCiFk6jB4GtFlYlDl4MYlGPr3q6NoYvHzNEZg8IAUYvKGHeGrV54NON
/MFoqCjOmOER51V7m+i2CLQFpBTkxpUpCgz1vnfycJcPVjuRtCLPedBaIatEPhbR
G61YI9Da92PTzg/vDpX/iaRWRs7Lh/KT8mQhABDa3BQnJGuQSDdDlh1X7l2cYVtI
0pSack+OlD3B4hnbi/jmLLbRDaqJdMQ1SBEf5r4aexWxJQcjlGN+takeVJ61SaXU
lVUk+lUvfcedqdJq6C0qygp6cvvP/brvLA9dAau5MF76rJ/cVB88abgfMbYyf4Oq
fEZaKBUQ85LV/s9ZYZsHIuK9CsNrh3VDsMYj7COkzDGJMrKhglKu3W3onaRWYWOM
ZoCS8SGe4eJ4QJhV9zkyxks+VJQyslMcbNKfCDu4JIWH9abx3QJgiR7PK9LZsr/v
DmicXFjS1b/gF4Bm1Jnw
=ExNm
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--

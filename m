Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:34551 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750954AbcEKGG0 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 02:06:26 -0400
Date: Wed, 11 May 2016 08:06:15 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Greg KH <greg@kroah.com>
Cc: driverdev-devel@linuxdriverproject.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/27] staging: add driver for KS7010 based SDIO cards
Message-ID: <20160511060614.GA1637@katana>
References: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
 <20160510210534.GB17923@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
In-Reply-To: <20160510210534.GB17923@kroah.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2016 at 11:05:34PM +0200, Greg KH wrote:
> On Tue, May 10, 2016 at 03:52:13PM +0200, Wolfram Sang wrote:
> > This driver can be used with later Spectec SDW-821 and all SDW-823 card=
s.
> > See patch 1 and README for more details about its origin. To have the c=
ard
> > working, you need another patch which is already in mmc/next:
> >=20
> > https://patchwork.kernel.org/patch/9043341/
> >=20
> > A working topic branch for the Renesas H3 can be found here:
> >=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/top=
ic/gen3-sdio
> >=20
> > This series only can be found here:
> >=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git staging/ks7=
010
> >=20
> > Note: I needed this driver to verify SDIO capabilities for the new Rene=
sas H3
> > SoC. The fact that the original KS7010 driver also comes from Renesas i=
s a
> > coincidence. It does not mean official support for this driver. Parts o=
f this
> > work were backed by the above mentioned SDIO verification task while ot=
her
> > parts were my personal interest. Future patches and reviews will also d=
one by
> > me as a private person (unless something very surprising happens ;))
> >=20
> > Please comment, review, apply...
>=20
> Can you change the README file to be named TODO to match all of the
> other staging driver files?  That way people can look at them by just
> doing a staging/*/TODO match.

Will do. Do you want a) an incremental patch, b) and updated branch to
pull from, or c) the whole series resend?


--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXMsvWAAoJEBQN5MwUoCm2YjoP/0Yr+e5sz7APIzguW/0DInzl
8VXQ60bNrvmrAIRVF8uiTm3juPFBht4ARfMF+CsiFTFW3GVBVZVhTjYjAvjRz6x3
6LTzrmNUOR3SFJ5IP56ZE8y3whOb4UJJHdEPHHnit4rjDUdRP18Hk/za7p8xwRZH
Emi5ILMOZX8zNjDaNBqI8m8QMtYm5n7uMdlZY+Pp5w7p3u9Moy8TG2RP8G70hJWI
btfko6gzpukAgL5EmE1zmnHLDxfEjFpb4GBvSjbVtA4WUDOgPBs+xEWMdlIcWfRs
F+Kqikg4Ps6QrqiYnAULIjSq9evm6B3K0rM2R169jQ+2Y455HCAfsJtTo8DFNhDo
d9bNJHEUEUqj3TenuAB8P0aFNRRi0tqLFz2Pv6HsH/gmwJflIOUWA4L4ePZ5UVtv
r9HmEoqczVN7KagBvbbWi8njkVwG0SyUrvTStqJZpFHD6AznUkwx2VbEb4P7GyBS
K4nCpVtTOQl9TW5Ad338D/vF/RvOZ5zRH9JrFQMJyuutRDViLVbUKJt+7StXZZNl
/ZWZYXx2jcD4fwXzYIWtuSjhxh+KbKakJBpSCTIlQkGxf9oyyII3oXbauTNzDab0
XYqo7s79ZHgD7VGNqZQVF/iAV03TFTf0v3UeGwxsClFuVsE36d+GO5u8tV/mYsYt
YuqpUWBizogOTqVcKPkl
=YE2l
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--

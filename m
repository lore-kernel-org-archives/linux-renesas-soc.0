Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:52322 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751272AbeEDO5A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 May 2018 10:57:00 -0400
Date: Fri, 4 May 2018 16:56:58 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT 0/3] mmc: renesas_sdhi: add support for r8a77965
Message-ID: <20180504145658.qaf4y4spekx2g3ro@ninjato>
References: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
 <20180501152643.itilgwfoqe7dnwdg@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kew6aekwvo5eojx5"
Content-Disposition: inline
In-Reply-To: <20180501152643.itilgwfoqe7dnwdg@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--kew6aekwvo5eojx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 01, 2018 at 05:27:07PM +0200, Simon Horman wrote:
> On Mon, Apr 30, 2018 at 04:48:13AM +0900, Yoshihiro Kaneko wrote:
> > This series adds SDHI device support for r8a77965.
> >=20
> > This series is based on the next branch of Ulf Hansson's mmc tree.
> >=20
> > Masaharu Hayakawa (1):
> >   mmc: renesas_sdhi: Add r8a77965 support
> >=20
> > Takeshi Kihara (2):
> >   pinctrl: sh-pfc: r8a77965: Add SDHI pins, groups and functions
>=20
> Thanks,
>=20
> I did some testing of these patches applied on top of a merge of:
> * renesas-devel-20180430-v4.17-rc3
> * mmc/next (5bec8e5878e2)
>=20
> And things seem to work :)
>=20
> Tested-by: Simon Horman <horms+renesas@verge.net.au>

Same here. Checked with the internal eMMC (the MMC core needs to do some
retries for tuning with HS200 on cold-boot, but then it works. Always
immediately works after warm-boot), and both SDHI slots. Checksumming
files with SDR50 works fine.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> # time dd if=3D/dev/mmcblk0 of=3D/dev/null bs=3D1M count=3D2048

It may be a little bit more typing but I think it is worth the effort to
catch more bugs: dd'ing a file from /dev/urandom to /tmp, checksum it
and write it to the SD cards, re-read and compare the md5sums?

Thanks all!


--kew6aekwvo5eojx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrsdLoACgkQFA3kzBSg
KbYnVg//XDIbe2KiuPUDRGrx3i4Ui9VuCI2+/24DBkAMk2CS0FqZEl4cYVYAg2HS
t6d/14etYdExIi+9qZ6wVibdHWnqZYSzmGJmqZT/CQewgvsklDbF1g4R5mLer3VP
DADoejHlEQLC+rUP+cwXNMMbl5EuvlKlLNh968NKHrP0wGu7wK7u2IbczrAl3pFR
t0+722qVUpB4a1db21p9WMtIq7ZD/H3ttzIZWtOa7BKakACN2sEjZifxHjh4zaGL
l3Nt69earKxkNpi4btv985mRKv0AjlJaXHH3HoF9vp7RmXwNY4eYaGHIbMw5zE3m
LZsuDM81aOqjRTkcoeivWbN3KFPtXd8Z9mIMr24O1pu4qaXiyX6Oplu7gOUm6DXS
YhmSNuzijtLej82oH0UbW/Bpspz4SK02zVwDW0CG8ioJ1GpN+6LdB1WDvZeDmRCX
KLFaPitMS667cMluo+9mU0DQYrfrs8WU4gSwxFWaYX40Qf+xv9FmS9PhoIV1UiG8
JMQuQloiCtqOq85x/MXcfpku/pIpbKIE0CVSaaDVlvMe6MV3+AfMIcIvKDjtJXIV
mTYObbZXMQRrpk9bYUMyD4S+J6MbtJ5wPi74djaZnBy67HSq7Qg7XF6VWHULr94d
E2YT9LNKKmevX3rSkFmYx1s6szr1msN05JxQgToy56L7ocgaf18=
=tW4x
-----END PGP SIGNATURE-----

--kew6aekwvo5eojx5--

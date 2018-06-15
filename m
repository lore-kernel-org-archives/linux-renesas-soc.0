Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55928 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755792AbeFOH7f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jun 2018 03:59:35 -0400
Date: Fri, 15 Jun 2018 16:59:28 +0900
From: Wolfram Sang <wsa@the-dreams.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a7796 add missing SPDX
 identifier
Message-ID: <20180615075928.njaifz3bffpotbh7@ninjato>
References: <20180614015607.7066-1-wsa+renesas@sang-engineering.com>
 <20180614015607.7066-3-wsa+renesas@sang-engineering.com>
 <20180614072932.oneux4ep25okr63w@verge.net.au>
 <20180614080919.3llg73cu4ydfjk3d@ninjato>
 <87h8m4suz3.wl%kuninori.morimoto.gx@renesas.com>
 <20180615013421.clsr2ftqjoo7txww@ninjato>
 <87tvq4biyi.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="flhn2cz5ihfuyivb"
Content-Disposition: inline
In-Reply-To: <87tvq4biyi.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--flhn2cz5ihfuyivb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Maybe my misunderstanding (?), but Linus request of C++ comment is
> not only SPDX line, but whole/all comment area on source header.

Ah, that's what you mean. But he also said:

"I think we should just start moving to // in general, but only when
adding new ones (ie I don't want to see any automatic conversion
patches)."

And here, there are no new files.

Did I understand correctly this time?


--flhn2cz5ihfuyivb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsjcdwACgkQFA3kzBSg
KbZ4bQ//QFcovLcixW3R1bKX8pltQJUAhJ3fRERrMawS7DYt6xftcAXvYqrS/fBg
u4FD1z8OtsVMHlInAbpdt3/tz0t+W0UQ6EhMFRX8m33zEsIelM2RJ/WvOlDoTEY8
KAkEkyUXpgLrGRPqla1Op0HJn+IF7x9eNJht78X7fG9atcpY2TXKqVvGzQ5XCLqu
yRUQjHkMWWBKe+yjkqA/gGX2Hr8kWRrvga3TepL0xlQB6Th5rJk86r3mi6Tp1s9r
iGd79ZEMYhjzeYQwEf1e77QwRdpNqHID90LTxFV+TN3gKPG2tPNcGA8dIDhRBIBs
ZF07Ky0PW8q4zvMxLTnUeAwI6yTer9rvHuTDd8aRGZXZgomb2r2x1yif/oZa3Cw/
mQ3j2vVmqwlzOGlw8SECfEGW+ZaFq99Wtmncc1M+EBry5ysikIuyWFk5UGg87t9d
V+9DsqRnhGgBszFtsrK1DMkrwhSvIKuFVXNkboBzGkEfFJVHQeq145aKUSnByB8H
veKtNrweCLSfPxWLcO+1zQKeAYwJx4RCFsu6QZWjcrnZTmt4yksYHyIrrhFzM9Qu
cFlhhPtIHjhWINGnSQWuVpjbcytc7XKSUlmTMX2011SLWvUwYIJTCbbSgeyWdYbH
7NN/mktk/3erA4q71WW2u0+k2H8fZrEcdiM/AJAkIHJ44uOnKB0=
=YOJs
-----END PGP SIGNATURE-----

--flhn2cz5ihfuyivb--

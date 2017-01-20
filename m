Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:42984 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752447AbdATVcn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 16:32:43 -0500
Date: Fri, 20 Jan 2017 22:32:38 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] mmc: sh_mobile_sdhi: add support for 2 clocks
Message-ID: <20170120213238.GA1438@katana>
References: <20170118172502.13876-1-chris.brandt@renesas.com>
 <20170118172502.13876-2-chris.brandt@renesas.com>
 <CAPDyKFqO3YrDdKqOqJ=xKSH7uAiZ+rCPEDKMZ+c8Y5RKaVK4kg@mail.gmail.com>
 <SG2PR06MB1165089B50C28BFD333299CB8A710@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165089B50C28BFD333299CB8A710@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Is this clock solely about card detection? So in cases when you have a
> > GPIO card detect, the clock isn't needed?
> >=20
> > Just trying to understand things a bit better...
>=20
> According to the hardware manual, enabling the "core" clock but not the
> "cd" clock is not a valid setting. So in our case, it's always all or
> nothing.

It was my suggestion to either handle both clocks as "virtually" one
clock so it simulates how other SDHI instances behave, or to implement
proper and intended handling of the cd clock to save some power. Chris
chose the first option and I have full understanding for that decision.


--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYgoH2AAoJEBQN5MwUoCm2fZ4P/1AST68reNnsv7ZoL7twznRP
MRiNeJwI1aiE81vdBIu8/Du2ZNUK4sQjIo9cBz9jCy87I3kOQoFkOJfOhObdSD4Z
cNoxFmkPgMg2iXeAz3dvmLmq/GxtqMGIAimLHGni55VJ1ldVz6ghREXgOmgg7EuB
fpByuzsfO7WmvNxpsPuppMvj62AyYrEzRzVECPncBqs5O5E8qEvhk3Wkq58T32K3
HuMnFKNAbsb4g067TxPd2wPtLuUkXBAtHyOmrCD8x4zxT2qweVla8dk9T0hAx1Gs
7at1qfLtRX2mvZtU9Vwf5t/o8rg2FOqUAXcTrVfsJs+EmLD/l5S0UrQGH9qd2EOT
w+ueJSBxh6JTfRYX/fto1CymYohCifV4q/2Gk3wCpp0CqxVpiaXE4WoB8bTpx9S+
3pNdXZECy/17XiPelIG/sjQsXDP1cHKFCBoYWO+uORt1bimKYRyyPgQMiddBi0mC
INH5EO74L/CU0kTXuB+RWVeqpLgwBqkHXP36jSyuVl7tvibCWCgGIh8rVXryntju
7juoqqlPi1fyUBoBvrHJ5lAgOn7k2mf+a7Mq7VDid1j1SyrGLOHZnsePserFP0Se
AJK7xm121A/vrxhjKhuXxHrd+Bbdzqi+Tb843iYH6CRcTbpNxYty7sseswinryYW
UZlEBTyLqX4MNPAzOKKk
=j5UC
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--

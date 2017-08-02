Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:56716 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751879AbdHBTEa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2017 15:04:30 -0400
Date: Wed, 2 Aug 2017 21:04:27 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc-owner@vger.kernel.org" <linux-mmc-owner@vger.kernel.org>
Subject: Re: [PATCH 4/4] mmc: sdhi: use maximum width for the sdbuf register
Message-ID: <20170802190427.GA1474@katana>
References: <20170630105649.16137-1-wsa+renesas@sang-engineering.com>
 <20170630105649.16137-5-wsa+renesas@sang-engineering.com>
 <TY1PR06MB07023DF77FC5A4453B09D82AB7B00@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <KL1PR06MB1702B525F5A03DD74B960928B8B00@KL1PR06MB1702.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <KL1PR06MB1702B525F5A03DD74B960928B8B00@KL1PR06MB1702.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I am having issues with this patch(commitid:-785b215250310c690142abb1bdbb0767b8487c49)
> on iWave RZ/G1M board which is identical to R-Car M2.

Uh, that's bad. Let's see, can you print out the bus_shift variable?

Like this

	pr_info("bus_width: %u\n", host->bus_shift);

before this line?

> > +renesas_sdhi_sdbuf_width(host, enable ? (16 << host->bus_shift) : 16);

Thanks,

   Wolfram


--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmCIjYACgkQFA3kzBSg
KbZ1XA//dfKgX/7GuW/b+mh5Im1PbAbEtQGGTbCBSAinSUXP/40tHfTRrKISefV7
ykOo6XnezFdMK95dgGJSvCVe+juWWJbnm9Ud4KBIfkiJgr+FFwcJgxEQSDrELnZS
2F+QBxNnDzFaOoF+XhFaKragBXG8Ni1NxHrjL4IM/bVRdpt4C4kJSrLrRkbf3xJ2
/z/ytuFMxhEeGMzfDD/5jTAPKH0+5NHoMtuI5C2J3XodWqOXAwW9Ft7mbHFCwkp5
z6y8m4OHe0ePwXokqKUI7qjvdeL1qj3PpaIuo+vVh1VWYRxEI7olby/3S1TXJSog
98UJAMMDTgADXddppey7BmXyAUaFgwBT7F4iK+jefg8RJYKoulpQy5R/3tTjzwgJ
+r/+fRLpAZNsuz42eL4Ptd/CjlqQx52euIMpDKsc/lzMC5Iezsl7lkBGaeYVmCJO
TLZIaJQ+KduRAI0vGB39R0vb150e1lYLpzRj6kVVBzkcGSna50XKY4c4EujRB4Jo
z0+oLgrC5Pyj+F/pGhTr4GARNud0yO4K9/N+9E3ATTqjVnHvXEzT6WMPuMytClTW
AIAsDApnIED/RIt1FCD36k2bUgOEFw/HqJu5i7hriWkPM0kgowXBxiiycW4rZbRg
F0cwAaJotID2/6aNQTfcdr+/KHhstgxP0ODGYapJRzNrxMsf7eA=
=sP64
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--

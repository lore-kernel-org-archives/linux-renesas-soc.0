Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:46638 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751084AbdHCI5Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2017 04:57:25 -0400
Date: Thu, 3 Aug 2017 10:57:22 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc-owner@vger.kernel.org" <linux-mmc-owner@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH 4/4] mmc: sdhi: use maximum width for the sdbuf register
Message-ID: <20170803085722.GA2574@katana>
References: <20170630105649.16137-1-wsa+renesas@sang-engineering.com>
 <20170630105649.16137-5-wsa+renesas@sang-engineering.com>
 <TY1PR06MB07023DF77FC5A4453B09D82AB7B00@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <KL1PR06MB1702B525F5A03DD74B960928B8B00@KL1PR06MB1702.apcprd06.prod.outlook.com>
 <20170802190427.GA1474@katana>
 <KL1PR06MB1702544BC4FD755C76314608B8B10@KL1PR06MB1702.apcprd06.prod.outlook.com>
 <20170803074304.GB1500@katana>
 <KL1PR06MB17029D34B970C8C59602ED42B8B10@KL1PR06MB1702.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <KL1PR06MB17029D34B970C8C59602ED42B8B10@KL1PR06MB1702.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Which tree is this based on? I can't find SDHI nodes for r8a7743 in its=
 dtsi file in
> > linux-next? I'd think the node is not correct.
>=20
>=20
> It is not upstreamed yet. I am going to upstream this patches with in a w=
eek or two.
> Currently this patch is under internal review.

Ok, I see the problem now. It is likely that we in deed need to revert
the patch because I missed that Gen2 has two versions of the SDHI
controller and the second version has an exception with the SDBUF
register.

Thanks for the report! (one suggestion for next time: please describe which
branch you tested)

Regards,

   Wolfram


--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmC5W4ACgkQFA3kzBSg
KbbUuA/+MoWwptwuuDaezzCbX8yZV2EK5iMGmQAAxF4wLcYGTOuUoLHpFJ04MJ7R
5UqaZiMfspqKdt56AtOagw7Q6GWPSHnnA0OhTTTU1ZsAjYHpcM3PsMs2WtjDcb29
jty5+ed49tZ87JFy+48+70t61MGg7QYKyDxHc6XGdQmyOZOzj7PMyFww80wiVYC1
1FKJGzjvzSktc2v6MowrOWrfM57eGDjeKRmbsKnWZcpPrMe7K41ZUZFpVVFRNjcW
jVZ3L570OcxqXU7Mrc9J1DzgA8c/vPMhZuBtz6qa9A8PmdUNbxAxUOAQYz6XU6Y0
0O6uJnNkulX29cFEYaiUAzGmMDGsNFGIcpdhfxUFqj3gOUt0Uq6vZzKIVkldcB7p
ShmWdW/maqu3M8I5v/i0w6D6TjK0kEhK7Ve4GfuM1dJm4RM8tXb/xHNP+F6ThLvA
//j8PQKFXJ8gW6WSudXA5h9wdx83XgGhY4IqPBf3rABLL1A0ImGASLCXevzGXleJ
HSmmgD9U9piG2symzSuoiymh9TLO7xQ7Fj+Fwt/NLWdFTYtD2vmXyCWqQ5rkkVWy
vz1/fTNi57HlixZ7F2OhmzwODcFpyQDcnuIQpUmx1dwlRqHJ7ZpX3ooKp6XBRTLf
xm4EPdKYf33FIXEqRr0I+vJo5k/vXpZEnrKSni+M5edf0a8Fx7I=
=BDPu
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--

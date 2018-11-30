Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57694 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbeK3Wvx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 17:51:53 -0500
Date: Fri, 30 Nov 2018 12:42:51 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD
 clock
Message-ID: <20181130114251.meupb5kp7flnooqj@ninjato>
References: <20181129003949.19984-1-niklas.soderlund+renesas@ragnatech.se>
 <20181129003949.19984-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m45gszpv36737gpu"
Content-Disposition: inline
In-Reply-To: <20181129003949.19984-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--m45gszpv36737gpu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2018 at 01:39:49AM +0100, Niklas S=C3=B6derlund wrote:
> On H3 (ES1.x, ES2.0) and M3-W (ES1.0, ES1.1) the clock setting for HS400
> needs a quirk to function properly. The reason for the quirk is that
> there are two settings which produces same divider value for the SDn
> clock. On the effected boards the one currently selected results in
> HS400 not working.
>=20
> This change uses the same method as the Gen2 CPG driver and simply
> ignores the first clock setting as this is the offending one when
> selecting the settings. Which of the two possible settings is used have
> no effect for SDR104.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Tested on H3 ES1.0 and ES2.0, M3W ES1.0, and M3N with eMMC and UHS-SD
cards. Proper clock speeds were selected and performance matches.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--m45gszpv36737gpu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwBIjsACgkQFA3kzBSg
Kbahng/+P0hFdn/ExJTm6zex4+uFjKqZazdHateyTGBte0ZjtTzrVd5LavGhSde9
QpNtcMcxQbWc/n8rhTwR2jIFVTTou/C8KCCQWWJ6U8pPYh/UmXM5ugxrWFUKlx9e
f/nRhUejBypUKrBksbPYB8q1/sW4KEG+bI0TSz8ZPEU7fuFtw3QKbkKLvwgWpdu3
rq//MdEhDrb2DnM2fbRJNs1tSbhxCh/+eMQ308N0qbDEthvGx2tIFgeSq+b9NWmr
1FdwL7HxjH64DlWDYdQ84q8VSF8k+r2jSD359/HCniyeFHrySlKS9ciRTA9AhPad
EtAyWNDgfBcAS4mqYW5dLMwgQpodXlYqsD0LJbSRQIfdg7jCI5o+4K6yRcyL1bTi
K+irzdGZWkkSFbL8Bmy2xceY+xnGquNP2zXVAM+w5MBasFWGK1lCgO822FKNivH0
wPuzf9FzysqrtH9hpbHdIb+DiE+VwMq2YpcMJeIUx1eqZfStf5bqxd2d4KHvJcq+
RnMoi7OWAOdt260/JszeTN0ucRuqj+ouXVen+2aCrrwyZpWj0pL/nedPE8TNY++v
6X/M22u7ONkDSeiwmG+6PbcMaXNnpqAg/RpLBBAf8N/Pylgqv1WRe1WV4vQr8g2E
fpU5RWt+XRD/IqU1uDT2xZkZY6kFkIkvV5YQFqsxd8DL/2dqiPc=
=CxP9
-----END PGP SIGNATURE-----

--m45gszpv36737gpu--

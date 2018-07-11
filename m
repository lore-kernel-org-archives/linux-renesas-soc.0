Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:51870 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388160AbeGKQsA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 12:48:00 -0400
Date: Wed, 11 Jul 2018 18:42:48 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/3] i2c: recovery: require either get_sda or set_sda
Message-ID: <20180711164248.h4r57esqe5nld4lj@ninjato>
References: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
 <20180710214217.1336-3-wsa+renesas@sang-engineering.com>
 <66c45ef4-cf51-930f-d4bf-99798c3653a0@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gspzsx2ztlsn4r3u"
Content-Disposition: inline
In-Reply-To: <66c45ef4-cf51-930f-d4bf-99798c3653a0@axentia.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--gspzsx2ztlsn4r3u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2018 at 07:51:02AM +0200, Peter Rosin wrote:
> On 2018-07-10 23:42, Wolfram Sang wrote:
> > For bus recovery, we either need to bail out early if we can read SDA or
> > we need to send STOP after every pulse. Otherwise recovery might be
> > misinterpreted as an unwanted write. So, require one of those SDA
> > handling functions to avoid this problem.
>=20
> Assuming that all users fulfill the stricter requirement...

Yes, I checked all in-tree users for that.


--gspzsx2ztlsn4r3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltGM4gACgkQFA3kzBSg
KbZFxw//WAxh2kz8EG1nAU2TfdnA/mLz1QX790KIGyQuxiykyC6toiOKbctRLBwb
8/SFeLjQQ5BBCG5VvzCzJ2mWhPggmj9uRYuBDc7WiG5n/0JzMI09IxBXyb+6+c5A
KEDYcYK1xmt0p40zcMAirGNVY7Cwgl3por8AaaqdRoYCSfjwWNdzBlIawJ0c4bWy
aQxxpenbuWZ/pgpjfZCExNhf2D5N1vpSv97Ohj0lu0FJgic53LR9OZARXH0+6jhd
3xhlxzPyTw64vXOznN6gYEql0RXxEf0gNUGh+W5abCP40jsAHfvxmjafUZO8CylX
4wjKQ49l1hHpI+IyIHlg+gctDdi7gxvomz6ZZpKC/p064eAfteakXCAyaX2pds3U
StR/50FnUgn/RXabwaIlQIHEvS69rmzuPHfJyO7MsN6Rlix6ouMcentNyIinlFEG
VDrFPyKnOVYabUtYyUUu26dbfYlcfTs+NTca6ZwkPRze8fpi8dKVdV4OqSASr0aB
vdU8oMWpR+Lw8MQLSq5C7uelJK0mxaq79X2W7alNifd97Po7uOWTKT60OA/35fNU
hN5ECJXjMmG5N62Y4CVO9TDHymJ+l/HCJGSzrmKS0BBZW5mqbBWNcLr7zBxuifyH
DwJYKhwrBKzGkNZI3LYuPPbPe/oVxxq1WFOAqtP4jlJcoFVBfRQ=
=WL9l
-----END PGP SIGNATURE-----

--gspzsx2ztlsn4r3u--

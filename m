Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56684 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbeGXOG4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 10:06:56 -0400
Date: Tue, 24 Jul 2018 15:00:31 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/1] i2c: rcar: handle RXDMA HW behaviour on Gen3
Message-ID: <20180724130031.3huqnlhe34f5w3zm@ninjato>
References: <20180628204538.866-1-wsa+renesas@sang-engineering.com>
 <20180628204538.866-2-wsa+renesas@sang-engineering.com>
 <20180723175522.fo3bxauuwjg73vpf@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2rimdljxzgu6g3j3"
Content-Disposition: inline
In-Reply-To: <20180723175522.fo3bxauuwjg73vpf@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--2rimdljxzgu6g3j3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2018 at 07:55:22PM +0200, Wolfram Sang wrote:
> On Thu, Jun 28, 2018 at 10:45:38PM +0200, Wolfram Sang wrote:
> > On Gen3, we can only do RXDMA once per transfer reliably. For that, we
> > must reset the device, then we can have RXDMA once. This patch
> > implements this. When there is no reset controller or the reset fails,
> > RXDMA will be blocked completely. Otherwise, it will be disabled after
> > the first RXDMA transfer. Based on a commit from the BSP by Hiromitsu
> > Yamasaki, yet completely refactored to handle multiple read messages
> > within one transfer.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Applied to for-next, thanks!

Reverted it from for-next, added to for-current and added stable.


--2rimdljxzgu6g3j3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltXIu8ACgkQFA3kzBSg
KbaRAw//VyF6oIUdiAoqBo3EYb8Ke8iy3HkedosE2dV6yqLJQXmHdI6MR9Q3dXUS
CIibSNhFYj6KvgepMP07Lexfxz92JhAPUlDtU+71sE2sKPYcf/qPyi5V6sjd+qpx
7IOVHM/uVonUCY41bKEYMUZgJiaXKmqcokCMDIHqLxo6nhZ+tCwtRMqnpnP27L2E
iQWrI8zctRRJiMf736FyFde9wAWt0S3mTodz4pymER2ZmrSArvuJlvXfDD4vO8ob
Z2rjtCKNt072IpHhxiLZuq+6QT7P5euXlZ1XtEUBktvCcWAMMYIVia718svMCc1a
RJ8Rfwz21eXxkz7elgPs7wPv/azzvG/HkIqkY9FmC6K8fjgYj57oVkpdqRC2PCJA
065/oK3aBHCYO+jXOJqXHBT4vFgUVnBmd1B+w9Ba0kmAz7JKEfLmZLAL8mamPPSa
MNauvc3gEbSFA9weYY2Gg+NtPFZK+WSYWi7PKfJe+KuCsuvoj9sgNnIPN0CCCQcr
dLxTlQT46szeW/xJLTG4eDZIs04Gl1B+z5Tgj0hqHLOLy+UGc5RHt+E87l/8N6Ee
ExZWBndbVnTif7usFbr3KbEGFkzw4XVoWyAMcwwHPfsg/Z1FyjzK1hMAqR7yw5u2
tBH8zrj8UYww56SQ8pE39SHE/EWgaJ2uxX9SfKkTuU7jgZD7K/Y=
=EQe2
-----END PGP SIGNATURE-----

--2rimdljxzgu6g3j3--

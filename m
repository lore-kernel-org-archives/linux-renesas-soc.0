Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44568 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbeKIUvR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Nov 2018 15:51:17 -0500
Date: Fri, 9 Nov 2018 12:11:07 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulrich Hecht <uli+renesas@fpond.eu>
Cc: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH] serial: sh-sci: do not warn if DMA transfers are not
 supported
Message-ID: <20181109111107.GD1031@kunai>
References: <1539352069-1028-1-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Content-Disposition: inline
In-Reply-To: <1539352069-1028-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 12, 2018 at 03:47:49PM +0200, Ulrich Hecht wrote:
> Not all (H)SCIF devices support DMA, and failure to set it up is not
> normally a cause for concern. This patch demotes the associated warning to
> debug output.
>=20
> Inspired by BSP patch "sci: sh-sci: Fix transfer sequence of unsupport DMA
> transfer" (6beb1f98d3bd30) by Hiromitsu Yamasaki.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvla0oACgkQFA3kzBSg
KbYbxRAAjZ3oCPK1lAAx4SEhQhbeRwn295NZS34epVq6nrRDpbFxvQzhG+Rev1Py
LQ3DANc5yLm7YGzXT8yqAP6Zl6gsDwcQTPmI533JYjDY9JjuLX8Sdy7aA16sTHUB
tkTQo8McYbr9MUOdkdUO0bzkso3mf8dpHcjW2ceI0mKNUrrprcPL5DAzKcpqnCZO
CjeFkWS7X5/NjrHK3zh+yX2ILBb8bmL2YFSKuUCIIrSU7VMQU5o8gscWs/VB9NNS
zFB8luy0GM2kxM9PEiuwwcjh05iQB85qV1gSTVmlGiunGgFcFDURdeRTVXwi19mu
HRJTPVrguh/whgfFnlcTpOLoSY3V6PC9IpBwi0IPBdlKlOJ8wHP1slkIFZ6kWNiY
mIA+ntdOQNpklB32YBztOMnQFhgH0QWzpRKGCgzsSAWs9JMSpVUInrsIEJR9w9pn
R6t/9NxYhn1YMtkHBXXUQ9t7oMB6wameStsd1BZqoCSIE3Fz4csr/8OIS3Xqaf7l
SBqSJs88jmJO8zgJTIYfFI/I8IiER42M3/er1YBPo0DKSClj1Pag+exm8quJYA0G
dzJycpiTDnKdxHE3lMDYZUQRWjGSW5tT8Y1ki+pE0h9Wh45M9xsKQ6izpsRjLOWb
WXvR7GdKE1IIiuSqegh5FM0pvnHcRHUxKEbvGc0uhUOFXC2fsC0=
=bQ2X
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--

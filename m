Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53430 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727687AbeHVXE6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 19:04:58 -0400
Date: Wed, 22 Aug 2018 21:38:44 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: fix #define
 RST_RESERVED_BITS
Message-ID: <20180822193844.tefn3ky2vlskfcwd@katana>
References: <d5574b7b-9bb6-1f24-f2b4-2036c66a2924@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6vgvdv4yirirncem"
Content-Disposition: inline
In-Reply-To: <d5574b7b-9bb6-1f24-f2b4-2036c66a2924@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--6vgvdv4yirirncem
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 22, 2018 at 09:28:01PM +0300, Sergei Shtylyov wrote:
> The DM_CM_RST register actually has bits 0-31 defaulting to 1s and bits
> 32-63 defaulting to 0s -- fix off-by-one in #define RST_RESERVED_BITS.
>=20
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Suggesting stable.


--6vgvdv4yirirncem
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt9u8QACgkQFA3kzBSg
KbZUig//cpU5I9v9xwIiYbxH90sGwrqYuQC22Hd/W+jl2PvYc3KeG7eGWgmAnqdI
uoQzGdLE8iCNrxuCIf+kW9WITF8zewd76vFFXOs7pgHSLozu99mwvAOK/q1pCg+e
o1+AhWfJUNPVvWZ0YUE8+Cm0VCi8BA6jXzyBDG4hiaO1KxnLaVWwUpcAXKV01Xpo
GkODxlDhv1Ho3IazB5iGGUz0bzi+nKfKfc+S1xytgQQuaDboMjOloiTKeAMLBjgr
RXo6gSZYjDuhw1f4WGl9VBQUOcLZ8UW6s8yzLvpqSQ0bweEAS6JTCX9xjU0iHiAE
MOf2jT6tWBq7ZYqvw9e6l2BdSWBeqkah2HaN/sms9CuixATXhKBUudRdxcK7vuBQ
3eHtxD4Sbwy/d3ez2MHjr2OXW7x2DAcL3H6STv5pSTZOuwgbTYANpJxuo9RzlAl0
zlSh5mBIElKDHHJGSlcBgIdsV2D+fLTmYpYXtxajhGKXctjLr8aKlyGelMr6ZjiL
cFVemIMKvaRXo+NoDBrYy32byBnKw7lRve5MiiOYOJvGzmRFB71bvg7rwH/v/YLE
5IJDeJ206I1DNCsw9rsruzvnUOMZGMlVX4ODbRgUlmO4p+2pmpA/sw44YFRWH3gq
VTC8lSIwRUCIWA31ab4K/coBU7AhULqtHDkZhlMI5Q5wQn/tPS0=
=KF5e
-----END PGP SIGNATURE-----

--6vgvdv4yirirncem--

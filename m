Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55450 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751927AbeDQKJJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 06:09:09 -0400
Date: Tue, 17 Apr 2018 12:09:07 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Subject: Re: [PATCH/RFC net-next 4/5] ravb: remove undocumented processing
Message-ID: <20180417100907.747jw3nyggtvpf7b@ninjato>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
 <20180417085030.32650-5-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="32nke227uwegmixe"
Content-Disposition: inline
In-Reply-To: <20180417085030.32650-5-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--32nke227uwegmixe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2018 at 10:50:29AM +0200, Simon Horman wrote:
> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>=20
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/net/ethernet/renesas/ravb.h      |  5 -----
>  drivers/net/ethernet/renesas/ravb_main.c | 15 ---------------
>  2 files changed, 20 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/r=
enesas/ravb.h
> index 57eea4a77826..fcd04dbc7dde 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -197,15 +197,11 @@ enum ravb_reg {
>  	MAHR	=3D 0x05c0,
>  	MALR	=3D 0x05c8,
>  	TROCR	=3D 0x0700,	/* Undocumented? */

Why not this, too? Maybe some background info from HW team for the
commit message would be nice to have...


--32nke227uwegmixe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrVx8MACgkQFA3kzBSg
KbY57g//cMmYEY9sW7eYZlRQF5TgL6uSW/l1sLyamnhMuYatwCnbDlbUJ5kRYTx7
qRbzJ6OgIFeEBS0HyvE4fiXKGHQi5S4cHK3Ct3JojqYOLK7xDybXpaxUtRC5GkCN
GYOk5TofoUVb50YMfGQRuQLhwrv55T8JrkBj9TmNQrk8s7uq9P6GORpV8FYkH2Ay
q271FuGx5gg6Tm+N0jRtMo/xV4cdxZJ0yWiQ1o6NiW3z9BvFGxXBhAKRgvw+fvAK
Q4J8hGMnLDVXVtklALi+AByqt+npSNZC3mD0ubArxok3gE1iMCWOndffXWdL42xP
TShMB8Y1IYLRje+8eT8VLgZYDKEhsFEG9bc/HHHWgpne9CMkbv27auCeTemu4eHx
8MMoyPjFLxIawnjvqSgboqYT4y1huRXzxc233Wie1xgoyusYEjPPIlrUHxA+lkZK
tfdcGZ10L6etFQxrd7FLhMN/9dib59toUCFTbJTkpQwsCAn+RMXSPHxbBX3RHhIu
GPykz7uIU6vfjPk/T3Tk5KaJQ4c1Tmt9MyUY3cYYbrsG9nh67AVAflYBrfaXECIQ
9kTTMwGCR30TjVLSvtDDiXFqjWLSzqHhg5JooYrbh6Mz+PJLm8vo5ihCp21LAK8L
MjQzeO+JUy52un6d4Dgm7AojBKTRODE09NIIwzgghmVOZCGBypY=
=x9Cn
-----END PGP SIGNATURE-----

--32nke227uwegmixe--

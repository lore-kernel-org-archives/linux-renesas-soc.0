Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45280 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727665AbeHFUPY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 16:15:24 -0400
Date: Mon, 6 Aug 2018 20:05:06 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] ata: sata_rcar: Add r8a77965 support
Message-ID: <20180806180506.vs56wyjrqb35jkyl@katana>
References: <20180725191655.3467-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="flf6afqrobdbaswh"
Content-Disposition: inline
In-Reply-To: <20180725191655.3467-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--flf6afqrobdbaswh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 25, 2018 at 09:16:55PM +0200, Wolfram Sang wrote:
> Update the binding docs for Renesas R-Car M3-N. No driver changes are
> needed.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Tejun, could you pick this also for 4.19?

Thanks for picking the other patches already!

> ---
>  Documentation/devicetree/bindings/ata/sata_rcar.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/ata/sata_rcar.txt b/Docume=
ntation/devicetree/bindings/ata/sata_rcar.txt
> index e20eac7a3087..4268e17d2411 100644
> --- a/Documentation/devicetree/bindings/ata/sata_rcar.txt
> +++ b/Documentation/devicetree/bindings/ata/sata_rcar.txt
> @@ -8,6 +8,7 @@ Required properties:
>  			  - "renesas,sata-r8a7791" for R-Car M2-W
>  			  - "renesas,sata-r8a7793" for R-Car M2-N
>  			  - "renesas,sata-r8a7795" for R-Car H3
> +			  - "renesas,sata-r8a77965" for R-Car M3-N
>  			  - "renesas,rcar-gen2-sata" for a generic R-Car Gen2 compatible devi=
ce
>  			  - "renesas,rcar-gen3-sata" for a generic R-Car Gen3 compatible devi=
ce
>  			  - "renesas,rcar-sata" is deprecated
> --=20
> 2.11.0
>=20

--flf6afqrobdbaswh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltojcwACgkQFA3kzBSg
Kba/rA//a/wXOfO8bUdFqamzpXj/AcbCPRlC7by3bTWistjfJnDCw/ijJXFZ98QC
kUVpWvasxr2WXMppAm2TalB7Y3nHsb1QdEC4SbqWiK0/DZ8QZWYXJIOQrHLKybVy
keMmSaW6jc2q2NACSdNiKOYTaaeph+nCL9hySxIBTW4vi6eGRiLg2QhntfPPzw1P
7bXuP5fXUw666JfAEkiM40L386BpxDnvAG0XQvm6HoP7DnXv6ucY+MFmH564Z0eQ
/pCm2rY9hAo2Catwqia9lNuUKEn00ruOJ8Yk5MprBBJTsn2nIvNP9LKiyXpuew9Q
XsBHvzTwbOAx5RLjwPvCMAbPhE3HYA7hL995o9E399MLIO0ncxDeLtj+T5/zxUYF
UcddaN60lhL3r2LUr1x3z38t4o7XrnjlvS2e5w8YBYGxXjgPNAIp9a4yeBBRL9i/
tXZCC/YDmxA7E6DdQ1Liz9RX2HgAuPSr3dIoUnyUrSsOJ3YNYifos6SQYL+FNBjB
RNN9sWEk3r+LInJeNrqw6GPADtFz/J7sU0lYk1+XToVUrtwlpmyiyFoVZSt5u43H
YuhRVDk6jyOWOcDpWmXsNWxVlx3hIpu7CxDHYwMgc0m5nXKHj8tra2pKc6ZYO3Iq
cn+SxvbHfix3mG3I09yr1Vj20Wu73xfAa/UJyDkC9Ed6WZEGL5c=
=5eOq
-----END PGP SIGNATURE-----

--flf6afqrobdbaswh--

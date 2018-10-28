Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57754 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727653AbeJ2GUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 02:20:40 -0400
Date: Sun, 28 Oct 2018 21:34:44 +0000
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mmc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: salvator: Switch eMMC bus to 1V8
Message-ID: <20181028213444.GA1096@kunai>
References: <20181027163410.7417-1-marek.vasut+renesas@gmail.com>
 <20181027163410.7417-2-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <20181027163410.7417-2-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Sat, Oct 27, 2018 at 06:34:10PM +0200, Marek Vasut wrote:
> The eMMC card has two supplies, VCC and VCCQ. The VCC supplies the NAND
> array and the VCCQ supplies the bus. On this particular board, the VCC is
> connected to 3.3V rail, while the VCCQ is connected to 1.8V rail. Adjust
> the pinmux to match the bus, which is always operating in 1.8V mode.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks for this!

I think Olof (and thus, Simon ;)) will be happy if those two patches are
merged.

Other than that, I think we should remove sdhi2_pins_uhs then because it
is the same as sdhi2_pins. And then use later "pinctrl-1 =3D
<&sdhi2_pins>;". So, basically the same phandles for both pinctrls. We
can re-add the second one when we need it.

> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm6=
4/boot/dts/renesas/salvator-common.dtsi
> index 7d3d866a0063..d9a309b28fcf 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -602,7 +602,7 @@
>  	sdhi2_pins: sd2 {
>  		groups =3D "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
>  		function =3D "sdhi2";
> -		power-source =3D <3300>;
> +		power-source =3D <1800>;
>  	};
> =20
>  	sdhi2_pins_uhs: sd2_uhs {
> --=20
> 2.17.1
>=20

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvWK3AACgkQFA3kzBSg
Kbbojg//fUkjiBCBcZ0ydB2q3YfhFCruucxJ3CNo04u1islE3jEJ8ApeBDq4cMJ8
No5j6VLLFKr2AXveKsVvVdksgjj/iKftLvRjyZdPQgVbaBZeB2VP3fGWSXjCT+mU
6+4J8Upti4o6LHgAvr9vpDAH5bNMObGVPRSP1Yi/I5sU80kBWTXfQqjPokZ9RZqb
iGKefrBBYV9g9FLQz0irDccCNTgjMVwu46B3gkrd3GDeqcGaHh8unpeoHMimURWJ
O8SgcjkpFq3r32uzz7RvXKhIsG/WvVnxnThE2Rs63vCxzGdrLqzU2EesjHRgGT3w
wg6QDan0xQj+fzlq6sV3qkeUibthOjMWhnKjJe9P3w1A8aRf96A4BruQW34Qrlvs
LCve8fFYDeOwKI/8eDTQqkP9rbMOPOd9AwI/xeTI1AWgBXwxUmqW+l8OI60TID+J
KF1r9ccHqd21+zsj5CvzHRdO87PMqm3I0c898DBD/KbJum/qpsY1FXZ8ybrUgc1g
K4lcnfTuJ0D+T3L3a6MZLRMSEJ9mx+eCHlYt/kv4qZJKhGv/KJhhnTJR2OTRXWZS
JCUqozoIg7xwNpELgwCuZWhLzFCbz/zejtEp/Ixru5iFuqnf/pyJocOZh1ruWnGF
ARurd48/732IVQrBRCzUE5Q0M45Xswfdi0R0DSXC3puqAeIfCMo=
=SgQD
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--

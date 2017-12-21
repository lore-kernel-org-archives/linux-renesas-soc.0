Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53969 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752700AbdLUMY1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 07:24:27 -0500
Date: Thu, 21 Dec 2017 13:24:25 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-common: add GPIO
 extender
Message-ID: <20171221122425.3uz5mquj2a3373gb@ninjato>
References: <20171221122136.17773-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p2aasbsaqdxrnjad"
Content-Disposition: inline
In-Reply-To: <20171221122136.17773-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--p2aasbsaqdxrnjad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2017 at 01:21:36PM +0100, Wolfram Sang wrote:
> We need to configure its GPIOs later.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Forgot to say, this depends on 8a64e557f399090f5d1917b2f32a065da2b12be1
("gpio: pca953x: fix vendor prefix for PCA9654") which is in
gpio/for-next already. I cherry-picked this commit and SATA still works.

>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm6=
4/boot/dts/renesas/salvator-common.dtsi
> index a298df74ca6c03..ab4763f09dc7fd 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -338,6 +338,11 @@
>  &i2c4 {
>  	status =3D "okay";
> =20
> +	pca9654: gpio@20 {
> +		compatible =3D "onnn,pca9654";
> +		reg =3D <0x20>;
> +	};
> +
>  	csa_vdd: adc@7c {
>  		compatible =3D "maxim,max9611";
>  		reg =3D <0x7c>;
> --=20
> 2.11.0
>=20

--p2aasbsaqdxrnjad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlo7p/UACgkQFA3kzBSg
KbasaQ/9Enu6xMcK1KU5cnq8NQbXspLjFrX/mhPABThfdXdNU9Y/V6TtdPfTUuhq
rQHRP6IlWssVlosezu7RYSoWX8Bcj5HugJ5foTfwMOU0SKxVXEQzJuTxYxppCyyf
Vg/1Iu+I2IIHM/DTC/8qU82/e9TnGAZbaBRcAi3KjN7tH4mAHGbEv0dHRMIzq0M0
BzgTBTWCr/3i8U2ZJHgrNP5m2V27Rpt5b7G92JOep3XeG72YvkL6kBp50BxziRQY
Tj8Pm07ldGtqJhpxZQAoi3GKUNrdhb78DNtM87bvADPIFSyfpkAs10MjdnwbgLdY
bdp9xaCn7/Leh1ih503q9Fct1IiV2LIB7FitVPdIR6R48A/c3aDhcHuLRUMdHeky
KeTmZSAY1SfKFhluxfPgt8tX+httelfgeCQpCqOIBoMXVZx1LTP/dn/IjAajS19c
IsolmvxcCO9BXudKzJ1R/z1qZJlAvVHAZIBA9Z/VLPdxDbjltmTHy3lBua4oNCpE
BTeBDA1YniOgAH7t4nfaKI83TLRcnjRxm5ihn4Ow3X+nD9objc6r8pMSTq3ROIoK
xOPqX8/2zb3xJvg6JrcDbR7sN+2dCMStb/1/N4PmbozLgzDPi0WfEHYaYekwxKwr
mpv48hAnu03HYMcsN6MsfddTfR6Fm0h3G8wtiyJeZlbODHUd414=
=G1KL
-----END PGP SIGNATURE-----

--p2aasbsaqdxrnjad--

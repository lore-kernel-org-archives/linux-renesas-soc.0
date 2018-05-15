Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay11.mail.gandi.net ([217.70.178.231]:40047 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752139AbeEOIXP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 04:23:15 -0400
Date: Tue, 15 May 2018 10:23:10 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7740: Add CEU1
Message-ID: <20180515082310.GQ5956@w540>
References: <20180515080038.7438-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="a+0P3INHs7aeI7wh"
Content-Disposition: inline
In-Reply-To: <20180515080038.7438-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--a+0P3INHs7aeI7wh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Simon,

On Tue, May 15, 2018 at 10:00:38AM +0200, Simon Horman wrote:
> Describe CEU1 peripheral for Renesas R-Mobile A1 R8A7740 Soc.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thank you!
   j

> ---
> v2
> * Correct register range start address
>
>   Based on renesas-devel-20180514-v4.17-rc5
> ---
>  arch/arm/boot/dts/r8a7740.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
> index 508d93440ee8..35e2fc957458 100644
> --- a/arch/arm/boot/dts/r8a7740.dtsi
> +++ b/arch/arm/boot/dts/r8a7740.dtsi
> @@ -77,6 +77,16 @@
>  		status = "disabled";
>  	};
>
> +	ceu1: ceu@fe914000 {
> +		reg = <0xfe914000 0x3000>;
> +		compatible = "renesas,r8a7740-ceu";
> +		interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&mstp1_clks R8A7740_CLK_CEU21>;
> +		clock-names = "ceu21";
> +		power-domains = <&pd_a4r>;
> +		status = "disabled";
> +	};
> +
>  	cmt1: timer@e6138000 {
>  		compatible = "renesas,cmt-48-r8a7740", "renesas,cmt-48";
>  		reg = <0xe6138000 0x170>;
> --
> 2.11.0
>

--a+0P3INHs7aeI7wh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa+pjuAAoJEHI0Bo8WoVY8+8oQAJXGE5bx5ZMYRTs6shrffBGE
hlihrNj+XOdbsMLKs6P6Nl0cthm21v9vzOzhv+MFA1HXer5trYtYlKGvOfBCO1he
3wtD0w0uBCawiHgz8rs7oRpUnk23PSrJV33HnF/xqJWAnY88chcG0HxixIDY6mRR
OLlys6JSLr0ZhqtwLEG8lzOgHeH4aIsOQu2Vu3g9OH1FGPkhWwIvmmrja9D7hYz2
O2W8J69vgLnYHUglLxkcjDfvnkKUDzmA8nTPAPYE3Z5H11mUWDJoh2eIhhyEAr5J
noXU4Vs5YPUIGQyZ2cILJVbzcRoqAcp6v1P61bzoGBtNjkRxxgA2q89ujnP/S/yO
RvHsAPqPaFS0oqw52t2CyMekMwr+bxsaW3TrPuIazevweAI5nh2WPiC/cCdotTna
vgm02xdL6ntCJxCVwFCSvk8SkwgoedG9mQVBURR392VemFYnIEYQ8rgwFw6NvSkv
LkaJw/Bx3UYD2HM+ybj2rWA6KdmA1P6b33lDlet5bNmRzDeuWuDUOqRYuTYQkfTQ
d4WL9f6LNFTaA1oTcgKftE23u1AyXfw92xVcelHulQ9jJ+hCcUueynTiVW7hEQfG
p8WsB8EC7C2MffAFLJMO3id+1K8cK8GBg9+WzftMDqjIey631di4XEwIUydmkYh8
+Qk1LruqkwP3FksvtWE8
=Gqb3
-----END PGP SIGNATURE-----

--a+0P3INHs7aeI7wh--

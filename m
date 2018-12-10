Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:43931 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbeLJJ4K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 04:56:10 -0500
Date: Mon, 10 Dec 2018 10:56:01 +0100
From: jacopo mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: draak: Fix CVBS input
Message-ID: <20181210095601.GA5491@w540>
References: <20181210094355.15108-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <20181210094355.15108-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Mon, Dec 10, 2018 at 11:43:55AM +0200, Laurent Pinchart wrote:
> A typo in the adv7180 DT node prevents successful probing of the VIN.
> Fix it.

My bad, sorry about this. I tested the HDMI connection, and didn't
notice this stupid error on the CVBS one.

>
> Fixes: 6a0942c20f5c ("arm64: dts: renesas: draak: Describe CVBS input")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 2405eaad0296..0f2523296b8a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -195,7 +195,7 @@
>  		compatible = "adi,adv7180cp";
>  		reg = <0x20>;
>
> -		port {
> +		ports {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>
> --
> Regards,
>
> Laurent Pinchart
>

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJcDjgxAAoJEHI0Bo8WoVY8GnIP/AzHLdTRKjn0in/yrovbOJvl
rou51j63msSxQe5zMSS4CwdiFcBU8JQwA3nHs6qPTGEzHA8iINAxo3fOyNyw9W7a
L1fE5i1TDA2c+JgpI1Y52kjbjxnYVozfDxDv8exeb28/MKYjQAtmxYIF45ypNlk2
7XJ/D+34oBbB0F8N0nJYA4W5rf+Sa1DYLIBE4yWA7Owqe9UB53I/qlwp/+CLzhc1
b/FYn8P0m8weEyrk4hwdtXAkedAfXnn7ClnO5PzQxBgIpcKIX1n88WiKqXXYUZNW
EmZfQ7RxR6dDCs+AU1ehKRy108umjEM36Q2aX1resD/zAKd6Z1twrtl+/itsYjXF
xdYqnAfsE796+YzE5/nJkpThvRstmUbZqK+ZnUGXzDUHUcjjNuONATvdfeZCJXxb
HkPMv1eNaMIqgkWFJV+MBQUpj076+sP9gvozCZnQy9RpcMI2/+qeDDtpN2bDV6R5
60MEfTVoelBX24DEUeJ74jmquDL29V2I6wcdvUZo5jTvMRG94LQtQskocwH/Wpjf
lJ9vsjZwIpvSew20qomMPNpLFUw4RCNzqX7pGa9a/SOeuXgTnhvIPEDIb1jjcMJi
cM9FUTLIJX9wR82EuuoSbi/EaT/mrWg6lywQI1KDU2T10PNjv6XOEQ72zlmFAEkS
mUKpuayYud15yRuSux8N
=eHCq
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--

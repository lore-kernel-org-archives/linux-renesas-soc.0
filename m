Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:55201 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387653AbeHAMUc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Aug 2018 08:20:32 -0400
Date: Wed, 1 Aug 2018 12:35:17 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a77995: Add LVDS support
Message-ID: <20180801103507.GA29238@w540>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526386840-15368-4-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline
In-Reply-To: <1526386840-15368-4-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ulrich,
   I know this series needs to be re-spin when the D3/E3 LVDS PLL
support will be added, but since I need it for testing on D3 the LVDS
interface reset support, I noticed a small issue which I thought it is
worth reporting.

On Tue, May 15, 2018 at 02:20:38PM +0200, Ulrich Hecht wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The r8a77995 D3 platform has 2 LVDS channels connected to the DU.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> [uli: moved lvds* into the soc node, added PM domains, resets]
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 56 +++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index ba98865..8e78110d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -757,12 +757,68 @@
>  				port@1 {
>  					reg = <1>;
>  					du_out_lvds0: endpoint {
> +						remote-endpoint = <&lvds0_in>;
>  					};
>  				};
>
>  				port@2 {
>  					reg = <2>;
>  					du_out_lvds1: endpoint {
> +						remote-endpoint = <&lvds1_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds0: lvds-encoder@feb90000 {
> +			compatible = "renesas,r8a77995-lvds";
> +			reg = <0 0xfeb90000 0 0x20>;
> +			clocks = <&cpg CPG_MOD 727>;
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 727>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					lvds0_in: endpoint {
> +						remote-endpoint = <&du_out_lvds0>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					lvds0_out: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds1: lvds-encoder@feb90100 {
> +			compatible = "renesas,r8a77995-lvds";
> +			reg = <0 0xfeb90100 0 0x20>;
> +			clocks = <&cpg CPG_MOD 727>;
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 727>;

The LVDS-IF1 CPG reset is SRCR7[26], this I think this should be
<&cpg 726>

Please note that the most recent chip manual release has probably an
error at page 3180, section 37-32

5. When display on in the LVDS0-IF, it is necessary to reset (SRCR7[27]) and reset clearing (SRSTCLR7[27])
LVDS0-IF module.
When display on in the LVDS1-IF, it is necessary to reset (SRCR7[26]) and reset clearing (SRSTCLR7[26])
LVDS0-IF module
    ^- This should probablt be LVDS1-IF

Thanks
   j

> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					lvds1_in: endpoint {
> +						remote-endpoint = <&du_out_lvds1>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					lvds1_out: endpoint {
>  					};
>  				};
>  			};
> --
> 2.7.4
>

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbYYzlAAoJEHI0Bo8WoVY8E7gP/RCfu6jpxs23jyU26JT5S3RM
mbyGFlBFcK6vmaXkqEFKaAIjhcM9xudJ2jnV3dist/qybEnfljJKPerGzGoFaBUU
sO9yIshMu2d6mmL/e/FNFkfdki1peaTxqxMSAE0rsSvmRuVh84a3S9m4ZrDJZmzB
znC5BD2PcB8/jxDmys7UGpCNpGHNczfqejoKQCgwwHGLWGQsxg8pLNjxLwwBnAXS
9cMYQNwu/ZMIooY/qXs5x/3atr/rX2bMQK8iQBj2tFbGxK6OiRRT5+5f7IpGsLdA
IfZ0BvP5oT3IxNklX9tDr2luoHqWO784Sheek6MEV7iSreJ6cEjoKNtsh8CXX4TG
OVyqPjfXdKjTLuYAr67509yMI33n3Vccm0SJDjBZI7QNVMouIGkxnNVc3TZ9k2r2
/W7JiYTB5huguquJlonM+KiaJErD53kWCCJVBA0HSj2dZxVev5QFLuhukaU+IK4h
K8YVpTf02exKXdorS610D9yLeGBdeALHrGVvi9VdBU3mI4/nCUq/yCDD3t4pvPji
rCRtpKRA/YUfwnkeLylv1nsTrMR/Le36GQPhOtVU8EFTjPukb3tiyvb/EqshsX/S
YMQn+qSeTDwlJGJsnewEmw/TW4vAPvOZmxCVGq2yugpdG6MAUwVxIR86WMSo2aWD
4cQygMYF6jY3qrXKPrfC
=TAEm
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--

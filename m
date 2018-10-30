Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay10.mail.gandi.net ([217.70.178.230]:56657 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727524AbeJ3TH1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Oct 2018 15:07:27 -0400
Date: Tue, 30 Oct 2018 11:14:31 +0100
From: jacopo mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        horms@verge.net.au, kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: r8a77990: Add VIN and CSI-2 device
 nodes
Message-ID: <20181030101431.GG15991@w540>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-7-git-send-email-jacopo+renesas@jmondi.org>
 <1710077.PM4SUf1Toz@avalon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oOpJzULQ70+PGW7h"
Content-Disposition: inline
In-Reply-To: <1710077.PM4SUf1Toz@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--oOpJzULQ70+PGW7h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Sep 10, 2018 at 05:12:30PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Wednesday, 5 September 2018 18:29:43 EEST Jacopo Mondi wrote:
> > From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> >
> > Add device nodes for VIN4, VIN5 and CSI40 to R-Car E3 R8A77990 device tree.
> >
> > Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 79 ++++++++++++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a77990.dtsi index ae89260..0ae7bbe 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > @@ -337,6 +337,85 @@
> >  			status = "disabled";
> >  		};
> >
> > +		csi40: csi2@feaa0000 {
>
> I believe Simon would like to keep the nodes sorted by address
>
> > +			compatible = "renesas,r8a77990-csi2", "renesas,rcar-gen3-csi2";
> > +			reg = <0 0xfeaa0000 0 0x10000>;
>
> 0x10000 seems pretty large to me.

It seems to me that all Gen3 SoC have this lenght specified

$git grep -A 10 'csi[2|4][0|1]: csi' arch/arm64/boot/dts/renesas/ | grep reg
arch/arm64/boot/dts/renesas/r8a7795.dtsi-    reg = <0 0xfea80000 0 0x10000>;
arch/arm64/boot/dts/renesas/r8a7795.dtsi-    reg = <0 0xfeaa0000 0 0x10000>;
arch/arm64/boot/dts/renesas/r8a7795.dtsi-    reg = <0 0xfeab0000 0 0x10000>;
arch/arm64/boot/dts/renesas/r8a7796.dtsi-    reg = <0 0xfea80000 0 0x10000>;
arch/arm64/boot/dts/renesas/r8a7796.dtsi-    reg = <0 0xfeaa0000 0 0x10000>;
arch/arm64/boot/dts/renesas/r8a77965.dtsi-   reg = <0 0xfea80000 0 0x10000>;
arch/arm64/boot/dts/renesas/r8a77965.dtsi-   reg = <0 0xfeaa0000 0 0x10000>;
arch/arm64/boot/dts/renesas/r8a77970.dtsi-   reg = <0 0xfeaa0000 0 0x10000>;
arch/arm64/boot/dts/renesas/r8a77980.dtsi-   reg = <0 0xfeaa0000 0 0x10000>;
arch/arm64/boot/dts/renesas/r8a77980.dtsi-   reg = <0 0xfeab0000 0 0x10000>;
arch/arm64/boot/dts/renesas/r8a77990.dtsi-   reg = <0 0xfeaa0000 0 0x10000>;

Am I missing something?

>
> Apart from that,

I will include the upporting of the following patch to fix the VIN
endpoint numbering in forthcoming v3:
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=1b1b73f7558d867d72e198901b84bec1e6ef1405

As this has already been applied to simon's tree.

Thanks
  j

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&cpg CPG_MOD 716>;
> > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > +			resets = <&cpg 716>;
> > +			status = "disabled";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@1 {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					reg = <1>;
> > +
> > +					csi40vin4: endpoint@0 {
> > +						reg = <0>;
> > +						remote-endpoint = <&vin4csi40>;
> > +					};
> > +					csi40vin5: endpoint@1 {
> > +						reg = <1>;
> > +						remote-endpoint = <&vin5csi40>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		vin4: video@e6ef4000 {
> > +			compatible = "renesas,vin-r8a77990";
> > +			reg = <0 0xe6ef4000 0 0x1000>;
> > +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&cpg CPG_MOD 807>;
> > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > +			resets = <&cpg 807>;
> > +			renesas,id = <4>;
> > +			status = "disabled";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +
> > +					vin4csi40: endpoint {
> > +						remote-endpoint= <&csi40vin4>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		vin5: video@e6ef5000 {
> > +			compatible = "renesas,vin-r8a77990";
> > +			reg = <0 0xe6ef5000 0 0x1000>;
> > +			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&cpg CPG_MOD 806>;
> > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > +			resets = <&cpg 806>;
> > +			renesas,id = <5>;
> > +			status = "disabled";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +
> > +					vin5csi40: endpoint {
> > +						remote-endpoint= <&csi40vin5>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> >  		scif2: serial@e6e88000 {
> >  			compatible = "renesas,scif-r8a77990",
> >  				     "renesas,rcar-gen3-scif", "renesas,scif";
>
>
> --
> Regards,
>
> Laurent Pinchart
>
>
>

--oOpJzULQ70+PGW7h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJb2C8GAAoJEHI0Bo8WoVY84zwP/3N7v2BZioVWEFx+Cd1CTPU6
Gwv99wofT1XGAqZ1lvufDzg4Fj+iirqXl24W4swS8tdf30zhQdXyGnbVaZAvVFzq
xBrJgEpZyuuTOCjCNOwZhbSTewGcaV95GmT1vwJxfsJ/IAcdPaDDcufTAznq4A/M
GpQqt95OOB3q0jteIMq1LKHzksYG5G6aNAw2POhr0VmbHWwbglxoxnNlg7egcpqQ
mLt6jtJy7fgzPhx4v9AFoxH2JTFIXB4mTkubv6OuDbeAAf6GVQcABeXrRU3fGzal
SXnz6QqU9R6K3KdOSXcrmm7/ZrK1+k3YJX97KnV67G1Vh8gIGeqqt8ueGm8fDEu7
ppPeRuW42puJ2ZYGLBxzafdx8j/OPk2wj1LS9fFNrlHqzH/itDqWfrV1H1yOYqir
c9U+q0L/7Dw6J/00HIGW+1mlpM5PoktVEhvXehbTg5nD5gpDa6URZvNGhYfdcbMH
8GA7qMEOWeVeoKuedvIBFUOv2djHgpkoB9VJcGFdYukVBbT10J7dXKkQj5zAqS/r
2uoVuLWhF41ENeAbEfNvMQsK5hewmMH8xXnBpnSjbIYmssGILF2xJb47F8r9tJGb
B9Ve0PUFSRWqiydxvcXyrqo0sJGEKdhTIHQ2i+0sY94h4DQDyPJ5itzxSgQKBADu
ykw3qEKQEftRijl6wMNj
=hL92
-----END PGP SIGNATURE-----

--oOpJzULQ70+PGW7h--

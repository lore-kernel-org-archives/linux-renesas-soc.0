Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:13617 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750849AbdAQOBe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 09:01:34 -0500
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 3/4] arm64: dts: r8a7795: Link ARM GIC to clock and clock
 domain
Date: Tue, 17 Jan 2017 14:00:58 +0000
Message-ID: <HK2PR06MB05451777E7151CA9C7EF8990C37C0@HK2PR06MB0545.apcprd06.prod.outlook.com>
References: <1484657360-13101-1-git-send-email-geert+renesas@glider.be>
 <1484657360-13101-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1484657360-13101-4-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

> Subject: [PATCH 3/4] arm64: dts: r8a7795: Link ARM GIC to clock and clock
> domain
>=20
> Link the ARM GIC to the INTC-AP module clock, and add it to the SYSC
> "always-on" PM Domain, so it can be power managed using that clock.
>=20
> Note that currently the GIC-400 driver doesn't support module clocks nor
> Runtime PM, so this must be handled as a critical clock.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 026a16ac41b422a1..0627df2a0b810c86 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -166,6 +166,9 @@
>  			      <0x0 0xf1060000 0 0x20000>;
>  			interrupts =3D <GIC_PPI 9
>  					(GIC_CPU_MASK_SIMPLE(4) |
> IRQ_TYPE_LEVEL_HIGH)>;
> +			clocks =3D <&cpg CPG_MOD 408>;
> +			clock-names =3D "clk";

Should the module clock be named "fck"?

Thanks,
Ramesh

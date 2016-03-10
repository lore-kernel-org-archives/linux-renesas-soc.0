Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1457609782-24108-31-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1457609782-24108-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
	<1457609782-24108-31-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Date: Thu, 10 Mar 2016 13:08:56 +0100
Message-ID: <CAMuHMdW_nMfWF-sQPFgtxmtA_1vxw_hFPsb1DkRp7TJtKrB2ig@mail.gmail.com>
Subject: Re: [PATCH 30/30] ARM: dts: r8a7794: Reference both DMA controllers
 in QSPI node
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Thu, Mar 10, 2016 at 12:36 PM, Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> R-Car Gen2 have two DMA controllers, which are equivalent. Add
> references to both dmac0 and dmac1 so the driver can fallback to the
> later if the first one is unavailable.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  arch/arm/boot/dts/r8a7794.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
> index 76709ff..e098eab 100644
> --- a/arch/arm/boot/dts/r8a7794.dtsi
> +++ b/arch/arm/boot/dts/r8a7794.dtsi
> @@ -605,8 +605,9 @@
>                 reg = <0 0xee200000 0 0x80>;
>                 interrupts = <0 169 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&mstp3_clks R8A7794_CLK_MMCIF0>;

This one has the wrong subject: QSPI vs. MMCIF.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

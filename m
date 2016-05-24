Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33646 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751990AbcEXHNW (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 24 May 2016 03:13:22 -0400
MIME-Version: 1.0
In-Reply-To: <1464065860-3948-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1464065860-3948-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1464065860-3948-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Tue, 24 May 2016 09:13:21 +0200
Message-ID: <CAMuHMdV+G5-kRkC+hx8aS4X8qkj_PaHK4F-mexvkSG=oRmcY9Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: salvator-x: enable usb2_phy of channel 0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Tue, May 24, 2016 at 6:57 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch also adds a regulator node for USB2.0 to handle VBUS on/off
> by the phy-rcar-gen3-usb2 driver.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> index c09ead3..21e7e09 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> @@ -112,6 +112,17 @@
>                           1800000 0>;
>         };
>
> +       vbus0_usb2_phy0: regulator@5 {

"make dtbs W=1":

Warning (unit_address_vs_reg): Node /regulator@5 has a unit name, but
no reg property

regulator-vbus0-usb2-phy0? (oops, what a long name)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

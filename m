Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33478 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727517AbeHFMmx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 08:42:53 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: Re: [PATCH 01/14] arm64: dts: renesas: Cut redundant <SoC> in *<SoC>-<SoC>ulcb*.dts
Date: Mon, 06 Aug 2018 13:35:08 +0300
Message-ID: <1772124.crYColn4IV@avalon>
In-Reply-To: <20180804231114.21420-2-erosca@de.adit-jv.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com> <20180804231114.21420-2-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Eugeniu,

Thank you for the patch.

On Sunday, 5 August 2018 02:11:01 EEST Eugeniu Rosca wrote:
> Perform a 's/(h|m)3ulcb/ulcb/' substitution in below DTS filenames:
>  - r8a7795-es1-h3ulcb.dts    => r8a7795-es1-ulcb.dts
>  - r8a7795-es1-h3ulcb-kf.dts => r8a7795-es1-ulcb-kf.dts
>  - r8a7795-h3ulcb.dts        => r8a7795-ulcb.dts
>  - r8a7795-h3ulcb-kf.dts     => r8a7795-ulcb-kf.dts
>  - r8a7796-m3ulcb.dts        => r8a7796-ulcb.dts
>  - r8a7796-m3ulcb-kf.dts     => r8a7796-ulcb-kf.dts
> 
> The background of this commit is M3-N ULCB (RTP0RC77965SKBX010SA00)
> bring-up, which (assuming no change in existing DTS name patterns)
> requires two new DTS files:
>  - r8a77965-m3nulcb.dts
>  - r8a77965-m3nulcb-kf.dts
> 
> In all above examples:
>  - "m3n" prefix is redundant, since r8a77965 denotes the M3-N SoC
>  - "m3"  prefix is redundant, since r8a7796  denotes the M3/M3-W SoC
>  - "h3"  prefix is redundant, since r8a7795  denotes the H3 SoC

The naming convention is roughly <soc>-<board>.dts. For instance, in r8a7795-
h3ulcb.dts, the SoC is R8A7795 and the board "H3 ULCB". With the proposed 
rename we would break that convention.

However, the name ULCB itself (which stands for Ultra Low Cost Board) might 
already not follow the naming convention, as the boards are officially called 
R-Car Starter Kit (Pro and Premier). The V3M and V3H "low-cost" boards reflect 
that properly, with their .dts files named r8a77970-v3msk.dts and r8a77970-
v3hsk.dts respectively.

I'm not opposed to simplifying the file names, but I think we should then 
decide on a simpler convention. In particular the H3/M3 and V3 .dts files 
should in my opinion follow the same convention.

I'll now let others comment on this as I don't have such a strong opinion on 
this topic.

> To make the DTS naming conventions consistent, drop the unneeded
> prefixes. Similar reasoning was applied by Marek in U-Boot v2017.09
> commit bd39050cb2a0 ("ARM: rmobile: ulcb: Add ULCB board support"):
> 
> $ git log -1 --format= --name-only bd39050cb2a -- "*defconfig"
> configs/r8a7795_ulcb_defconfig
> configs/r8a7796_ulcb_defconfig
> 
> DTB md5 sums match with and w/o the patch (hence no functional change).
> 
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  arch/arm64/boot/dts/renesas/Makefile                                       
>        | 12 ++++++------
> arch/arm64/boot/dts/renesas/{r8a7795-es1-h3ulcb-kf.dts =>
> r8a7795-es1-ulcb-kf.dts} |  2 +-
> arch/arm64/boot/dts/renesas/{r8a7795-es1-h3ulcb.dts =>
> r8a7795-es1-ulcb.dts}       |  0
> arch/arm64/boot/dts/renesas/{r8a7795-h3ulcb-kf.dts => r8a7795-ulcb-kf.dts} 
>        |  2 +- arch/arm64/boot/dts/renesas/{r8a7795-h3ulcb.dts =>
> r8a7795-ulcb.dts}               |  0
> arch/arm64/boot/dts/renesas/{r8a7796-m3ulcb-kf.dts => r8a7796-ulcb-kf.dts} 
>        |  2 +- arch/arm64/boot/dts/renesas/{r8a7796-m3ulcb.dts =>
> r8a7796-ulcb.dts}               |  0 7 files changed, 9 insertions(+), 9
> deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile
> b/arch/arm64/boot/dts/renesas/Makefile index 9e2394bc3c62..5debb02fad2c
> 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -1,11 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
> -dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-h3ulcb-kf.dtb
> +dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-ulcb.dtb
> +dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-ulcb-kf.dtb
>  dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
> -dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb
> r8a7795-es1-h3ulcb.dtb -dtb-$(CONFIG_ARCH_R8A7795) +=
> r8a7795-es1-h3ulcb-kf.dtb
> -dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
> -dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-m3ulcb-kf.dtb
> +dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb
> r8a7795-es1-ulcb.dtb +dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-ulcb-kf.dtb
> +dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-ulcb.dtb
> +dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-ulcb-kf.dtb
>  dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb
> r8a77965-salvator-xs.dtb dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
> r8a77970-v3msk.dtb diff --git
> a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
> b/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts similarity index 93%
> rename from arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
> rename to arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
> index 009cb1cb0dde..06deb67c36c8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
> @@ -9,7 +9,7 @@
>   * kind, whether express or implied.
>   */
> 
> -#include "r8a7795-es1-h3ulcb.dts"
> +#include "r8a7795-es1-ulcb.dts"
>  #include "ulcb-kf.dtsi"
> 
>  / {
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
> b/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb.dts similarity index 100%
> rename from arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
> rename to arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb.dts
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
> b/arch/arm64/boot/dts/renesas/r8a7795-ulcb-kf.dts similarity index 94%
> rename from arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
> rename to arch/arm64/boot/dts/renesas/r8a7795-ulcb-kf.dts
> index 4403227c0f97..70a0c5332d54 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-ulcb-kf.dts
> @@ -9,7 +9,7 @@
>   * kind, whether express or implied.
>   */
> 
> -#include "r8a7795-h3ulcb.dts"
> +#include "r8a7795-ulcb.dts"
>  #include "ulcb-kf.dtsi"
> 
>  / {
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> b/arch/arm64/boot/dts/renesas/r8a7795-ulcb.dts similarity index 100%
> rename from arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> rename to arch/arm64/boot/dts/renesas/r8a7795-ulcb.dts
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
> b/arch/arm64/boot/dts/renesas/r8a7796-ulcb-kf.dts similarity index 94%
> rename from arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
> rename to arch/arm64/boot/dts/renesas/r8a7796-ulcb-kf.dts
> index de2390f009e7..faa32c28eef7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-ulcb-kf.dts
> @@ -9,7 +9,7 @@
>   * kind, whether express or implied.
>   */
> 
> -#include "r8a7796-m3ulcb.dts"
> +#include "r8a7796-ulcb.dts"
>  #include "ulcb-kf.dtsi"
> 
>  / {
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
> b/arch/arm64/boot/dts/renesas/r8a7796-ulcb.dts similarity index 100%
> rename from arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
> rename to arch/arm64/boot/dts/renesas/r8a7796-ulcb.dts


-- 
Regards,

Laurent Pinchart

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:37785 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751464AbdHHKZA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2017 06:25:00 -0400
Received: by mail-wm0-f65.google.com with SMTP id t138so3433877wmt.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Aug 2017 03:25:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1502182499-16210-4-git-send-email-horms+renesas@verge.net.au>
References: <1502182499-16210-1-git-send-email-horms+renesas@verge.net.au> <1502182499-16210-4-git-send-email-horms+renesas@verge.net.au>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 8 Aug 2017 19:24:58 +0900
Message-ID: <CANqRtoTBt34QOoubpYPS65-8qVJ8c2X=u+bmMACXGr3nyTEpkA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: r8a7795: Use R-Car GPIO Gen3 fallback
 compat string
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, Aug 8, 2017 at 5:54 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> Use newly added R-Car GPIO Gen3 fallback compat string
> in the DT of the r8a7795 SoC.
>
> This should have no run-time effect as the driver matches against
> the per-SoC compat string before the fallback compat string is considered.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index a87ae76880ab..c9f2b87e7ee3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -1451,7 +1451,8 @@
>                 };
>
>                 sata: sata@ee300000 {
> -                       compatible = "renesas,sata-r8a7795";
> +                       compatible = "renesas,sata-r8a7795",
> +                                    "renesas,rcar-gen3-sata";
>                         reg = <0 0xee300000 0 0x200000>;
>                         interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cpg CPG_MOD 815>;
> --
> 2.1.4

This patch looks odd. The subject and patch description says GPIO but
the hunk above modifies SATA...?

Cheers,

/ magnus

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33158 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752696AbcJ0H2U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 03:28:20 -0400
Received: by mail-lf0-f68.google.com with SMTP id n3so1443336lfn.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 00:28:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1477551606-6903-1-git-send-email-horms+renesas@verge.net.au>
References: <1477551606-6903-1-git-send-email-horms+renesas@verge.net.au>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 27 Oct 2016 16:28:17 +0900
Message-ID: <CANqRtoSsKTvMjATz89nEY06Fp-J20VqjDzW0JD1NDLqEJQPwsQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: select errata 798181 for SoCs with CA15 cores
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Oct 27, 2016 at 4:00 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Select ARM errata 798181 on SoCs cores affected CA15 cores.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm/mach-shmobile/Kconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
> index c48be1d332ed..6fbd9b7d2d67 100644
> --- a/arch/arm/mach-shmobile/Kconfig
> +++ b/arch/arm/mach-shmobile/Kconfig
> @@ -60,6 +60,7 @@ config ARCH_R7S72100
>  config ARCH_R8A73A4
>         bool "R-Mobile APE6 (R8A73A40)"
>         select ARCH_RMOBILE
> +       select ARM_ERRATA_798181 if SMP
>         select RENESAS_IRQC
>
>  config ARCH_R8A7740
> @@ -70,6 +71,7 @@ config ARCH_R8A7740
>  config ARCH_R8A7743
>         bool "RZ/G1M (R8A77430)"
>         select ARCH_RCAR_GEN2
> +       select ARM_ERRATA_798181 if SMP
>
>  config ARCH_R8A7778
>         bool "R-Car M1A (R8A77781)"
> @@ -82,20 +84,24 @@ config ARCH_R8A7779
>  config ARCH_R8A7790
>         bool "R-Car H2 (R8A77900)"
>         select ARCH_RCAR_GEN2
> +       select ARM_ERRATA_798181 if SMP
>         select I2C

Thanks for your help.

I'm probably misunderstanding what this patch does and how the errata
effects the system, but the commit message says CA15 cores. The above
R-Car Gen1 and r8a7740 SoCs are not using CA15 - instead they use CA9.
Not sure if the errata still applies though.

So either the commit message or the list of the SoCs need to be updated.

Thanks,

/ magnus

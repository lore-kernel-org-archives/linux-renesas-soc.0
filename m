Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:42342 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750781AbeBBJzY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Feb 2018 04:55:24 -0500
Received: by mail-qt0-f193.google.com with SMTP id c2so30134990qtn.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Feb 2018 01:55:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180202093602.19256-1-horms+renesas@verge.net.au>
References: <20180202093602.19256-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Feb 2018 10:55:22 +0100
Message-ID: <CAMuHMdVfqxi8v5wiFui2Qev5TCQ-yMm81Q5o=WAVJeZxYrgXBw@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: enable R8A77970 SoC
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 2, 2018 at 10:36 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Enable the Renesas R-Car V3H (R8A77970) SoC in the ARM64 defconfig.

Wrong subject, wrong body ;-)

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
>  Based on renesas-devel-20180130v2-v4.15
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6356c6da34ea..45a423f845c7 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -52,6 +52,7 @@ CONFIG_ARCH_RENESAS=y
>  CONFIG_ARCH_R8A7795=y
>  CONFIG_ARCH_R8A7796=y
>  CONFIG_ARCH_R8A77970=y
> +CONFIG_ARCH_R8A77980=y
>  CONFIG_ARCH_R8A77995=y
>  CONFIG_ARCH_STRATIX10=y
>  CONFIG_ARCH_TEGRA=y

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

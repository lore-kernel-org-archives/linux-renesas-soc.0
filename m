Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:45096 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750773AbeBBJ6O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Feb 2018 04:58:14 -0500
Received: by mail-qk0-f193.google.com with SMTP id z12so23136001qkf.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Feb 2018 01:58:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180202093609.19306-1-horms+renesas@verge.net.au>
References: <20180202093609.19306-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Feb 2018 10:58:13 +0100
Message-ID: <CAMuHMdWJM_OB7tRR4LjEOaigKNkL_ox7-KDUUTbnm5GgG6k0dw@mail.gmail.com>
Subject: Re: [PATCH topic/renesas_defconfig] arm64: renesas_defconfig: enable
 R8A77970 SoC
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
> Enable the Renesas R-Car V3H (R8A77970) SoC in the ARM64 renesas_defconfig.

R8A77980...

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/configs/renesas_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
>  Based on renesas-devel-20180202-v4.15
>
>  Not for upstream merge
>
> diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
> index 3087bba06d3c..386211464efa 100644
> --- a/arch/arm64/configs/renesas_defconfig
> +++ b/arch/arm64/configs/renesas_defconfig
> @@ -34,6 +34,7 @@ CONFIG_ARCH_RENESAS=y
>  CONFIG_ARCH_R8A7795=y
>  CONFIG_ARCH_R8A7796=y
>  CONFIG_ARCH_R8A77970=y
> +CONFIG_ARCH_R8A77980=y
>  CONFIG_ARCH_R8A77995=y
>  CONFIG_PCI=y
>  CONFIG_PCIEPORTBUS=y

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

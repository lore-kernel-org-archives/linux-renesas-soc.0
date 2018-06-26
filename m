Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:40011 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751869AbeFZHZc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jun 2018 03:25:32 -0400
MIME-Version: 1.0
References: <2809eba8-4c9a-1d5f-a47d-8125777e365b@cogentembedded.com> <8c72d27f-8b1a-23cf-3f41-781944cd1388@cogentembedded.com>
In-Reply-To: <8c72d27f-8b1a-23cf-3f41-781944cd1388@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Jun 2018 09:25:20 +0200
Message-ID: <CAMuHMdXro+fWQtoURHeqC6APqmci60NiMn5JAF98xcLxrjLNEg@mail.gmail.com>
Subject: Re: [PATCH 1/2] sh_eth: fix *enum* RPADIR_BIT
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Mon, Jun 25, 2018 at 10:37 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The *enum*  RPADIR_BIT  was declared in the commit 86a74ff21a7a ("net:
> sh_eth: add support for Renesas SuperH Ethernet") adding SH771x support,
> however the SH771x manual doesn't have the RPADIR register described and,
> moreover, tells why the padding insertion must not be used. The newer SoC
> manuals do have RPADIR documented, though with somewhat different layout --
> update the *enum* according to these manuals...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
> +++ net-next/drivers/net/ethernet/renesas/sh_eth.h
> @@ -403,8 +403,7 @@ enum DESC_I_BIT {
>
>  /* RPADIR */
>  enum RPADIR_BIT {
> -       RPADIR_PADS1 = 0x20000, RPADIR_PADS0 = 0x10000,
> -       RPADIR_PADR = 0x0003f,
> +       RPADIR_PADS = 0x1f0000, RPADIR_PADR = 0xffff,

Perhaps add some comments?

        RPADIR_PADS = 0x1f0000; /* Padding Size (insert N bytes of padding) */
        RPADIR_PADR = 0xffff;   /* Padding Slot (insert padding at byte N) */
>  };

Note that none of the RPADIR enums are actually used.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

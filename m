Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:40778 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751166AbeFTNow (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 09:44:52 -0400
Received: by mail-vk0-f68.google.com with SMTP id o71-v6so1965114vke.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jun 2018 06:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <152923212426.18394.1638836062311758848.sendpatchset@little-apple> <152923214214.18394.2028588895827362308.sendpatchset@little-apple>
In-Reply-To: <152923214214.18394.2028588895827362308.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Jun 2018 15:44:40 +0200
Message-ID: <CAMuHMdWw8Gz-kkE3LbtaOBepiD5FRp-jEr9+HFV4c5zZLtVtww@mail.gmail.com>
Subject: Re: [PATCH v2 02/03] arm64: dts: renesas: r8a77980: Add IPMMU devices nodes
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

Thanks for your patch!

On Sun, Jun 17, 2018 at 12:41 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add IPMMU device nodes for the R-Car V3H SoC aka r8a77980.
>
> The r8a77980 IPMMU is quite similar to r8a77970 however VC0
> has been added. The IMSSTR bit assignment has also been

... VC0, VIP0, and VIP1 have been added.

> reworked. Power domains are also quite different however the
> the documentation is rather unclear about this topic.
>
> Until we know better VC0 gets assigned to R8A77980_PD_ALWAYS_ON.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

>  Changes since V1:
>  - Added ipmmu_vip0 and ipmmu_vip1 from 1.00 data sheet
>  - Interrupt bit configuration based on 1.00 data sheet

... which lacks the bits for VIP0 and VIP1, sigh...

>  - Updated order of DT nodes per request by Simon

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:45035 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbeLJIkz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 03:40:55 -0500
Received: by mail-vs1-f65.google.com with SMTP id g68so6116589vsd.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 00:40:54 -0800 (PST)
MIME-Version: 1.0
References: <20181015105517.28032-1-wsa+renesas@sang-engineering.com> <20181209215154.GB5856@kunai>
In-Reply-To: <20181209215154.GB5856@kunai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Dec 2018 09:40:41 +0100
Message-ID: <CAMuHMdVpRYSCyho4n2R8p2s4WV1bXv8MM4VbMA9NVJjwT_rHzg@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: dma-mapping: update comment about handling
 dma_ops when detaching from IOMMU
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Sun, Dec 9, 2018 at 10:51 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Mon, Oct 15, 2018 at 12:55:17PM +0200, Wolfram Sang wrote:
> > Update the comment because we don't set the pointer to NULL anymore.
> > Also use the correct pointer name 'dma_ops' instead of 'dma_map_ops'.
> >
> > Fixes: 1874619a7df4 ("ARM: dma-mapping: Set proper DMA ops in arm_iommu_detach_device()")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Russell, is this patch in your realm? If not, whom should I contact?

Probably you should contact Russell's patch system, instead of Russell's
human email instance, cfr. Documentation/arm/README

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

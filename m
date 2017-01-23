Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34335 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751016AbdAWMxD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 07:53:03 -0500
Received: by mail-it0-f68.google.com with SMTP id o185so10048691itb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2017 04:53:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <148517236353.14544.12595546402748556370.sendpatchset@little-apple>
References: <148517236353.14544.12595546402748556370.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jan 2017 13:53:01 +0100
Message-ID: <CAMuHMdV0_rUs6CRyoAbi5ZsNy9xobRngy92VV=W7uyWxKzBLuA@mail.gmail.com>
Subject: Re: [PATCH/RFC] iommu/ipmmu-vmsa: Initial R-Car Gen3 VA64 mode support
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Mon, Jan 23, 2017 at 12:52 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Here's a prototype that enables IMCTR_VA64 support for the IPMMU driver
> on R-Car Gen3 platforms. I've tested it lightly on r8a7796 Salvator-X
> with local second serial port code and SYS-DMAC support via DMA Engine.
>
> My goal has been to enable 40 bits or more of IOVA space, but it turns
> out that it requires either 64K page size support or support for 4K pages
> starting from level 0.
>
> For now this keeps 32-bit IOVA space however the hardware gets configured
> to enable IMCTR_VA64 which also seems to require setting up TSZ0[5:0].
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Do you mean this is incompatible with "dmaengine: rcar-dmac: Widen DMA mask
to 40 bits" (http://www.spinics.net/lists/linux-renesas-soc/msg08338.html),
so we can still not upstream that patch?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

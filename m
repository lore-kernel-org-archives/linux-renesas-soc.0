Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:42462 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbeH3Mcj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 08:32:39 -0400
Received: by mail-ua1-f67.google.com with SMTP id w7-v6so4984174uan.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 01:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180829212921.10665-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180829212921.10665-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Aug 2018 10:31:26 +0200
Message-ID: <CAMuHMdX2nUXG9Ue8fip4mW=to62OAtKeXPpgF1G2=xUP5uHDpQ@mail.gmail.com>
Subject: Re: [PATCH] dma-mapping: fix return type of dma_set_max_seg_size()
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 29, 2018 at 11:30 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The function dma_set_max_seg_size() can return either 0 on success or
> -EIO on error. Change its return type from unsigned int to int to
> capture this.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

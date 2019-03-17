Return-Path: <SRS0=pEya=RU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D3EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 10:24:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2437321019
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 10:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfCQKYf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Mar 2019 06:24:35 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:34774 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbfCQKYf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Mar 2019 06:24:35 -0400
Received: by mail-ua1-f68.google.com with SMTP id c6so1954497uan.1;
        Sun, 17 Mar 2019 03:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ab/2saXbLLk50RkR1Ssg5jqFOXwWVHhnPDWPHkaTfMI=;
        b=UU54ZB6GY38vSF52RoAPb0IV/Rb0RBpWsnxSoX+L4Tt0ieSpznY8mb2g+IyC8W++do
         WZbb26klOQpKlgskQZN+tm1e8nXisUXuTrINbmH6DP/UCsckI4uEfZJ8AKs2XTiT0CYX
         pib1iNcvuV11rnOt+NWyCioWhjaWu5P5S8MOIFDzLCzbr2a8ZtcQRrbdYXwLef1CF2ls
         4etS53pEgVAohOWZU4h8nJHuhXUzGXRLiBUhHvL4OdUSPxUkPFPKidhfiRybzCIMPb3A
         wPUu9ZRmxwv60yZsOGHhEDXWUO/0EBDM7trPcxoAdE0HJjBWMklZyHm+qHtKmcBXEvYI
         +cRA==
X-Gm-Message-State: APjAAAXXriJkbloS1tnChhh1BviC08JJqsdHlXzMd6aybhLXPdL6Ltnv
        OzKyyjbwFvbCoKlUsBROeUSPksVjLjzN63zwGMcnSw==
X-Google-Smtp-Source: APXvYqwwNfGD3Zi1PJheadYW1n8BtNfILXZtfxsTw3qGV9+By4Ton0SbU7FVd5EoqmZvK1I66xLtieEb29F+5QdS3X8=
X-Received: by 2002:ab0:1342:: with SMTP id h2mr3960175uae.47.1552818273997;
 Sun, 17 Mar 2019 03:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190307000440.8708-1-marek.vasut@gmail.com> <7c051bbd-7835-9cab-30b2-0acde1364781@arm.com>
 <356f3ee8-407f-f865-e5cc-333695d4f857@gmail.com> <79e44e90-b16a-5315-e02f-101a2ebbb6a0@arm.com>
 <a8b5b75f-2660-e216-033a-77808e2afb76@gmail.com> <20190308071810.GA11959@lst.de>
 <a6b34982-9100-0e60-c3eb-6ed8fcbe9e93@gmail.com> <20190313183056.GB4926@lst.de>
 <3b665597-a616-70fc-8cd0-dfde236fe669@gmail.com>
In-Reply-To: <3b665597-a616-70fc-8cd0-dfde236fe669@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 17 Mar 2019 11:24:22 +0100
Message-ID: <CAMuHMdU5S8UGctWR8+4sFqgQxrkoH71_ZzZ2ENFhrPc+svfGLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] [RFC] ata: ahci: Respect bus DMA constraints
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>, linux-ide@vger.kernel.org,
        linux-nvme@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@fb.com>, Jens Axboe <axboe@kernel.dk>,
        Keith Busch <keith.busch@intel.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Sat, Mar 16, 2019 at 10:26 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 3/13/19 7:30 PM, Christoph Hellwig wrote:
> > On Sat, Mar 09, 2019 at 12:23:15AM +0100, Marek Vasut wrote:
> >> On 3/8/19 8:18 AM, Christoph Hellwig wrote:
> >>> On Thu, Mar 07, 2019 at 12:14:06PM +0100, Marek Vasut wrote:
> >>>>> Right, but whoever *interprets* the device masks after the driver has
> >>>>> overridden them should be taking the (smaller) bus mask into account as
> >>>>> well, so the question is where is *that* not being done correctly?
> >>>>
> >>>> Do you have a hint where I should look for that ?
> >>>
> >>> If this a 32-bit ARM platform it might the complete lack of support
> >>> for bus_dma_mask in arch/arm/mm/dma-mapping.c..
> >>
> >> It's an ARM 64bit platform, just the PCIe controller is limited to 32bit
> >> address range, so the devices on the PCIe bus cannot read the host's
> >> DRAM above the 32bit limit.
> >
> > arm64 should take the mask into account both for the swiotlb and
> > iommu case.  What are the exact symptoms you see?
>
> With the nvme, the device is recognized, but cannot be used.
> It boils down to PCI BAR access being possible, since that's all below
> the 32bit boundary, but when the device tries to do any sort of DMA,
> that transfer returns nonsense data.
>
> But when I call dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(32) in
> the affected driver (thus far I tried this nvme, xhci-pci and ahci-pci
> drivers), it all starts to work fine.
>
> Could it be that the driver overwrites the (coherent_)dma_mask and
> that's why the swiotlb/iommu code cannot take this into account ?
>
> > Does it involve
> > swiotlb not kicking in, or iommu issues?
>
> How can I check ? I added printks into arch/arm64/mm/dma-mapping.c and
> drivers/iommu/dma-iommu.c , but I suspect I need to look elsewhere.

So far the IOMMU is disabled in upstream, as no devices are whitelisted
in drivers/iommu/ipmmu-vmsa.c.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

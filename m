Return-Path: <SRS0=pEya=RU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06597C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 10:30:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7643021738
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 10:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbfCQKaB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Mar 2019 06:30:01 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:39077 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfCQKaA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Mar 2019 06:30:00 -0400
Received: by mail-vs1-f65.google.com with SMTP id g127so745543vsd.6;
        Sun, 17 Mar 2019 03:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZFh+SlB4VshDo8Z0DegzUtN3cwZcCXo6Eq8HJTeJpWM=;
        b=CSImAoJZhkm7kDk1rDUfN8RTIYsCquSckG3A6u5RFBQK8zbJ5yTkGDv4Q3G7+bjP46
         Qvc7UVEWvc3osSo1B3eUp4jF7bbGmGK63uDh1LVGRuaI+A02IS54PJBAslqGJgu+yxaZ
         R0ZaHbYvXW48xOq6auoIviqfKtgubpUuwQzNdP4xY6wRylU1EXGTFkPnFpLZwSkpPx8I
         4eC417JoGfX5EEEAvPnTevikEFxIALUgNaS/9TjA8FlinagOsUdAqLykdBOypgTyZ+Gg
         CFGnAH38lTKlBclGgFmKG4mbsv+zKdE0pvkupjz6gxwCTPVimt1FeCXRozrGU6AoN5v/
         Zx1Q==
X-Gm-Message-State: APjAAAUoKP3qmo6eQ8uRiTktm/eWFXvYKA5z4SabvM8viKSfc5F+7RmQ
        lFMdnE0J0KZX9X072z/kMqReFir1WpFYXlnLsxo=
X-Google-Smtp-Source: APXvYqxSCwFuocuUe8bCUmzOKTYc6enCwl8nO6BJ3RQ3/+n4XKWqhXAACetT/fJ/HpXjFUPLO6sIC8CKbfpSOoYSdlk=
X-Received: by 2002:a67:8317:: with SMTP id f23mr2658554vsd.63.1552818599642;
 Sun, 17 Mar 2019 03:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190307000440.8708-1-marek.vasut@gmail.com> <7c051bbd-7835-9cab-30b2-0acde1364781@arm.com>
 <356f3ee8-407f-f865-e5cc-333695d4f857@gmail.com> <79e44e90-b16a-5315-e02f-101a2ebbb6a0@arm.com>
 <a8b5b75f-2660-e216-033a-77808e2afb76@gmail.com> <20190308071810.GA11959@lst.de>
 <a6b34982-9100-0e60-c3eb-6ed8fcbe9e93@gmail.com> <20190313183056.GB4926@lst.de>
 <3b665597-a616-70fc-8cd0-dfde236fe669@gmail.com> <e2322e9d-46a1-c588-85ea-f56e3846996d@gmail.com>
In-Reply-To: <e2322e9d-46a1-c588-85ea-f56e3846996d@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 17 Mar 2019 11:29:47 +0100
Message-ID: <CAMuHMdWiBh0JMKhXPpZh_PqvUGELN9PbgbZttTgKuzXZ3da5DA@mail.gmail.com>
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

On Sun, Mar 17, 2019 at 12:04 AM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 3/16/19 10:25 PM, Marek Vasut wrote:
> > On 3/13/19 7:30 PM, Christoph Hellwig wrote:
> >> On Sat, Mar 09, 2019 at 12:23:15AM +0100, Marek Vasut wrote:
> >>> On 3/8/19 8:18 AM, Christoph Hellwig wrote:
> >>>> On Thu, Mar 07, 2019 at 12:14:06PM +0100, Marek Vasut wrote:
> >>>>>> Right, but whoever *interprets* the device masks after the driver has
> >>>>>> overridden them should be taking the (smaller) bus mask into account as
> >>>>>> well, so the question is where is *that* not being done correctly?
> >>>>>
> >>>>> Do you have a hint where I should look for that ?
> >>>>
> >>>> If this a 32-bit ARM platform it might the complete lack of support
> >>>> for bus_dma_mask in arch/arm/mm/dma-mapping.c..
> >>>
> >>> It's an ARM 64bit platform, just the PCIe controller is limited to 32bit
> >>> address range, so the devices on the PCIe bus cannot read the host's
> >>> DRAM above the 32bit limit.
> >>
> >> arm64 should take the mask into account both for the swiotlb and
> >> iommu case.  What are the exact symptoms you see?
> >
> > With the nvme, the device is recognized, but cannot be used.
> > It boils down to PCI BAR access being possible, since that's all below
> > the 32bit boundary, but when the device tries to do any sort of DMA,
> > that transfer returns nonsense data.
> >
> > But when I call dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(32) in
> > the affected driver (thus far I tried this nvme, xhci-pci and ahci-pci
> > drivers), it all starts to work fine.
> >
> > Could it be that the driver overwrites the (coherent_)dma_mask and
> > that's why the swiotlb/iommu code cannot take this into account ?
> >
> >> Does it involve
> >> swiotlb not kicking in, or iommu issues?
> >
> > How can I check ? I added printks into arch/arm64/mm/dma-mapping.c and
> > drivers/iommu/dma-iommu.c , but I suspect I need to look elsewhere.
>
> Digging further ...
>
> drivers/nvme/host/pci.c nvme_map_data() calls dma_map_sg_attrs() and the
> resulting sglist contains entry with >32bit PA. This is because
> dma_map_sg_attrs() calls dma_direct_map_sg(), which in turn calls
> dma_direct_map_sg(), then dma_direct_map_page() and that's where it goes
> weird.
>
> dma_direct_map_page() does a dma_direct_possible() check before
> triggering swiotlb_map(). The check succeeds, so the later isn't executed.
>
> dma_direct_possible() calls dma_capable() with dev->dma_mask =
> DMA_BIT_MASK(64) and dev->dma_bus_mask = 0, so
> min_not_zero(*dev->dma_mask, dev->bus_dma_mask) returns DMA_BIT_MASK(64).
>
> Surely enough, if I hack dma_direct_possible() to return 0,
> swiotlb_map() kicks in and the nvme driver starts working fine.
>
> I presume the question here is, why is dev->bus_dma_mask = 0 ?

Because that's the default, and almost no code overrides that?

$ git grep "\<bus_dma_mask ="
arch/mips/pci/fixup-sb1250.c:           dev->dev.bus_dma_mask =
DMA_BIT_MASK(32);
arch/x86/kernel/pci-dma.c:      pdev->dev.bus_dma_mask = DMA_BIT_MASK(32);
drivers/acpi/arm64/iort.c:              dev->bus_dma_mask = mask;
drivers/of/device.c:            dev->bus_dma_mask = mask;

dev is the nvme PCI device, I assume? So you can ignore the last match.

The first two seem to be related to platforms that cannot do >32 bit DMA
on PCI. So that's a hint on how to fix this...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

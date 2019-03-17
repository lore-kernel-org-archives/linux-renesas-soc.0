Return-Path: <SRS0=pEya=RU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D04C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 23:39:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85C482085A
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 23:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9gr7hHa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfCQXjx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Mar 2019 19:39:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43694 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfCQXjw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Mar 2019 19:39:52 -0400
Received: by mail-wr1-f68.google.com with SMTP id d17so15051125wre.10;
        Sun, 17 Mar 2019 16:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Klz6fsM7pWH2lfAGiDQQEG42ngIYcp6Ymi1ce0uY+BA=;
        b=e9gr7hHafA7skz1EFtMfjL1deyzRBe+RVfyhdZ8UkXt/DsSBCBTygvFsNK/gB6UfQX
         fasKq+B4wXJYwoFeCrLZyj1le1K1u9X1VeABEn/YooTk1u4UuhrgxJy5fjaf2ZglHO4o
         QX097DTiV4gdAp4iSvQqkgq0gikaBpu2ohbPpvCIjqAEogrN10+0AtCGaMAcAR+V5feW
         cdfYw0tij2kDFatG/JGBkeTgfmHahxn0Ef32eiXNFPpk+jeXWWwG1UcRUNj3kZq8U8RH
         4N75jgkBigLNgFXFUSPgEKTmZwmZk/rtjBbvCFjWOWfef6JQtQUwvBzyxx3J0muEKmzm
         Qaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Klz6fsM7pWH2lfAGiDQQEG42ngIYcp6Ymi1ce0uY+BA=;
        b=rLfFlZzPH2tQZTVedjJS0p9nRPmbQyWsC43EhcfKULcVR4Zx4XLFNM9YQYsKzjpegw
         jJl2gWGZSYRkbI95MqJEfQxa+XdBSfeerTJnhQlE81KY80qXRZFuuQdwCRyxjUbzq253
         /XXHcbxOjXj03XiO2R6YdYFtI5h1Hzd57aUcVMlkkzL5J2LAnRxCbGvLxsao05Oo3qQ6
         6vl4+kkJ2flzrIdyu7Vxa8cn6HpUU0zrrrxQuQUpkze/r+kDc+I3WcK/LZXchgLrNcTr
         GuXZzA+Rs8Zla8ZziVA3+AnA9p1/uqJHrhLlew2g3aEDYZ0VLtTF78VvFh3h58sFQknc
         Auwg==
X-Gm-Message-State: APjAAAXFhCjpJZSE30azqFeeBPbo1KVblDXXgsM2YGxkwyaSrfKAWNIt
        lkc6dSqWluoxaqzngg8xjIMgfhEL
X-Google-Smtp-Source: APXvYqzmkK5vLMVoVAQQ7O6k/z4h9whGxdU4eKgL4fmjDjp2hhOwLe7+BiKZpbuHQ/BUA44J0YPevg==
X-Received: by 2002:a05:6000:128f:: with SMTP id f15mr9518808wrx.74.1552865989688;
        Sun, 17 Mar 2019 16:39:49 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id p6sm11151339wre.63.2019.03.17.16.39.47
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Mar 2019 16:39:48 -0700 (PDT)
Subject: Re: [PATCH 1/2] [RFC] ata: ahci: Respect bus DMA constraints
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
References: <20190307000440.8708-1-marek.vasut@gmail.com>
 <7c051bbd-7835-9cab-30b2-0acde1364781@arm.com>
 <356f3ee8-407f-f865-e5cc-333695d4f857@gmail.com>
 <79e44e90-b16a-5315-e02f-101a2ebbb6a0@arm.com>
 <a8b5b75f-2660-e216-033a-77808e2afb76@gmail.com>
 <20190308071810.GA11959@lst.de>
 <a6b34982-9100-0e60-c3eb-6ed8fcbe9e93@gmail.com>
 <20190313183056.GB4926@lst.de>
 <3b665597-a616-70fc-8cd0-dfde236fe669@gmail.com>
 <e2322e9d-46a1-c588-85ea-f56e3846996d@gmail.com>
 <CAMuHMdWiBh0JMKhXPpZh_PqvUGELN9PbgbZttTgKuzXZ3da5DA@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <6eb8eb87-f4c0-a1be-7585-cdc10f620899@gmail.com>
Date:   Mon, 18 Mar 2019 00:36:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWiBh0JMKhXPpZh_PqvUGELN9PbgbZttTgKuzXZ3da5DA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/17/19 11:29 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sun, Mar 17, 2019 at 12:04 AM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 3/16/19 10:25 PM, Marek Vasut wrote:
>>> On 3/13/19 7:30 PM, Christoph Hellwig wrote:
>>>> On Sat, Mar 09, 2019 at 12:23:15AM +0100, Marek Vasut wrote:
>>>>> On 3/8/19 8:18 AM, Christoph Hellwig wrote:
>>>>>> On Thu, Mar 07, 2019 at 12:14:06PM +0100, Marek Vasut wrote:
>>>>>>>> Right, but whoever *interprets* the device masks after the driver has
>>>>>>>> overridden them should be taking the (smaller) bus mask into account as
>>>>>>>> well, so the question is where is *that* not being done correctly?
>>>>>>>
>>>>>>> Do you have a hint where I should look for that ?
>>>>>>
>>>>>> If this a 32-bit ARM platform it might the complete lack of support
>>>>>> for bus_dma_mask in arch/arm/mm/dma-mapping.c..
>>>>>
>>>>> It's an ARM 64bit platform, just the PCIe controller is limited to 32bit
>>>>> address range, so the devices on the PCIe bus cannot read the host's
>>>>> DRAM above the 32bit limit.
>>>>
>>>> arm64 should take the mask into account both for the swiotlb and
>>>> iommu case.  What are the exact symptoms you see?
>>>
>>> With the nvme, the device is recognized, but cannot be used.
>>> It boils down to PCI BAR access being possible, since that's all below
>>> the 32bit boundary, but when the device tries to do any sort of DMA,
>>> that transfer returns nonsense data.
>>>
>>> But when I call dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(32) in
>>> the affected driver (thus far I tried this nvme, xhci-pci and ahci-pci
>>> drivers), it all starts to work fine.
>>>
>>> Could it be that the driver overwrites the (coherent_)dma_mask and
>>> that's why the swiotlb/iommu code cannot take this into account ?
>>>
>>>> Does it involve
>>>> swiotlb not kicking in, or iommu issues?
>>>
>>> How can I check ? I added printks into arch/arm64/mm/dma-mapping.c and
>>> drivers/iommu/dma-iommu.c , but I suspect I need to look elsewhere.
>>
>> Digging further ...
>>
>> drivers/nvme/host/pci.c nvme_map_data() calls dma_map_sg_attrs() and the
>> resulting sglist contains entry with >32bit PA. This is because
>> dma_map_sg_attrs() calls dma_direct_map_sg(), which in turn calls
>> dma_direct_map_sg(), then dma_direct_map_page() and that's where it goes
>> weird.
>>
>> dma_direct_map_page() does a dma_direct_possible() check before
>> triggering swiotlb_map(). The check succeeds, so the later isn't executed.
>>
>> dma_direct_possible() calls dma_capable() with dev->dma_mask =
>> DMA_BIT_MASK(64) and dev->dma_bus_mask = 0, so
>> min_not_zero(*dev->dma_mask, dev->bus_dma_mask) returns DMA_BIT_MASK(64).
>>
>> Surely enough, if I hack dma_direct_possible() to return 0,
>> swiotlb_map() kicks in and the nvme driver starts working fine.
>>
>> I presume the question here is, why is dev->bus_dma_mask = 0 ?
> 
> Because that's the default, and almost no code overrides that?

But shouldn't drivers/of/device.c set that for the PCIe controller ?

> $ git grep "\<bus_dma_mask ="
> arch/mips/pci/fixup-sb1250.c:           dev->dev.bus_dma_mask =
> DMA_BIT_MASK(32);
> arch/x86/kernel/pci-dma.c:      pdev->dev.bus_dma_mask = DMA_BIT_MASK(32);
> drivers/acpi/arm64/iort.c:              dev->bus_dma_mask = mask;
> drivers/of/device.c:            dev->bus_dma_mask = mask;
> 
> dev is the nvme PCI device, I assume? So you can ignore the last match.
> 
> The first two seem to be related to platforms that cannot do >32 bit DMA
> on PCI. So that's a hint on how to fix this...

That doesn't feel right, it's not a platform limitation, but a PCIe IP
limitation, so this fix should live somewhere in drivers/ I think ?

-- 
Best regards,
Marek Vasut

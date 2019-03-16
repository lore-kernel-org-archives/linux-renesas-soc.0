Return-Path: <SRS0=P06h=RT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5C1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Mar 2019 23:04:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B1C32186A
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Mar 2019 23:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNxGIzLR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfCPXEy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Mar 2019 19:04:54 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46297 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbfCPXEx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Mar 2019 19:04:53 -0400
Received: by mail-wr1-f65.google.com with SMTP id 33so13151746wrb.13;
        Sat, 16 Mar 2019 16:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1LUpfvbaELfOq52ZZZ0mfhW37Qz7xBt0GfvHjAncopc=;
        b=PNxGIzLRRtInwG6EZIInd8lLoea02hhbFgmbEaiPDnW1vIzBRKLDZ+G24t9YIjg0R/
         2wMijxPfhHviOFAN2GA+tl5KnTy5VISVthojqYWJG5QBZWt+SKsw2EJr/a3siaMoi7+X
         9p9Jhj5vMHKEsNKMRNOLWP2SALZV/yJGeQmJS/TAYDTPFEKdxKjiBLIPc/msLBKWDLSG
         fIcSyfkkAamU/cxkMlbaXKlONmA8t+xK0v96zCvl5V2pE0DdyIDkLX7HatYGQMGw60jh
         /lu3Ch8/dc2kSbzJZOqYrs++elBJluqv8k4fIlDev5i1fYMbKp7fJbNKom8kpJZ6jgAI
         2Vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1LUpfvbaELfOq52ZZZ0mfhW37Qz7xBt0GfvHjAncopc=;
        b=dUUlvSog5OHHEQE1Yeg/QmNECTGMpwhoDqCuDLFCbYR/vrWBeSbirgHd8DFNoI08/w
         B8XR3lya4Ei06lFKrOd6C1vaLvyZs+wmxNMn8Iqw9pgxu2RoxReY8s3654z8+mA7eAEG
         h3teIDk1SmienPzJWUW7BRjY1LlRsvqLHKHLJtmde/EFROuNM7UEQbU6XAzMw/vHnorD
         NQzKz9iW3YIhlUttuPH7ovc/MxQJot+4UcivodInxcV6IQQRT/r0HigHQaoeffKPE8D3
         64PbF9xrUTIBPDvwCV9jtVn+C/07urMvbaWz7qzS8DSl1MkNROI6iLh8ah8qJsgyPZNa
         b0ug==
X-Gm-Message-State: APjAAAXq9oMgT3uU9kYCc/SDORgeM0wcKA78Ud6owo8tlLMrwh80m76B
        Kxa0zNkm9b9iAoWKoNOcQnFCCJFw
X-Google-Smtp-Source: APXvYqwIgooDu9pa9V1/alpn+QMRLBxKQlWcG3yZae6U7oa7xkSfVwKv6LOBi9YndtiIm6V4MKnd5A==
X-Received: by 2002:adf:fa88:: with SMTP id h8mr6673334wrr.117.1552777490485;
        Sat, 16 Mar 2019 16:04:50 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id a18sm4225316wmm.14.2019.03.16.16.04.49
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Mar 2019 16:04:49 -0700 (PDT)
Subject: Re: [PATCH 1/2] [RFC] ata: ahci: Respect bus DMA constraints
To:     Christoph Hellwig <hch@lst.de>
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-ide@vger.kernel.org,
        linux-nvme@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@fb.com>, Jens Axboe <axboe@kernel.dk>,
        Keith Busch <keith.busch@intel.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190307000440.8708-1-marek.vasut@gmail.com>
 <7c051bbd-7835-9cab-30b2-0acde1364781@arm.com>
 <356f3ee8-407f-f865-e5cc-333695d4f857@gmail.com>
 <79e44e90-b16a-5315-e02f-101a2ebbb6a0@arm.com>
 <a8b5b75f-2660-e216-033a-77808e2afb76@gmail.com>
 <20190308071810.GA11959@lst.de>
 <a6b34982-9100-0e60-c3eb-6ed8fcbe9e93@gmail.com>
 <20190313183056.GB4926@lst.de>
 <3b665597-a616-70fc-8cd0-dfde236fe669@gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=marex@denx.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e2322e9d-46a1-c588-85ea-f56e3846996d@gmail.com>
Date:   Sun, 17 Mar 2019 00:04:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <3b665597-a616-70fc-8cd0-dfde236fe669@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/16/19 10:25 PM, Marek Vasut wrote:
> On 3/13/19 7:30 PM, Christoph Hellwig wrote:
>> On Sat, Mar 09, 2019 at 12:23:15AM +0100, Marek Vasut wrote:
>>> On 3/8/19 8:18 AM, Christoph Hellwig wrote:
>>>> On Thu, Mar 07, 2019 at 12:14:06PM +0100, Marek Vasut wrote:
>>>>>> Right, but whoever *interprets* the device masks after the driver has
>>>>>> overridden them should be taking the (smaller) bus mask into account as
>>>>>> well, so the question is where is *that* not being done correctly?
>>>>>
>>>>> Do you have a hint where I should look for that ?
>>>>
>>>> If this a 32-bit ARM platform it might the complete lack of support
>>>> for bus_dma_mask in arch/arm/mm/dma-mapping.c..
>>>
>>> It's an ARM 64bit platform, just the PCIe controller is limited to 32bit
>>> address range, so the devices on the PCIe bus cannot read the host's
>>> DRAM above the 32bit limit.
>>
>> arm64 should take the mask into account both for the swiotlb and
>> iommu case.  What are the exact symptoms you see?
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
>> Does it involve
>> swiotlb not kicking in, or iommu issues?
> 
> How can I check ? I added printks into arch/arm64/mm/dma-mapping.c and
> drivers/iommu/dma-iommu.c , but I suspect I need to look elsewhere.

Digging further ...

drivers/nvme/host/pci.c nvme_map_data() calls dma_map_sg_attrs() and the
resulting sglist contains entry with >32bit PA. This is because
dma_map_sg_attrs() calls dma_direct_map_sg(), which in turn calls
dma_direct_map_sg(), then dma_direct_map_page() and that's where it goes
weird.

dma_direct_map_page() does a dma_direct_possible() check before
triggering swiotlb_map(). The check succeeds, so the later isn't executed.

dma_direct_possible() calls dma_capable() with dev->dma_mask =
DMA_BIT_MASK(64) and dev->dma_bus_mask = 0, so
min_not_zero(*dev->dma_mask, dev->bus_dma_mask) returns DMA_BIT_MASK(64).

Surely enough, if I hack dma_direct_possible() to return 0,
swiotlb_map() kicks in and the nvme driver starts working fine.

I presume the question here is, why is dev->bus_dma_mask = 0 ?

-- 
Best regards,
Marek Vasut

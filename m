Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFEDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 23:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3F8E206C0
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 23:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBzpyi3n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfCRXZp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 19:25:45 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36394 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfCRXZp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 19:25:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id y13so14461694wrd.3;
        Mon, 18 Mar 2019 16:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XeV42sGyXAbTiMtSmcyCgva4FL7HlR2UbGItI2TYVPc=;
        b=aBzpyi3n6Nqdh+qaNlxXWt8LmXG5CPmlUK9g1N1rNeCY79AtvmES7NM9hm23ckreyi
         0jHUHTL1fI9PgQWAKppP0JFKT25gN44U1872U+wtIYt92AiWs6lHh8+AmRmZAstA28AT
         IMFYwlX0+9lAGxG+faqRWw8yL1pvhGClUlzABdmMKZgWLYmIaODwrWunnhzFAelOYH+w
         c5USFLwrgdY589HKAPv64BN3aCjdfgwzSa4OSBv/anjEmjE/6sOh4FC4O0LxgsnNzh/J
         U1mtt/nya/HDb5JXbpopbvY8L2zoEEG61SpNog7hE3wUs0BsrZAp6tswWuTnYBjVsnHk
         urxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XeV42sGyXAbTiMtSmcyCgva4FL7HlR2UbGItI2TYVPc=;
        b=g/XOEDxOoNOe2iR8NT+H/g/7XXmfIzKLso/e8HduAbwQDmiPzS/+e7Mlk4D9gjvQyJ
         LZLB2YeeZVttsewR0u3tpDa+IMQGGmbS0Z1JmEqSDLP9aqcBhsOPQVGA4MWeQ/8lkR8M
         /EXgUaR7hPBhAvuchwWCxksfWj8/hdn8LmLoKZ8eLpcgLap5bOr2rPR8HKqwAsFg+Sgo
         xyQX5EjDNPHreL1eHkdFrq/zHq0eq3oiD8yx2tDTjOEE0ONSRjRV9xtPQq+5W/enffNx
         kg8AOQEuB3rAuitoTl1uW6g1nkQVQcPQeiYa6579+U+aCrRPdWDOqLAeS726l0eKzx1G
         VIDA==
X-Gm-Message-State: APjAAAV0Xg/XfuwjB3WcwrEkzPGuMKDnwV5zlHFP36DsOOS3Pju6A6t4
        398zjPKkIlhPtCU6d0qYRZ/cfXxA
X-Google-Smtp-Source: APXvYqxdDSbvJ/GSFDJr90LL6WIJ+XhTC6xD0FsMX+i3u5Th4azeWZ6xXgiRkzbSG1oAF9ot5dhL4Q==
X-Received: by 2002:a5d:428c:: with SMTP id k12mr5763222wrq.279.1552951542337;
        Mon, 18 Mar 2019 16:25:42 -0700 (PDT)
Received: from [192.168.43.97] (cst-prg-67-183.cust.vodafone.cz. [46.135.67.183])
        by smtp.gmail.com with ESMTPSA id l4sm3097425wrf.35.2019.03.18.16.25.39
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Mar 2019 16:25:41 -0700 (PDT)
Subject: Re: [PATCH 1/2] [RFC] ata: ahci: Respect bus DMA constraints
To:     Robin Murphy <robin.murphy@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, linux-ide@vger.kernel.org,
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
 <6eb8eb87-f4c0-a1be-7585-cdc10f620899@gmail.com>
 <5fdb1775-5e44-ad25-62c9-52c247660062@arm.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <f56fc070-94cc-d1b4-07a0-f8cdeea46dc0@gmail.com>
Date:   Tue, 19 Mar 2019 00:25:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5fdb1775-5e44-ad25-62c9-52c247660062@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/18/19 2:14 PM, Robin Murphy wrote:
> On 17/03/2019 23:36, Marek Vasut wrote:
>> On 3/17/19 11:29 AM, Geert Uytterhoeven wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> On Sun, Mar 17, 2019 at 12:04 AM Marek Vasut <marek.vasut@gmail.com>
>>> wrote:
>>>> On 3/16/19 10:25 PM, Marek Vasut wrote:
>>>>> On 3/13/19 7:30 PM, Christoph Hellwig wrote:
>>>>>> On Sat, Mar 09, 2019 at 12:23:15AM +0100, Marek Vasut wrote:
>>>>>>> On 3/8/19 8:18 AM, Christoph Hellwig wrote:
>>>>>>>> On Thu, Mar 07, 2019 at 12:14:06PM +0100, Marek Vasut wrote:
>>>>>>>>>> Right, but whoever *interprets* the device masks after the
>>>>>>>>>> driver has
>>>>>>>>>> overridden them should be taking the (smaller) bus mask into
>>>>>>>>>> account as
>>>>>>>>>> well, so the question is where is *that* not being done
>>>>>>>>>> correctly?
>>>>>>>>>
>>>>>>>>> Do you have a hint where I should look for that ?
>>>>>>>>
>>>>>>>> If this a 32-bit ARM platform it might the complete lack of support
>>>>>>>> for bus_dma_mask in arch/arm/mm/dma-mapping.c..
>>>>>>>
>>>>>>> It's an ARM 64bit platform, just the PCIe controller is limited
>>>>>>> to 32bit
>>>>>>> address range, so the devices on the PCIe bus cannot read the host's
>>>>>>> DRAM above the 32bit limit.
>>>>>>
>>>>>> arm64 should take the mask into account both for the swiotlb and
>>>>>> iommu case.  What are the exact symptoms you see?
>>>>>
>>>>> With the nvme, the device is recognized, but cannot be used.
>>>>> It boils down to PCI BAR access being possible, since that's all below
>>>>> the 32bit boundary, but when the device tries to do any sort of DMA,
>>>>> that transfer returns nonsense data.
>>>>>
>>>>> But when I call dma_set_mask_and_coherent(dev->dev,
>>>>> DMA_BIT_MASK(32) in
>>>>> the affected driver (thus far I tried this nvme, xhci-pci and ahci-pci
>>>>> drivers), it all starts to work fine.
>>>>>
>>>>> Could it be that the driver overwrites the (coherent_)dma_mask and
>>>>> that's why the swiotlb/iommu code cannot take this into account ?
>>>>>
>>>>>> Does it involve
>>>>>> swiotlb not kicking in, or iommu issues?
>>>>>
>>>>> How can I check ? I added printks into arch/arm64/mm/dma-mapping.c and
>>>>> drivers/iommu/dma-iommu.c , but I suspect I need to look elsewhere.
>>>>
>>>> Digging further ...
>>>>
>>>> drivers/nvme/host/pci.c nvme_map_data() calls dma_map_sg_attrs() and
>>>> the
>>>> resulting sglist contains entry with >32bit PA. This is because
>>>> dma_map_sg_attrs() calls dma_direct_map_sg(), which in turn calls
>>>> dma_direct_map_sg(), then dma_direct_map_page() and that's where it
>>>> goes
>>>> weird.
>>>>
>>>> dma_direct_map_page() does a dma_direct_possible() check before
>>>> triggering swiotlb_map(). The check succeeds, so the later isn't
>>>> executed.
>>>>
>>>> dma_direct_possible() calls dma_capable() with dev->dma_mask =
>>>> DMA_BIT_MASK(64) and dev->dma_bus_mask = 0, so
>>>> min_not_zero(*dev->dma_mask, dev->bus_dma_mask) returns
>>>> DMA_BIT_MASK(64).
>>>>
>>>> Surely enough, if I hack dma_direct_possible() to return 0,
>>>> swiotlb_map() kicks in and the nvme driver starts working fine.
>>>>
>>>> I presume the question here is, why is dev->bus_dma_mask = 0 ?
>>>
>>> Because that's the default, and almost no code overrides that?
>>
>> But shouldn't drivers/of/device.c set that for the PCIe controller ?
> 
> Urgh, I really should have spotted the significance of "NVMe", but
> somehow it failed to click :(

Good thing it did now :-)

> Of course the existing code works fine for everything *except* PCI
> devices on DT-based systems... That's because of_dma_get_range() has
> never been made to work correctly with the trick we play of passing the
> host bridge of_node through of_dma_configure(). I've got at least 2 or 3
> half-finished attempts at improving that, but they keep getting
> sidetracked into trying to clean up the various new of_dma_configure()
> hacks I find in drivers and/or falling down the rabbit-hole of starting
> to redesign the whole dma_pfn_offset machinery entirely. Let me dig one
> up and try to constrain it to solve just this most common "one single
> limited range" condition for the sake of making actual progress...

That'd be nice, thank you. I'm happy to test it on various devices here.

-- 
Best regards,
Marek Vasut

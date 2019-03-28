Return-Path: <SRS0=Kbds=R7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1919C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 03:25:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C9AA2075E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 03:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aobq23SD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfC1DZx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 23:25:53 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34545 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbfC1DZw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 23:25:52 -0400
Received: by mail-pf1-f195.google.com with SMTP id b3so9310076pfd.1;
        Wed, 27 Mar 2019 20:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PLbwhJJuCY3jkGPj5VCpzq/VebK7NgWH7TBKAYkPQDU=;
        b=Aobq23SDDCCj2aAvviN0VgIy8ItJxWJW22dAL68F8F2hIXQ0G13UVRoUklicl3a0JP
         tLhZ8gAluJfn3xxYzZNC0z0qgYOR0TdyYYqqAL+HqyfpnFsxtwtVIWaFG1tGK6Dk5eJE
         Uzp7FwD/2PWH/A2DzfIk7B7fSj1FOrSoKFF1IAvVSe6sZSzdUsYFkSoUquj/Y4kI8hZe
         66rkAhPkUetZrFYuVLZtbIHWMjwsgSqLFrSHjpaNDuCMN/Yqv1vp+IktpBG1OvLRnu19
         Q6XXY33FD+VHhn0S8JI51Gv5gOQ0wGv+k3pJrxPf1AuyMmTIocdU0ctTROVpT/JaTGY/
         +4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PLbwhJJuCY3jkGPj5VCpzq/VebK7NgWH7TBKAYkPQDU=;
        b=Ra++mL+NAiYNvgH33cbxEbg2hbrop8n1ytSAlrxRMsfM9jKziamYTQ0l1/dE08Hh8q
         t8yVCdNjaKblo1pcPI5TiMY/vLLoe3GAwLQ2lCSrFi6np2/FkWuw5MXUFSKG6TZXATxM
         7XHpJ5auOqVdznqPEahUWS0nar81Ogb4F36U3EV2+F7oNEpkIMrI6wYvjJpCCHBa7N2F
         SIxfuc38drX5qXU7gBcrrQ8ZVjMM1h3tkRRbxbNr6qutQNY7W5rWZXQR0kz70eh1g2ZC
         kGgNtIfwOvhZo3W9pGSJrlLfQGy05o7Lg5/xw/FQ5RREgyoM3qrKb21b/bj9sUsvtIVQ
         Zt9w==
X-Gm-Message-State: APjAAAUrAfSc+arzypR8/bnitgmG1p1gVb9VspgFC6K/yESiPU2IKQMj
        zn1EFzSZMBcKG2/J9VLlVkphpfwm
X-Google-Smtp-Source: APXvYqxi3kj6oJq3NShzLbCpZ64LmGLo0DuVc87timUHhdscNe2+R+yziF4/04Inzk6HMKwzGvhTcg==
X-Received: by 2002:a65:64c3:: with SMTP id t3mr37600764pgv.14.1553743551672;
        Wed, 27 Mar 2019 20:25:51 -0700 (PDT)
Received: from [192.168.42.184] (219x120x4x122.ap219.ftth.ucom.ne.jp. [219.120.4.122])
        by smtp.gmail.com with ESMTPSA id m67sm35021934pfj.70.2019.03.27.20.25.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Mar 2019 20:25:50 -0700 (PDT)
Subject: Re: [PATCH 1/2] [RFC] ata: ahci: Respect bus DMA constraints
From:   Marek Vasut <marek.vasut@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, linux-ide@vger.kernel.org,
        linux-nvme@lists.infradead.org,
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
 <f56fc070-94cc-d1b4-07a0-f8cdeea46dc0@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <d5c682f4-720d-c0b7-1199-b1e1d4820b79@gmail.com>
Date:   Thu, 28 Mar 2019 04:25:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <f56fc070-94cc-d1b4-07a0-f8cdeea46dc0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/19/19 12:25 AM, Marek Vasut wrote:
> On 3/18/19 2:14 PM, Robin Murphy wrote:
>> On 17/03/2019 23:36, Marek Vasut wrote:
>>> On 3/17/19 11:29 AM, Geert Uytterhoeven wrote:
>>>> Hi Marek,
>>>
>>> Hi,
>>>
>>>> On Sun, Mar 17, 2019 at 12:04 AM Marek Vasut <marek.vasut@gmail.com>
>>>> wrote:
>>>>> On 3/16/19 10:25 PM, Marek Vasut wrote:
>>>>>> On 3/13/19 7:30 PM, Christoph Hellwig wrote:
>>>>>>> On Sat, Mar 09, 2019 at 12:23:15AM +0100, Marek Vasut wrote:
>>>>>>>> On 3/8/19 8:18 AM, Christoph Hellwig wrote:
>>>>>>>>> On Thu, Mar 07, 2019 at 12:14:06PM +0100, Marek Vasut wrote:
>>>>>>>>>>> Right, but whoever *interprets* the device masks after the
>>>>>>>>>>> driver has
>>>>>>>>>>> overridden them should be taking the (smaller) bus mask into
>>>>>>>>>>> account as
>>>>>>>>>>> well, so the question is where is *that* not being done
>>>>>>>>>>> correctly?
>>>>>>>>>>
>>>>>>>>>> Do you have a hint where I should look for that ?
>>>>>>>>>
>>>>>>>>> If this a 32-bit ARM platform it might the complete lack of support
>>>>>>>>> for bus_dma_mask in arch/arm/mm/dma-mapping.c..
>>>>>>>>
>>>>>>>> It's an ARM 64bit platform, just the PCIe controller is limited
>>>>>>>> to 32bit
>>>>>>>> address range, so the devices on the PCIe bus cannot read the host's
>>>>>>>> DRAM above the 32bit limit.
>>>>>>>
>>>>>>> arm64 should take the mask into account both for the swiotlb and
>>>>>>> iommu case.  What are the exact symptoms you see?
>>>>>>
>>>>>> With the nvme, the device is recognized, but cannot be used.
>>>>>> It boils down to PCI BAR access being possible, since that's all below
>>>>>> the 32bit boundary, but when the device tries to do any sort of DMA,
>>>>>> that transfer returns nonsense data.
>>>>>>
>>>>>> But when I call dma_set_mask_and_coherent(dev->dev,
>>>>>> DMA_BIT_MASK(32) in
>>>>>> the affected driver (thus far I tried this nvme, xhci-pci and ahci-pci
>>>>>> drivers), it all starts to work fine.
>>>>>>
>>>>>> Could it be that the driver overwrites the (coherent_)dma_mask and
>>>>>> that's why the swiotlb/iommu code cannot take this into account ?
>>>>>>
>>>>>>> Does it involve
>>>>>>> swiotlb not kicking in, or iommu issues?
>>>>>>
>>>>>> How can I check ? I added printks into arch/arm64/mm/dma-mapping.c and
>>>>>> drivers/iommu/dma-iommu.c , but I suspect I need to look elsewhere.
>>>>>
>>>>> Digging further ...
>>>>>
>>>>> drivers/nvme/host/pci.c nvme_map_data() calls dma_map_sg_attrs() and
>>>>> the
>>>>> resulting sglist contains entry with >32bit PA. This is because
>>>>> dma_map_sg_attrs() calls dma_direct_map_sg(), which in turn calls
>>>>> dma_direct_map_sg(), then dma_direct_map_page() and that's where it
>>>>> goes
>>>>> weird.
>>>>>
>>>>> dma_direct_map_page() does a dma_direct_possible() check before
>>>>> triggering swiotlb_map(). The check succeeds, so the later isn't
>>>>> executed.
>>>>>
>>>>> dma_direct_possible() calls dma_capable() with dev->dma_mask =
>>>>> DMA_BIT_MASK(64) and dev->dma_bus_mask = 0, so
>>>>> min_not_zero(*dev->dma_mask, dev->bus_dma_mask) returns
>>>>> DMA_BIT_MASK(64).
>>>>>
>>>>> Surely enough, if I hack dma_direct_possible() to return 0,
>>>>> swiotlb_map() kicks in and the nvme driver starts working fine.
>>>>>
>>>>> I presume the question here is, why is dev->bus_dma_mask = 0 ?
>>>>
>>>> Because that's the default, and almost no code overrides that?
>>>
>>> But shouldn't drivers/of/device.c set that for the PCIe controller ?
>>
>> Urgh, I really should have spotted the significance of "NVMe", but
>> somehow it failed to click :(
> 
> Good thing it did now :-)
> 
>> Of course the existing code works fine for everything *except* PCI
>> devices on DT-based systems... That's because of_dma_get_range() has
>> never been made to work correctly with the trick we play of passing the
>> host bridge of_node through of_dma_configure(). I've got at least 2 or 3
>> half-finished attempts at improving that, but they keep getting
>> sidetracked into trying to clean up the various new of_dma_configure()
>> hacks I find in drivers and/or falling down the rabbit-hole of starting
>> to redesign the whole dma_pfn_offset machinery entirely. Let me dig one
>> up and try to constrain it to solve just this most common "one single
>> limited range" condition for the sake of making actual progress...
> 
> That'd be nice, thank you. I'm happy to test it on various devices here.

Just curious, no stress, did you get anywhere with this patch(set) yet?

-- 
Best regards,
Marek Vasut

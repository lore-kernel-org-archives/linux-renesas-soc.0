Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FE9C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 12:16:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8863720857
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 12:16:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKXIJAdw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfDIMQw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 08:16:52 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37560 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfDIMQw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 08:16:52 -0400
Received: by mail-wm1-f65.google.com with SMTP id v14so3074343wmf.2;
        Tue, 09 Apr 2019 05:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EyYJkGuwYF8DITckHnZV0rFa6lQ0A0+mbtjiBXaHTbQ=;
        b=nKXIJAdwNEK5tlnrfU4Gg5qyG7q0wRmJ+AU7niGgf6NF9J36Mf8bjR3MGcJLrhy9tC
         kT9Vu5yVzk8SAXIUnXncXOvElEByL2O2ne2kadYRdwyZfYSwqfX4bHmJeVtCu/jwBty3
         tzHM+X7G3ZCWgUi73iM93c4irUqVicN1uSziMgoTIjxKkbF5EC1GN/653TvTvMC/LjrJ
         4yK/VDoRdsAYcBNKhg10p8oQBSCdO0VhyxtUIJGv/fpWTy3n9USp1qYYMYN3La2K9uvS
         e/SV4EY2LFxYSgwx8ozj1upvy/mN7VTgSgLKduUSA3U+0y8t6vWcTDsHm27xBhB70p9S
         yL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EyYJkGuwYF8DITckHnZV0rFa6lQ0A0+mbtjiBXaHTbQ=;
        b=qNtGEOiUp0oRUlMtqRlifxoZVALWun06UDOsmUy+bWdVRYasrivDJGvjoNhaYdQodo
         BvKyiu20uGxhXMuzXPOCNDuqJM+QmwL0gT5G8bR6YYV3wOdKAT+8clF5TJ0dN4zdWz5t
         FXa9SPNp8Yo38FN0KN3yopItvVf15iZzZ2e3iMHIKjDCLtlpiGTLzhmdiAXzTCvC0/GV
         K0CZgNE1asD3xx9LZseDVCMF/jRAAu1hzNvK3fHLts3/ArMSgkGfPrVI+bHLPA4c1cvX
         nmGj/cM4G14ResG2WT90QKOnbFUYNcwFH7RF+v6JmmEJSV6B/XDD5q2r1r65/uVvac5H
         /EiQ==
X-Gm-Message-State: APjAAAVpphx/oglzRo6u/ik09uCZsChH8S+9Zj1ddguSAnFUa+CMgO95
        NCxNDNsewjgufNHH8aDeX0+xqAVB
X-Google-Smtp-Source: APXvYqzfgW+VQFHorRhUjQ2GwRCU67YrvS3mAjccYtuMpoFKYvu/eIwyk0jVDgHeXQDBSc/uVxB65Q==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr23160246wmi.57.1554812208848;
        Tue, 09 Apr 2019 05:16:48 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id 10sm16540831wmd.23.2019.04.09.05.16.46
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 05:16:47 -0700 (PDT)
Subject: Re: [PATCH 1/2] [RFC] ata: ahci: Respect bus DMA constraints
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
 <d5c682f4-720d-c0b7-1199-b1e1d4820b79@gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <7d4a1642-269c-8ea2-500c-044a4277c986@gmail.com>
Date:   Tue, 9 Apr 2019 14:16:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d5c682f4-720d-c0b7-1199-b1e1d4820b79@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/28/19 4:25 AM, Marek Vasut wrote:
> On 3/19/19 12:25 AM, Marek Vasut wrote:
>> On 3/18/19 2:14 PM, Robin Murphy wrote:
>>> On 17/03/2019 23:36, Marek Vasut wrote:
>>>> On 3/17/19 11:29 AM, Geert Uytterhoeven wrote:
>>>>> Hi Marek,
>>>>
>>>> Hi,
>>>>
>>>>> On Sun, Mar 17, 2019 at 12:04 AM Marek Vasut <marek.vasut@gmail.com>
>>>>> wrote:
>>>>>> On 3/16/19 10:25 PM, Marek Vasut wrote:
>>>>>>> On 3/13/19 7:30 PM, Christoph Hellwig wrote:
>>>>>>>> On Sat, Mar 09, 2019 at 12:23:15AM +0100, Marek Vasut wrote:
>>>>>>>>> On 3/8/19 8:18 AM, Christoph Hellwig wrote:
>>>>>>>>>> On Thu, Mar 07, 2019 at 12:14:06PM +0100, Marek Vasut wrote:
>>>>>>>>>>>> Right, but whoever *interprets* the device masks after the
>>>>>>>>>>>> driver has
>>>>>>>>>>>> overridden them should be taking the (smaller) bus mask into
>>>>>>>>>>>> account as
>>>>>>>>>>>> well, so the question is where is *that* not being done
>>>>>>>>>>>> correctly?
>>>>>>>>>>>
>>>>>>>>>>> Do you have a hint where I should look for that ?
>>>>>>>>>>
>>>>>>>>>> If this a 32-bit ARM platform it might the complete lack of support
>>>>>>>>>> for bus_dma_mask in arch/arm/mm/dma-mapping.c..
>>>>>>>>>
>>>>>>>>> It's an ARM 64bit platform, just the PCIe controller is limited
>>>>>>>>> to 32bit
>>>>>>>>> address range, so the devices on the PCIe bus cannot read the host's
>>>>>>>>> DRAM above the 32bit limit.
>>>>>>>>
>>>>>>>> arm64 should take the mask into account both for the swiotlb and
>>>>>>>> iommu case.  What are the exact symptoms you see?
>>>>>>>
>>>>>>> With the nvme, the device is recognized, but cannot be used.
>>>>>>> It boils down to PCI BAR access being possible, since that's all below
>>>>>>> the 32bit boundary, but when the device tries to do any sort of DMA,
>>>>>>> that transfer returns nonsense data.
>>>>>>>
>>>>>>> But when I call dma_set_mask_and_coherent(dev->dev,
>>>>>>> DMA_BIT_MASK(32) in
>>>>>>> the affected driver (thus far I tried this nvme, xhci-pci and ahci-pci
>>>>>>> drivers), it all starts to work fine.
>>>>>>>
>>>>>>> Could it be that the driver overwrites the (coherent_)dma_mask and
>>>>>>> that's why the swiotlb/iommu code cannot take this into account ?
>>>>>>>
>>>>>>>> Does it involve
>>>>>>>> swiotlb not kicking in, or iommu issues?
>>>>>>>
>>>>>>> How can I check ? I added printks into arch/arm64/mm/dma-mapping.c and
>>>>>>> drivers/iommu/dma-iommu.c , but I suspect I need to look elsewhere.
>>>>>>
>>>>>> Digging further ...
>>>>>>
>>>>>> drivers/nvme/host/pci.c nvme_map_data() calls dma_map_sg_attrs() and
>>>>>> the
>>>>>> resulting sglist contains entry with >32bit PA. This is because
>>>>>> dma_map_sg_attrs() calls dma_direct_map_sg(), which in turn calls
>>>>>> dma_direct_map_sg(), then dma_direct_map_page() and that's where it
>>>>>> goes
>>>>>> weird.
>>>>>>
>>>>>> dma_direct_map_page() does a dma_direct_possible() check before
>>>>>> triggering swiotlb_map(). The check succeeds, so the later isn't
>>>>>> executed.
>>>>>>
>>>>>> dma_direct_possible() calls dma_capable() with dev->dma_mask =
>>>>>> DMA_BIT_MASK(64) and dev->dma_bus_mask = 0, so
>>>>>> min_not_zero(*dev->dma_mask, dev->bus_dma_mask) returns
>>>>>> DMA_BIT_MASK(64).
>>>>>>
>>>>>> Surely enough, if I hack dma_direct_possible() to return 0,
>>>>>> swiotlb_map() kicks in and the nvme driver starts working fine.
>>>>>>
>>>>>> I presume the question here is, why is dev->bus_dma_mask = 0 ?
>>>>>
>>>>> Because that's the default, and almost no code overrides that?
>>>>
>>>> But shouldn't drivers/of/device.c set that for the PCIe controller ?
>>>
>>> Urgh, I really should have spotted the significance of "NVMe", but
>>> somehow it failed to click :(
>>
>> Good thing it did now :-)
>>
>>> Of course the existing code works fine for everything *except* PCI
>>> devices on DT-based systems... That's because of_dma_get_range() has
>>> never been made to work correctly with the trick we play of passing the
>>> host bridge of_node through of_dma_configure(). I've got at least 2 or 3
>>> half-finished attempts at improving that, but they keep getting
>>> sidetracked into trying to clean up the various new of_dma_configure()
>>> hacks I find in drivers and/or falling down the rabbit-hole of starting
>>> to redesign the whole dma_pfn_offset machinery entirely. Let me dig one
>>> up and try to constrain it to solve just this most common "one single
>>> limited range" condition for the sake of making actual progress...
>>
>> That'd be nice, thank you. I'm happy to test it on various devices here.
> 
> Just curious, no stress, did you get anywhere with this patch(set) yet?

Bump ?

-- 
Best regards,
Marek Vasut

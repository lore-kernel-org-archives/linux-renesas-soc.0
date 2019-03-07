Return-Path: <SRS0=HvZV=RK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A95C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 11:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1EEA20675
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 11:14:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuFicL2I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfCGLOL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Mar 2019 06:14:11 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39543 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfCGLOL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Mar 2019 06:14:11 -0500
Received: by mail-wr1-f68.google.com with SMTP id l12so486039wrp.6;
        Thu, 07 Mar 2019 03:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AwpbqeAO07C6diHwfFVq+rjJGCyo1qYRpJVqpBilQbE=;
        b=fuFicL2IGbsk7B3HHoARGzKYVaReBiLBFoJVzu3HUQg428BK2Hw8iLRDAAASNHfApf
         cq1XK8OGYrogduo/5LNgXIWHg0wjeyu8RxcAwDj58anRgTKOc5NJ2x+EsJCE9BaqEoLK
         zgx2eecPBfxA05/t61m4N+X4SS5ylFizdLKkWC0vEq3A96tHGpza7F4dS++/bQgcM7at
         KMX0kBdZRBowBGPeNu7X7CHMxsV6cVUqmBzxl+Xu/RD1KyGlboDYVe8mh5Zz/GsfV/dc
         9/j3wqHNXsScAG+duhe6GpOoQKmS/BI+Ev3qFwvWonMTPYWa16RnaQGd4uoMc8FH29ht
         3OYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AwpbqeAO07C6diHwfFVq+rjJGCyo1qYRpJVqpBilQbE=;
        b=XH2oXeCUZbEK0c4ou1XbfHD9/nrxdfEXisTG5Ffu7S6bAcVKAqDORSS/W8HWiTfzyc
         iLuvHO9VzX4UOGEzdGOfeuLNCjaG+OsujaXSsj6v2co8mcZ7w4FaSOC4DynEMfjE9Q7S
         0rAx5/YGgYMuEFxdx+oMcYkUz8pwhPEnEQqXxXwcDJFRMSc6AZzQg46H+rn1avtNvGj9
         2ggJHUad2+wl82IWAeuWoXlK3NRMuBDwpr4DYeZ+Pt2DKl5nNU2JilR8Z6vR4yzNOOX1
         m4s7E6EnimVPXxNn5cKOcPcGJSFAXE0vE3i/WaSN5uI2j/DcHCynhB6WtCC6Z0BLcH4L
         tfOQ==
X-Gm-Message-State: APjAAAW8ZL1iLgYjnjEv92ORR1zlsCtiIBdKDfwWKBx69yPVUw8POG4h
        qNjaLGs0TwOA/3HqJuo4Q0Ctq52v
X-Google-Smtp-Source: APXvYqyyhqrQlGhDugc7stT0b1nb/aj9yySbeHlCae3mjdIidD+EAbop8RRf272f39NExtow6sIGJg==
X-Received: by 2002:a05:6000:128f:: with SMTP id f15mr6208445wrx.74.1551957248708;
        Thu, 07 Mar 2019 03:14:08 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id g81sm5770939wmf.7.2019.03.07.03.14.07
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Mar 2019 03:14:07 -0800 (PST)
Subject: Re: [PATCH 1/2] [RFC] ata: ahci: Respect bus DMA constraints
To:     Robin Murphy <robin.murphy@arm.com>, linux-ide@vger.kernel.org,
        linux-nvme@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
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
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <a8b5b75f-2660-e216-033a-77808e2afb76@gmail.com>
Date:   Thu, 7 Mar 2019 12:14:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <79e44e90-b16a-5315-e02f-101a2ebbb6a0@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/7/19 10:48 AM, Robin Murphy wrote:
> On 2019-03-07 9:37 am, Marek Vasut wrote:
>> On 3/7/19 10:32 AM, Robin Murphy wrote:
>>> On 2019-03-07 12:04 am, marek.vasut@gmail.com wrote:
>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>
>>>> Since commit 6c2fb2ea7636 ("of/device: Set bus DMA mask as
>>>> appropriate"),
>>>> the upstream bus can constraint device DMA range. Respect that
>>>> constraint
>>>> and do not change the device DMA masks if they were already set.
>>>>
>>>> This is applicable e.g. on systems where the PCIe controller cannot
>>>> expose
>>>> the full address space range. Such a system may have a 64bit CPU with
>>>> DRAM
>>>> mapped both below and above the 32bit address space, yet the PCIe
>>>> devices
>>>> can not perform DMA directly to/from the DRAM range above the 32bit
>>>> limit.
>>>> Hence, for such setup to work, all the buffers must exist below the
>>>> 32bit
>>>> limit.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>> Cc: Christoph Hellwig <hch@lst.de>
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Cc: Jens Axboe <axboe@fb.com>
>>>> Cc: Jens Axboe <axboe@kernel.dk>
>>>> Cc: Keith Busch <keith.busch@intel.com>
>>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>>> Cc: Sagi Grimberg <sagi@grimberg.me>
>>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> To: linux-ide@vger.kernel.org
>>>> To: linux-nvme@lists.infradead.org
>>>> ---
>>>>    drivers/ata/ahci.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
>>>> index 021ce46e2e57..2acce056dd8c 100644
>>>> --- a/drivers/ata/ahci.c
>>>> +++ b/drivers/ata/ahci.c
>>>> @@ -926,6 +926,13 @@ static int ahci_configure_dma_masks(struct
>>>> pci_dev *pdev, int using_dac)
>>>>        if (pdev->dma_mask && pdev->dma_mask < DMA_BIT_MASK(32))
>>>>            return 0;
>>>>    +    /*
>>>> +     * The upstream device could have applied DMA constraints already,
>>>> +     * respect those and do not change the DMA masks.
>>>> +     */
>>>> +    if (pdev->dev.dma_mask && pdev->dev.coherent_dma_mask)
>>>> +        return 0;
>>>
>>> At least for DT platforms, the device masks are always going to be set
>>> to some initial value, which will most commonly just be the 32-bit
>>> default - that should not prevent the driver from setting wider masks if
>>> that's what the device really supports (in fact there are some patches
>>> queued in which we're now starting to formalise that properly).
>>>
>>> Are you seeing a problem with a DMA API backend failing to respect
>>> bus_dma_mask?
>>
>> Yes, the DMA mask gets overridden here to 64bit one, which on the R-Car
>> Gen3 with PCI with 32bit addressing limitation makes the AHCI driver
>> fail (and NVMe driver, and xHCI PCI etc). All those PCI devices fail the
>> same way because they override the DMA mask.
> 
> Right, but whoever *interprets* the device masks after the driver has
> overridden them should be taking the (smaller) bus mask into account as
> well, so the question is where is *that* not being done correctly?

Do you have a hint where I should look for that ?

-- 
Best regards,
Marek Vasut

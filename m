Return-Path: <SRS0=HvZV=RK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BB7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 09:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F9E720675
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 09:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwqFhzGJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfCGJhI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Mar 2019 04:37:08 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35693 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbfCGJhI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Mar 2019 04:37:08 -0500
Received: by mail-wr1-f66.google.com with SMTP id t18so16593877wrx.2;
        Thu, 07 Mar 2019 01:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wkMQR1PJTOuihVLTJcEumDBKKuq3AwTHY8QcdnNKk58=;
        b=lwqFhzGJGellayjSa0rYfAwsQQC2pcGhXr0vX8P04L4O3q/mLDLHjOa3SZeabupaiQ
         Lsyd3kj0k0bcymp57zmkF+5QGzEfmmsXZlk/GQOHdymPd8o5iDSsz2suea39oenZkZ/F
         yjly+112Irb9YRx3g48XlPWkpvAtEu+RfiznSBgMkK9p5mZqAyvp2pKOOv5wLP3fjS3e
         GNiDs9E0n0taxamzSkpfushDgdegyCIVXTGYbgGnwKz7JS4Y2qnanhU73iBnr7rLxra8
         AF5GUNbYqbc6Cq4GyPz2EXB/sz5914bHW06wBJtqU4pC1jL+sBJoTjJP6qy8zgnLhTSv
         zfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wkMQR1PJTOuihVLTJcEumDBKKuq3AwTHY8QcdnNKk58=;
        b=nf70kTMGbdyP4qPbWd83TR/0dotnIVqJsR0in6PJUqMyFc1+IrqzxD6iuEhnkJr4GQ
         dAPUDF1mGpJxBoB6ymw4YsGSpQGhIeW0wVKYdz1mISmJzGCEp1xwloH7jeLeMe07fK12
         M+CgPwIjRd9hRZDEHoh2OxX/fuqREQ1+7FjeW5AjQGTbufkMPs76uICiuVrZmznhdwjY
         e1wRRCKDNEe8Di7EIbiGtZpzBJ4w3b+Yb8JYRoF85uPRyRl8AiCaXeq3v3Govz+0EIvI
         fltD4hEdvfpq+N4NartoKft0qw+QWdirWOdYLgnGTzi70o6qkKZUr143IH1o/ddxpa3L
         m44w==
X-Gm-Message-State: APjAAAU6sK0qxf36if/gruZ4vamAhkVaeUjMQEq1GzifpJYFymw2x2IG
        ucpcLd9YIeLaZ+PoDlp/eBYmiP9I
X-Google-Smtp-Source: APXvYqy9CP9ztPflqsC20QJKfTAKfeCAsnjrgi68PBO9dAXgL5pmMGg97zC81iaSDTjZMamrqrW5uQ==
X-Received: by 2002:a5d:570a:: with SMTP id a10mr6229098wrv.85.1551951426272;
        Thu, 07 Mar 2019 01:37:06 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id o8sm7261854wma.1.2019.03.07.01.37.04
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Mar 2019 01:37:05 -0800 (PST)
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
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <356f3ee8-407f-f865-e5cc-333695d4f857@gmail.com>
Date:   Thu, 7 Mar 2019 10:37:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <7c051bbd-7835-9cab-30b2-0acde1364781@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/7/19 10:32 AM, Robin Murphy wrote:
> On 2019-03-07 12:04 am, marek.vasut@gmail.com wrote:
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Since commit 6c2fb2ea7636 ("of/device: Set bus DMA mask as appropriate"),
>> the upstream bus can constraint device DMA range. Respect that constraint
>> and do not change the device DMA masks if they were already set.
>>
>> This is applicable e.g. on systems where the PCIe controller cannot
>> expose
>> the full address space range. Such a system may have a 64bit CPU with
>> DRAM
>> mapped both below and above the 32bit address space, yet the PCIe devices
>> can not perform DMA directly to/from the DRAM range above the 32bit
>> limit.
>> Hence, for such setup to work, all the buffers must exist below the 32bit
>> limit.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Jens Axboe <axboe@fb.com>
>> Cc: Jens Axboe <axboe@kernel.dk>
>> Cc: Keith Busch <keith.busch@intel.com>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: Sagi Grimberg <sagi@grimberg.me>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> To: linux-ide@vger.kernel.org
>> To: linux-nvme@lists.infradead.org
>> ---
>>   drivers/ata/ahci.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
>> index 021ce46e2e57..2acce056dd8c 100644
>> --- a/drivers/ata/ahci.c
>> +++ b/drivers/ata/ahci.c
>> @@ -926,6 +926,13 @@ static int ahci_configure_dma_masks(struct
>> pci_dev *pdev, int using_dac)
>>       if (pdev->dma_mask && pdev->dma_mask < DMA_BIT_MASK(32))
>>           return 0;
>>   +    /*
>> +     * The upstream device could have applied DMA constraints already,
>> +     * respect those and do not change the DMA masks.
>> +     */
>> +    if (pdev->dev.dma_mask && pdev->dev.coherent_dma_mask)
>> +        return 0;
> 
> At least for DT platforms, the device masks are always going to be set
> to some initial value, which will most commonly just be the 32-bit
> default - that should not prevent the driver from setting wider masks if
> that's what the device really supports (in fact there are some patches
> queued in which we're now starting to formalise that properly).
> 
> Are you seeing a problem with a DMA API backend failing to respect
> bus_dma_mask?

Yes, the DMA mask gets overridden here to 64bit one, which on the R-Car
Gen3 with PCI with 32bit addressing limitation makes the AHCI driver
fail (and NVMe driver, and xHCI PCI etc). All those PCI devices fail the
same way because they override the DMA mask.

-- 
Best regards,
Marek Vasut

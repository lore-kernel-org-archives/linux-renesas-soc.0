Return-Path: <SRS0=HvZV=RK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385AAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 09:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CBBC20675
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 09:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfCGJsn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Mar 2019 04:48:43 -0500
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:43030 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbfCGJsn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Mar 2019 04:48:43 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1D0E80D;
        Thu,  7 Mar 2019 01:48:42 -0800 (PST)
Received: from [192.168.1.123] (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92FEE3F706;
        Thu,  7 Mar 2019 01:48:39 -0800 (PST)
Subject: Re: [PATCH 1/2] [RFC] ata: ahci: Respect bus DMA constraints
To:     Marek Vasut <marek.vasut@gmail.com>, linux-ide@vger.kernel.org,
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
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <79e44e90-b16a-5315-e02f-101a2ebbb6a0@arm.com>
Date:   Thu, 7 Mar 2019 09:48:36 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <356f3ee8-407f-f865-e5cc-333695d4f857@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2019-03-07 9:37 am, Marek Vasut wrote:
> On 3/7/19 10:32 AM, Robin Murphy wrote:
>> On 2019-03-07 12:04 am, marek.vasut@gmail.com wrote:
>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>
>>> Since commit 6c2fb2ea7636 ("of/device: Set bus DMA mask as appropriate"),
>>> the upstream bus can constraint device DMA range. Respect that constraint
>>> and do not change the device DMA masks if they were already set.
>>>
>>> This is applicable e.g. on systems where the PCIe controller cannot
>>> expose
>>> the full address space range. Such a system may have a 64bit CPU with
>>> DRAM
>>> mapped both below and above the 32bit address space, yet the PCIe devices
>>> can not perform DMA directly to/from the DRAM range above the 32bit
>>> limit.
>>> Hence, for such setup to work, all the buffers must exist below the 32bit
>>> limit.
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>> Cc: Christoph Hellwig <hch@lst.de>
>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Cc: Jens Axboe <axboe@fb.com>
>>> Cc: Jens Axboe <axboe@kernel.dk>
>>> Cc: Keith Busch <keith.busch@intel.com>
>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>> Cc: Sagi Grimberg <sagi@grimberg.me>
>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>> Cc: linux-renesas-soc@vger.kernel.org
>>> To: linux-ide@vger.kernel.org
>>> To: linux-nvme@lists.infradead.org
>>> ---
>>>    drivers/ata/ahci.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
>>> index 021ce46e2e57..2acce056dd8c 100644
>>> --- a/drivers/ata/ahci.c
>>> +++ b/drivers/ata/ahci.c
>>> @@ -926,6 +926,13 @@ static int ahci_configure_dma_masks(struct
>>> pci_dev *pdev, int using_dac)
>>>        if (pdev->dma_mask && pdev->dma_mask < DMA_BIT_MASK(32))
>>>            return 0;
>>>    +    /*
>>> +     * The upstream device could have applied DMA constraints already,
>>> +     * respect those and do not change the DMA masks.
>>> +     */
>>> +    if (pdev->dev.dma_mask && pdev->dev.coherent_dma_mask)
>>> +        return 0;
>>
>> At least for DT platforms, the device masks are always going to be set
>> to some initial value, which will most commonly just be the 32-bit
>> default - that should not prevent the driver from setting wider masks if
>> that's what the device really supports (in fact there are some patches
>> queued in which we're now starting to formalise that properly).
>>
>> Are you seeing a problem with a DMA API backend failing to respect
>> bus_dma_mask?
> 
> Yes, the DMA mask gets overridden here to 64bit one, which on the R-Car
> Gen3 with PCI with 32bit addressing limitation makes the AHCI driver
> fail (and NVMe driver, and xHCI PCI etc). All those PCI devices fail the
> same way because they override the DMA mask.

Right, but whoever *interprets* the device masks after the driver has 
overridden them should be taking the (smaller) bus mask into account as 
well, so the question is where is *that* not being done correctly?

Robin.

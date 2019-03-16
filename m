Return-Path: <SRS0=P06h=RT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC0EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Mar 2019 21:26:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA049218AC
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Mar 2019 21:26:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNcAyerF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfCPV0T (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Mar 2019 17:26:19 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39884 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbfCPV0T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Mar 2019 17:26:19 -0400
Received: by mail-wr1-f66.google.com with SMTP id p8so13045738wrq.6;
        Sat, 16 Mar 2019 14:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=my6SBfLJj6MRalkbJ9BUpqUwh7CIjtFx3mKEzz2uOlQ=;
        b=XNcAyerFmV4sXQL7VOq5IdQTsGGP7a9oGIeFUEOzSqwarEJfkIu2iojkxsijHkZfD/
         MP3xna8S6yt8AntZSoUsgvmyfmArhqVMl+0FaKeXI4SOmGE2QdLv9i1drSCbNcavcgRW
         /IX5slEegdVzlO7ZrKLHSF2wnJvcMpYq1ujRWJyrcLeMbuEFVFX4jgrh5dcV9lT7R6t4
         lg9VZFA+jRSw+AOfTA/NC5pKgVQOe/CqSLyjfW7HU4BBgVtCtGMcUPpEgI9jTO11Vymq
         8tMIdA9zJHY1IUA+cw4rQ7DoPfMAxZNuHhOgVioipS3kWbqfvE8rDiWmhg3ZMgAtmFfq
         uQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=my6SBfLJj6MRalkbJ9BUpqUwh7CIjtFx3mKEzz2uOlQ=;
        b=ngeVVqemH/9CmqTwuiNbR/xudQGh4h37CTdwK5KAoxbV0Bq2gmg4GfzEN87rjd0PT7
         10Pn7kOjFr/UZsADVnoL3YIX+XiB+a2fOPVFKj3wwSY4/NEaHjkgBOpySHlQiu446bQO
         G9ZmnqQvF6TK5alnAqmwgLe6N74LD3w2mFM4T832b0iedHL+0JsM6LFbEfcMKAUp2I8H
         qtGWsNMwVMKq49Syxy7qwrtFTte1FOR7gE8ZaflbCfa25jR9wZRqOUU4avdRvY95WIYS
         BIKjwK6kVwbX1a3HT6urr7mki7EVLQT3L/tMs7ynSb5LLaojM2DCD1GujizymoZgrpzJ
         /2Rg==
X-Gm-Message-State: APjAAAXE7nFjZcKmVoJExQAd2DSJWQXoQqCe4YvhIF4BOme69C5qw5z4
        kv+LfbXeJoFJ8EoHABZ52yDUVa1N
X-Google-Smtp-Source: APXvYqwgxhgn9KwVcrEvDVUsNs9duZTWo0uVksEvDOXN0viKQGucDLAJ1eOXL0d5fQi+XVvNlae6Aw==
X-Received: by 2002:adf:f70c:: with SMTP id r12mr7355306wrp.54.1552771576552;
        Sat, 16 Mar 2019 14:26:16 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id a20sm5727604wmb.17.2019.03.16.14.26.14
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Mar 2019 14:26:15 -0700 (PDT)
From:   Marek Vasut <marek.vasut@gmail.com>
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
Openpgp: preference=signencrypt
Message-ID: <3b665597-a616-70fc-8cd0-dfde236fe669@gmail.com>
Date:   Sat, 16 Mar 2019 22:25:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190313183056.GB4926@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/13/19 7:30 PM, Christoph Hellwig wrote:
> On Sat, Mar 09, 2019 at 12:23:15AM +0100, Marek Vasut wrote:
>> On 3/8/19 8:18 AM, Christoph Hellwig wrote:
>>> On Thu, Mar 07, 2019 at 12:14:06PM +0100, Marek Vasut wrote:
>>>>> Right, but whoever *interprets* the device masks after the driver has
>>>>> overridden them should be taking the (smaller) bus mask into account as
>>>>> well, so the question is where is *that* not being done correctly?
>>>>
>>>> Do you have a hint where I should look for that ?
>>>
>>> If this a 32-bit ARM platform it might the complete lack of support
>>> for bus_dma_mask in arch/arm/mm/dma-mapping.c..
>>
>> It's an ARM 64bit platform, just the PCIe controller is limited to 32bit
>> address range, so the devices on the PCIe bus cannot read the host's
>> DRAM above the 32bit limit.
> 
> arm64 should take the mask into account both for the swiotlb and
> iommu case.  What are the exact symptoms you see?

With the nvme, the device is recognized, but cannot be used.
It boils down to PCI BAR access being possible, since that's all below
the 32bit boundary, but when the device tries to do any sort of DMA,
that transfer returns nonsense data.

But when I call dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(32) in
the affected driver (thus far I tried this nvme, xhci-pci and ahci-pci
drivers), it all starts to work fine.

Could it be that the driver overwrites the (coherent_)dma_mask and
that's why the swiotlb/iommu code cannot take this into account ?

> Does it involve
> swiotlb not kicking in, or iommu issues?

How can I check ? I added printks into arch/arm64/mm/dma-mapping.c and
drivers/iommu/dma-iommu.c , but I suspect I need to look elsewhere.

> What is the exact kernel version?

next/master from 20190306 (5.0.0 + next patches)

-- 
Best regards,
Marek Vasut

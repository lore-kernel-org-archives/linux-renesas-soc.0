Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:33026 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937381AbdAKNlY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 08:41:24 -0500
Received: by mail-lf0-f51.google.com with SMTP id k86so137053572lfi.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jan 2017 05:41:23 -0800 (PST)
Subject: Re: [PATCH] arm64: avoid increasing DMA masks above what hardware
 supports
To: Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <11daacde-5399-039f-80a3-01d7bd13e9e8@arm.com>
 <1484056844-9567-1-git-send-email-nikita.yoush@cogentembedded.com>
 <dca35acf-1adf-aa85-7a0b-d0c6ec702fa1@arm.com>
 <67314806-361d-e0ac-9292-37542160ead5@cogentembedded.com>
 <57459a4a-2c57-e081-8f27-cb83f23b5815@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>, fkan@apm.com
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <09cac197-9e57-5d3e-e742-f29c00051813@cogentembedded.com>
Date: Wed, 11 Jan 2017 16:41:20 +0300
MIME-Version: 1.0
In-Reply-To: <57459a4a-2c57-e081-8f27-cb83f23b5815@arm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> Yes, I think that ought to work, although the __iommu_setup_dma_ops()
> call will still want a real size reflecting the default mask

I see iommu_dma_ops do not define set_dma_mask.

So what if setup was done for size reflecting one mask and then driver
changes mask?  Will things still operate correctly?

Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9669C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 07:18:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B239E20684
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 07:18:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfCHHSR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 02:18:17 -0500
Received: from verein.lst.de ([213.95.11.211]:52103 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbfCHHSR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 02:18:17 -0500
Received: by newverein.lst.de (Postfix, from userid 2407)
        id B1D8D68C4E; Fri,  8 Mar 2019 08:18:10 +0100 (CET)
Date:   Fri, 8 Mar 2019 08:18:10 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-ide@vger.kernel.org,
        linux-nvme@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@fb.com>, Jens Axboe <axboe@kernel.dk>,
        Keith Busch <keith.busch@intel.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] [RFC] ata: ahci: Respect bus DMA constraints
Message-ID: <20190308071810.GA11959@lst.de>
References: <20190307000440.8708-1-marek.vasut@gmail.com> <7c051bbd-7835-9cab-30b2-0acde1364781@arm.com> <356f3ee8-407f-f865-e5cc-333695d4f857@gmail.com> <79e44e90-b16a-5315-e02f-101a2ebbb6a0@arm.com> <a8b5b75f-2660-e216-033a-77808e2afb76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8b5b75f-2660-e216-033a-77808e2afb76@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 07, 2019 at 12:14:06PM +0100, Marek Vasut wrote:
> > Right, but whoever *interprets* the device masks after the driver has
> > overridden them should be taking the (smaller) bus mask into account as
> > well, so the question is where is *that* not being done correctly?
> 
> Do you have a hint where I should look for that ?

If this a 32-bit ARM platform it might the complete lack of support
for bus_dma_mask in arch/arm/mm/dma-mapping.c..

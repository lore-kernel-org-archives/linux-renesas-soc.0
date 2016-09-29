Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34473 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750877AbcI2MnC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 08:43:02 -0400
Received: by mail-lf0-f51.google.com with SMTP id y6so78093862lff.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Sep 2016 05:43:00 -0700 (PDT)
Date: Thu, 29 Sep 2016 14:42:57 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        iommu@lists.linux-foundation.org, robin.murphy@arm.com,
        arnd@arndb.de
Subject: Re: [PATCH 0/2] dma-mapping: fix ia64 and m32r build error and
 warnings
Message-ID: <20160929124257.GB8472@bigcity.dyn.berto.se>
References: <20160929100240.7955-1-niklas.soderlund@ragnatech.se>
 <20160929121004.GT2467@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160929121004.GT2467@localhost>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2016-09-29 17:40:04 +0530, Vinod Koul wrote:
> On Thu, Sep 29, 2016 at 12:02:38PM +0200, Niklas S�derlund wrote:
> > From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > Hi Vindo,
> 
> :(

I'm sorry, my hands sometimes moves faster then my head.

> 
> > 
> > This small series fixes the build error and warnings for ia64 and m32r 
> > which kbuild test robot found and where introduced in the series 
> > '[PATCHv9 0/6] dmaengine: rcar-dmac: add iommu support for slave 
> > transfers'.
> 
> Applied both

Thanks.

> 
> Thanks
> -- 
> ~Vinod

-- 
Regards,
Niklas S�derlund

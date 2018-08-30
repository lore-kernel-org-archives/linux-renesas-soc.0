Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34233 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728497AbeH3PRu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 11:17:50 -0400
Received: by mail-lf1-f65.google.com with SMTP id c29-v6so726797lfj.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 04:16:12 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Thu, 30 Aug 2018 13:16:10 +0200
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: set scatter/gather max
 segment size
Message-ID: <20180830111610.GF28374@bigcity.dyn.berto.se>
References: <20180829222548.24399-1-niklas.soderlund+renesas@ragnatech.se>
 <20180830094911.wm4vqw5mrnrxhjda@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180830094911.wm4vqw5mrnrxhjda@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your feedback.

On 2018-08-30 11:49:12 +0200, Wolfram Sang wrote:
> Hi Niklas,
> 
> > +	if (!dev->dma_parms) {
> > +		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
> 
> Can't we use devm_kzalloc and skip the custom remove function?

We could do that but then we can't reset the struct device dma_parms 
member to NULL.

    kfree(dev->dma_parms);
    dev->dma_parms = NULL;

This might not be a problem but I chose to opt for the more safer 
approach at first. If you or someone else thinks this is not an issue 
I'm more then happy to switch to devm_kcalloc().

-- 
Regards,
Niklas S�derlund

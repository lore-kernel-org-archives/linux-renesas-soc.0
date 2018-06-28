Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:40331 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752116AbeF1AfK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 20:35:10 -0400
Received: by mail-lf0-f67.google.com with SMTP id q11-v6so2864185lfc.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jun 2018 17:35:10 -0700 (PDT)
Date: Thu, 28 Jun 2018 02:35:07 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 1/3] mmc: tmio: Add initial setting of interrupt mask
 register
Message-ID: <20180628003507.GR5237@bigcity.dyn.berto.se>
References: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606232252.31583-2-niklas.soderlund+renesas@ragnatech.se>
 <20180609181552.ks4awvnin4khowb4@ninjato>
 <20180627061411.GQ5237@bigcity.dyn.berto.se>
 <20180627072702.ayayizxgghvoogdf@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180627072702.ayayizxgghvoogdf@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your feedback.

On 2018-06-27 09:27:02 +0200, Wolfram Sang wrote:
> 
> > > > +#define TMIO_MASK_INIT          0x8b7f031d /* H/W initial value */
> > > 
> > > known on R-Car 2+ only!
> > 
> > No it's also know on Gen3 :-)
> 
> Sure, 2+ means "R-Car 2 and later". Like with GPL2+. Sorry if this was
> not clear. And it is still my main argument to do...

When you point it out it's clear, sorry I missed that.

> 
> > > So, we should at least protect this with TMIO_MMC_MIN_RCAR2, I'd think.
> > > Maybe we should even move it to renesas_sdhi_core.c, but I am not too
> > > sure about that.
> 
> ... this.
> 

I will look into this and send a new version :-)

-- 
Regards,
Niklas S�derlund

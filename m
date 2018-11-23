Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35459 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439676AbeKWXra (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 18:47:30 -0500
Received: by mail-lj1-f196.google.com with SMTP id x85-v6so10638142ljb.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Nov 2018 05:03:23 -0800 (PST)
Date: Fri, 23 Nov 2018 14:03:20 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mmc: tmio: introduce mask for 'always 1' bits
Message-ID: <20181123130320.GC1158@bigcity.dyn.berto.se>
References: <20181119131357.28648-1-wsa+renesas@sang-engineering.com>
 <20181122140255.32z7xi5o5aba6u5n@verge.net.au>
 <20181122140659.GB1070@kunai>
 <20181123125731.ysjtgl65uunelpul@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181123125731.ysjtgl65uunelpul@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your work.

On 2018-11-23 13:57:32 +0100, Simon Horman wrote:
> On Thu, Nov 22, 2018 at 03:06:59PM +0100, Wolfram Sang wrote:
> > 
> > > > +#define TMIO_STAT_ALWAYS_SET_27	BIT(27) /* only known on R-Car 2+ so far */
> > > 
> > > The _27 seems to be odd to include in the name, but I assume it
> > > was the least bad option you could come up with.
> > 
> > Yes :) I am open for better suggestions.
> 
> Simply dropping '_27' would be an improvement in my opinion.

I'm slightly agreeing with Simon here to drop the _27. With or without 
that change I think this patch looks good so feel free to add.

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

-- 
Regards,
Niklas S�derlund

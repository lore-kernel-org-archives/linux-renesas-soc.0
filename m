Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50482 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436515AbeKWXll (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 18:41:41 -0500
Date: Fri, 23 Nov 2018 13:57:32 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mmc: tmio: introduce mask for 'always 1' bits
Message-ID: <20181123125731.ysjtgl65uunelpul@verge.net.au>
References: <20181119131357.28648-1-wsa+renesas@sang-engineering.com>
 <20181122140255.32z7xi5o5aba6u5n@verge.net.au>
 <20181122140659.GB1070@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181122140659.GB1070@kunai>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 22, 2018 at 03:06:59PM +0100, Wolfram Sang wrote:
> 
> > > +#define TMIO_STAT_ALWAYS_SET_27	BIT(27) /* only known on R-Car 2+ so far */
> > 
> > The _27 seems to be odd to include in the name, but I assume it
> > was the least bad option you could come up with.
> 
> Yes :) I am open for better suggestions.

Simply dropping '_27' would be an improvement in my opinion.

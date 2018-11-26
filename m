Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58950 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbeKZTKb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 14:10:31 -0500
Date: Mon, 26 Nov 2018 09:17:07 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mmc: tmio: introduce mask for 'always 1' bits
Message-ID: <20181126081706.bv5st4hrfly2bdfm@verge.net.au>
References: <20181119131357.28648-1-wsa+renesas@sang-engineering.com>
 <20181122140255.32z7xi5o5aba6u5n@verge.net.au>
 <20181122140659.GB1070@kunai>
 <20181123125731.ysjtgl65uunelpul@verge.net.au>
 <20181123131538.GA1018@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181123131538.GA1018@kunai>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 23, 2018 at 02:15:38PM +0100, Wolfram Sang wrote:
> 
> > > > > +#define TMIO_STAT_ALWAYS_SET_27	BIT(27) /* only known on R-Car 2+ so far */
> > > > 
> > > > The _27 seems to be odd to include in the name, but I assume it
> > > > was the least bad option you could come up with.
> > > 
> > > Yes :) I am open for better suggestions.
> > 
> > Simply dropping '_27' would be an improvement in my opinion.
> 
> And if we get a second one later? Or make it a mask then?

Lets not spend too much time debating a better macro name.
But in my opinion we can cross the second bit bridge if
and when we reach it.

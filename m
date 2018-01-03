Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52695 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751778AbeACKTH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 05:19:07 -0500
Date: Wed, 3 Jan 2018 11:19:02 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-common: add GPIO
 extender
Message-ID: <20180103101902.4mbl34vkhrsxsoew@verge.net.au>
References: <20171221122136.17773-1-wsa+renesas@sang-engineering.com>
 <20171221122425.3uz5mquj2a3373gb@ninjato>
 <3d26f184-ed1a-0832-3c58-01a6173560e8@cogentembedded.com>
 <20171221123715.7xjyfx2zd5uznf5r@ninjato>
 <20180102094017.zguthef5gebofnbi@verge.net.au>
 <20180102104500.okz2szyhlxfdypeu@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180102104500.okz2szyhlxfdypeu@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 02, 2018 at 11:45:00AM +0100, Wolfram Sang wrote:
> 
> > > Well, it was not in renesas-drivers/sh-pfc-for-v4.16 which I used as a
> > > base for the SATA work which again is based on v4.15-rc1. But nice that
> > > it is upstream already, thanks for the heads up.
> > 
> > My tree is also based on v4.15-rc1, for now.
> > Is it safe to apply this patch without the dependency?
> 
> Yes, the driver will simply not bind (which is no regression, because
> this is a new node).

Thanks, understood.

I now see there is a v3. I'll let it sit for a little longer to see
if Geert wishes to review it.

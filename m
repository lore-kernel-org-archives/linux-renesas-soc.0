Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40715 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752812AbeABJkW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jan 2018 04:40:22 -0500
Date: Tue, 2 Jan 2018 10:40:18 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-common: add GPIO
 extender
Message-ID: <20180102094017.zguthef5gebofnbi@verge.net.au>
References: <20171221122136.17773-1-wsa+renesas@sang-engineering.com>
 <20171221122425.3uz5mquj2a3373gb@ninjato>
 <3d26f184-ed1a-0832-3c58-01a6173560e8@cogentembedded.com>
 <20171221123715.7xjyfx2zd5uznf5r@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171221123715.7xjyfx2zd5uznf5r@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 21, 2017 at 01:37:16PM +0100, Wolfram Sang wrote:
> 
> > > Forgot to say, this depends on 8a64e557f399090f5d1917b2f32a065da2b12be1
> > > ("gpio: pca953x: fix vendor prefix for PCA9654") which is in
> > > gpio/for-next already. I cherry-picked this commit and SATA still works.
> > 
> >    It's in Linus' (Torvalds!) tree for quite some time already. :-)
> 
> Well, it was not in renesas-drivers/sh-pfc-for-v4.16 which I used as a
> base for the SATA work which again is based on v4.15-rc1. But nice that
> it is upstream already, thanks for the heads up.

My tree is also based on v4.15-rc1, for now.
Is it safe to apply this patch without the dependency?

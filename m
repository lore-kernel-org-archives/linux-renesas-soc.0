Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48602 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752145AbdAZNdV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 08:33:21 -0500
Date: Thu, 26 Jan 2017 14:33:15 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170126133315.GA3371@verge.net.au>
References: <20170104173954.3135-1-wsa+renesas@sang-engineering.com>
 <20170112224353.GB1490@katana>
 <20170113083719.GE2269@verge.net.au>
 <20170113083928.GD1446@katana>
 <20170126100116.GC21851@verge.net.au>
 <20170126100355.GA1435@katana>
 <20170126102713.GA27721@verge.net.au>
 <20170126113657.GA2281@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170126113657.GA2281@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 12:36:57PM +0100, Wolfram Sang wrote:
> 
> > > Do you have the HS200 enablement patches in that branch? They are
> > > currently in -next.
> > 
> > I tried mmc/next (but didn't notice anything special there).
> > Which patches should I be looking for?
> 
> The series starting with 59c21074b582aa ("mmc: sh_mobile_sdhi: simplify
> accessing DT data") up to 8c81459fa8adec ("mmc: sh_mobile_sdhi: enable
> HS200").
> 
> Do you already fetch from Ulf's kernel.org tree? He switched away from
> the Linaro tree for MMC for a while. I only realized when he complained
> that he can't apply my patches.

Thanks, I had not realised that. I've pulled the kernel.org tree.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39889 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753386AbcHXHJT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2016 03:09:19 -0400
Date: Wed, 24 Aug 2016 09:09:14 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] ARM: shmobile: r8a7790: only use smp_init when SMP
 is selected
Message-ID: <20160824070913.GC17209@verge.net.au>
References: <1471020310-3028-1-git-send-email-wsa+renesas@sang-engineering.com>
 <20160817072059.GH8673@verge.net.au>
 <20160821211026.GA1847@tetsubishi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160821211026.GA1847@tetsubishi>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Aug 21, 2016 at 11:10:26PM +0200, Wolfram Sang wrote:
> Hi Simon,
> 
> > > We use the helper function which populates the smp_init pointer only in
> > > case of SMP.
> > > 
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > 
> > could you describe the motivation for this change in the changelog?
> 
> I am not sure what that could be. For me, it is pretty obvious that we
> should not call smp_init() in case of !SMP ?

Point taken. I have queued these up.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:53479 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752420AbcHUVKj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Aug 2016 17:10:39 -0400
Date: Sun, 21 Aug 2016 23:10:26 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] ARM: shmobile: r8a7790: only use smp_init when SMP
 is selected
Message-ID: <20160821211026.GA1847@tetsubishi>
References: <1471020310-3028-1-git-send-email-wsa+renesas@sang-engineering.com>
 <20160817072059.GH8673@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160817072059.GH8673@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

> > We use the helper function which populates the smp_init pointer only in
> > case of SMP.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> could you describe the motivation for this change in the changelog?

I am not sure what that could be. For me, it is pretty obvious that we
should not call smp_init() in case of !SMP ?

Regards,

   Wolfram

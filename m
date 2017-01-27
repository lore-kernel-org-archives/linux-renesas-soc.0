Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57814 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753970AbdA0HQY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 02:16:24 -0500
Date: Fri, 27 Jan 2017 07:33:30 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170127063327.GA13565@verge.net.au>
References: <CAMuHMdVQVX9T7kxo-akbJQdcTwV2hA4188T57KBMGVdCFYw3jA@mail.gmail.com>
 <20170126135453.GB2718@katana>
 <20170126140643.GA11104@verge.net.au>
 <20170126141656.GD2718@katana>
 <20170126152413.GA12534@verge.net.au>
 <20170126201702.6kb62spuvx6jgll2@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170126201702.6kb62spuvx6jgll2@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 09:17:02PM +0100, Wolfram Sang wrote:
> 
> > The problem I see is the following logged to the console
> > (which makes the console semi-unusable).
> > 
> > sh_mobile_sdhi ee140000.sd: timeout waiting for hardware interrupt (CMD13)
> 
> Just to make sure: with the HS200 enablement patches present?

Using renesas-next without mmc-next I see the problem above on the M3-W.
Using renesas-next with mmc-next I do not see the problem above.
Using v4.10-rc2 I also do not see the problem above.

So I believe we should delay the integration change, which is currently in
renesas-next, until the driver change in mmc-next hits Linus's tree.

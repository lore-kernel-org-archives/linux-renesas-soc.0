Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58647 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754261AbdA0I1G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 03:27:06 -0500
Date: Fri, 27 Jan 2017 09:16:08 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170127081608.GG21195@verge.net.au>
References: <CAMuHMdVQVX9T7kxo-akbJQdcTwV2hA4188T57KBMGVdCFYw3jA@mail.gmail.com>
 <20170126135453.GB2718@katana>
 <20170126140643.GA11104@verge.net.au>
 <20170126141656.GD2718@katana>
 <20170126152413.GA12534@verge.net.au>
 <20170126201702.6kb62spuvx6jgll2@ninjato>
 <20170127063327.GA13565@verge.net.au>
 <20170127072728.GA1473@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170127072728.GA1473@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 27, 2017 at 08:27:28AM +0100, Wolfram Sang wrote:
> 
> > Using renesas-next without mmc-next I see the problem above on the M3-W.
> > Using renesas-next with mmc-next I do not see the problem above.
> > Using v4.10-rc2 I also do not see the problem above.
> 
> OK. So there is no problem with the code, at least.
> 
> > So I believe we should delay the integration change, which is currently in
> > renesas-next, until the driver change in mmc-next hits Linus's tree.
> 
> Whatever you do, H3 and M3-W should be treated equally IMO.

Sure, that is reasonable. This is what I plan to do:

1. Drop this series from v4.11
2. Re-queue them for v4.12 once the driver changes hit an rc release
   - Please ping me one that happens

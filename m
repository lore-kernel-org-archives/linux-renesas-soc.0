Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42490 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbeISNwR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 09:52:17 -0400
Date: Wed, 19 Sep 2018 10:15:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Attach the SYS-DMAC to
 the IPMMU
Message-ID: <20180919081525.ubxvhewbspmnmgtk@verge.net.au>
References: <153717238926.32742.16468076576808713610.sendpatchset@octo>
 <20180917083907.j57ldjnxxhb6fji7@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180917083907.j57ldjnxxhb6fji7@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 17, 2018 at 10:39:08AM +0200, Simon Horman wrote:
> On Mon, Sep 17, 2018 at 05:19:49PM +0900, Magnus Damm wrote:
> > From: Magnus Damm <damm@opensource.se>
> > 
> > For R-Car E3 hook up SYS-DMAC0, SYS-DMAC1 and SYS-DMAC2 to
> > IPMMU-DS0 and IPMMU-DS1 in same way as for R-Car H3.
> > This follows the R-Car Gen3 Rev.1.00 (April 2018) datasheet.
> > 
> > Signed-off-by: Magnus Damm <damm@opensource.se>
> > ---
> > 
> >  Developed on top of renesas-devel-20180914-v4.19-rc3
> 
> Thanks Magnus,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again, applied for v4.20.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34603 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752437AbeF0PHl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 11:07:41 -0400
Date: Wed, 27 Jun 2018 17:07:37 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Remove non-existing STBE
 region
Message-ID: <20180627150736.zhhy3ir4g5232nik@verge.net.au>
References: <20180620135323.29225-1-geert+renesas@glider.be>
 <20180625093820.ssremmfpaqydn5un@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180625093820.ssremmfpaqydn5un@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 25, 2018 at 11:38:28AM +0200, Simon Horman wrote:
> On Wed, Jun 20, 2018 at 03:53:23PM +0200, Geert Uytterhoeven wrote:
> > R-Car E3 does not have the Stream Buffer for EtherAVB-IF (STBE).
> > 
> > Note that the RAVB driver does not use this region.
> > 
> > Fixes: 913a78b575c313b8 ("arm64: dts: renesas: r8a77990: Add EthernetAVB device nodes")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied.

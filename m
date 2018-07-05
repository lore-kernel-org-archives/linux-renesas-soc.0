Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53034 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753317AbeGEQCf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 12:02:35 -0400
Date: Thu, 5 Jul 2018 18:02:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: Prefer HSCIF1 over
 SCIF1
Message-ID: <20180705160230.l3dowru64kfn2p7n@verge.net.au>
References: <20180629145112.9329-1-geert+renesas@glider.be>
 <20180702125821.q4gpqs2uymx2onx3@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180702125821.q4gpqs2uymx2onx3@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 02, 2018 at 02:58:22PM +0200, Simon Horman wrote:
> On Fri, Jun 29, 2018 at 04:51:12PM +0200, Geert Uytterhoeven wrote:
> > HSCIF is superior to SCIF (larger FIFOs, more accurate and wider
> > supported range of bitrates).
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks again, applied.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45057 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388249AbeGXMcp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 08:32:45 -0400
Date: Tue, 24 Jul 2018 13:26:41 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: rcar: Correct SATA device sizes to 2 MiB
Message-ID: <20180724112640.ed3qexa2lxkw4voi@verge.net.au>
References: <20180720122857.30235-1-geert+renesas@glider.be>
 <20180723155132.6q35flyugzjrv3pg@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180723155132.6q35flyugzjrv3pg@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 23, 2018 at 05:51:33PM +0200, Simon Horman wrote:
> On Fri, Jul 20, 2018 at 02:28:57PM +0200, Geert Uytterhoeven wrote:
> > Update the SATA device nodes on R-Car H1, H2, and M2-W to use a 2 MiB
> > I/O space, as specified in Rev.1.0 of the R-Car H1 and R-Car Gen2
> > hardware user manuals.
> > 
> > See also commit e9f0089b2d8a3d45 ("arm64: dts: r8a7795: Correct SATA
> > device size to 2MiB").
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 

Thanks again, applied for v4.20.

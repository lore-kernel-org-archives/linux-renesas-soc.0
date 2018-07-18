Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48598 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726985AbeGRJY1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 05:24:27 -0400
Date: Wed, 18 Jul 2018 10:47:33 +0200
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: r8a77470: Use r8a77470-cpg-mssr binding
 definitions
Message-ID: <20180718084733.t4o7ueotufof4t6s@verge.net.au>
References: <20180717132549.28793-1-geert+renesas@glider.be>
 <OSBPR01MB2103E1E668881906DE6A2085B85C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103E1E668881906DE6A2085B85C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 17, 2018 at 01:38:51PM +0000, Biju Das wrote:
> Hi Geert,
> 
> Thanks for the patch.
> 
> > -----Original Message-----
> > From: Geert Uytterhoeven [mailto:geert+renesas@glider.be]
> > Sent: 17 July 2018 14:26
> > To: Simon Horman <horms@verge.net.au>; Magnus Damm
> > <magnus.damm@gmail.com>; Biju Das <biju.das@bp.renesas.com>
> > Cc: linux-renesas-soc@vger.kernel.org; Geert Uytterhoeven
> > <geert+renesas@glider.be>
> > Subject: [PATCH] ARM: dts: r8a77470: Use r8a77470-cpg-mssr binding
> > definitions
> >
> > Replace the hardcoded clock indices by R8A77470_CLK_* symbols.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Thanks, applied.

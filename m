Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46176 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388306AbeGXNWv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 09:22:51 -0400
Date: Tue, 24 Jul 2018 14:16:34 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: Attach the SYS-DMAC to
 the IPMMU
Message-ID: <20180724121633.rq2glex3gyiy46wu@verge.net.au>
References: <153199952510.10548.10726518369494565858.sendpatchset@little-apple>
 <CAMuHMdUAFcdKgr7yfH3-pUjqSddV0JyR_brOs2iepN+Opa99hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUAFcdKgr7yfH3-pUjqSddV0JyR_brOs2iepN+Opa99hQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 20, 2018 at 01:10:32PM +0200, Geert Uytterhoeven wrote:
> On Thu, Jul 19, 2018 at 1:23 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Hook up SYS-DMAC0, SYS-DMAC1 and SYS-DMAC2 to IPMMU-DS0 and IPMMU-DS1
> > following the R-Car Gen3 Rev.1.00 (April 2018) datasheet.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.20.

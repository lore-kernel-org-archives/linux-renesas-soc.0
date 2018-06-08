Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56589 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751117AbeFHIFS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 04:05:18 -0400
Date: Fri, 8 Jun 2018 10:05:13 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Make PM domain initialization
 more robust
Message-ID: <20180608080513.xm54eteql5v3mnwz@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFoVkWPDB=_KEFfCMhYs5r+SZxTHkaUYRfyAW-C_mqgkog@mail.gmail.com>
 <OSBPR01MB22939931CC2349CC441554C2D8640@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 07, 2018 at 04:33:07AM +0000, Yoshihiro Shimoda wrote:
> Hi Geert-san,
> 
> > From: Behalf Of Geert Uytterhoeven, Sent: Wednesday, June 6, 2018 5:58 PM
> > 
> > Hi Simon,
> > 
> > On Wed, Jun 6, 2018 at 10:52 AM, Simon Horman <horms@verge.net.au> wrote:
> > > On Tue, Jun 05, 2018 at 05:05:15PM +0200, Geert Uytterhoeven wrote:
> <snip>
> > > This looks fine to me but I will wait to see if there are other reviews
> > > before applying.
> > 
> > Let's wait for feedback from Shimoda-san. Perpaps the quirk did rely on
> > the buggy behavior.
> 
> I checked /sys/kernel/debug/pm_genpd/pm_genpd_summary.
> 
> < Before applies the patch >
>  - "3dg-b's" status is "off-0".
>  - "3dg-b" doesn't have any slaves.
> 
> < After applied the patch >
>  - "3dg-b's" status is "on".
>  - "3dg-b" has "3dg-a" slave.
> 
> So,
> 
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

On Thu, Jun 07, 2018 at 02:47:29PM +0200, Ulf Hansson wrote:
> On 5 June 2018 at 17:05, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > The quirk for R-Car E3 ES1.0 added in commit 086b399965a7ee7e ("soc:
> > renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}") makes the 3DG-A
> > PM domain a subdomain of the 3DG-B PM domain.  However, registering
> > 3DG-A with its parent fails silently, as the 3DG-B PM domain hasn't been
> > registered yet, and such failures are never reported.
> >
> > Fix this by:
> >   1. Splitting PM Domain initialization in two steps, so all PM domains
> >      are registered before any child-parent links are established,
> >   2. Reporting any failures in establishing child-parent relations.
> >
> > Check for and report pm_genpd_init() failures, too, as that function
> > gained a return value in commit 7eb231c337e00735 ("PM / Domains: Convert
> > pm_genpd_init() to return an error code").
> >
> > Fixes: 086b399965a7ee7e ("soc: renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>


Thanks everyone, applied as a fix for v4.18.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49129 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750920AbdGMIHW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 04:07:22 -0400
Date: Thu, 13 Jul 2017 10:07:18 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Paterson <chris.paterson2@renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] dt-bindings: mmc: sh_mmcif: Document r8a7743 DT
 bindings
Message-ID: <20170713080717.GJ5580@verge.net.au>
References: <1499853805-5915-1-git-send-email-chris.paterson2@renesas.com>
 <1499853805-5915-2-git-send-email-chris.paterson2@renesas.com>
 <CAMuHMdX0TZ7KKzGDq8t2jMwMciEf30KKW2tE5fieqJ2D7+feqw@mail.gmail.com>
 <20170713075459.GG5580@verge.net.au>
 <CAMuHMdXdkA-F74pYOMi=K2DMZJdkSCpJtzfHfSMTAQgAfzPUkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXdkA-F74pYOMi=K2DMZJdkSCpJtzfHfSMTAQgAfzPUkw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 10:00:11AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Jul 13, 2017 at 9:54 AM, Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Jul 12, 2017 at 01:20:07PM +0200, Geert Uytterhoeven wrote:
> >> On Wed, Jul 12, 2017 at 12:03 PM, Chris Paterson
> >> <chris.paterson2@renesas.com> wrote:
> >> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks, applied for v4.14.
> 
> Shouldn't this be applied by Ulf to the MMC tree?

Sorry, my bad. I have dropped this from the renesas tree.

Ulf, please consider this patch for the mmc tree.

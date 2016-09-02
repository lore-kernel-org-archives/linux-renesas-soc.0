Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36844 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750939AbcIBIRH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 04:17:07 -0400
Date: Fri, 2 Sep 2016 10:17:00 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>
Subject: Re: [PATCH] ARM: shmobile: fix regulator quirk for Gen2
Message-ID: <20160902081659.GA16669@verge.net.au>
References: <20160830145430.2182-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWdtVAY=4WiJWQfWtb5P71seANESm8tjLKpBboRwwJBMw@mail.gmail.com>
 <20160901142236.GG14300@verge.net.au>
 <20160901142723.GB4824@katana>
 <CAMuHMdWN2hH-Tw0YxkQxVA=F8woF2M9RpVAGWix83d5CK3TASA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWN2hH-Tw0YxkQxVA=F8woF2M9RpVAGWix83d5CK3TASA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 01, 2016 at 09:00:07PM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 1, 2016 at 4:27 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> > On Thu, Sep 01, 2016 at 04:22:37PM +0200, Simon Horman wrote:
> >> On Tue, Aug 30, 2016 at 05:15:58PM +0200, Geert Uytterhoeven wrote:
> >> > On Tue, Aug 30, 2016 at 4:54 PM, Wolfram Sang
> >> > <wsa+renesas@sang-engineering.com> wrote:
> >> > > The current implementation only works if the da9xxx devices are added
> >> > > before their drivers are registered. Only then it can apply the fixes to
> >> > > both devices. Otherwise, the driver for the first device gets probed
> >> > > before the fix for the second device can be applied. This is what
> >> > > fails when using the IP core switcher or when having the i2c master
> >> > > driver as a module.
> >> >
> >> > > So, we need to disable both da9xxx once we detected one of them. We now
> >> > > use i2c_transfer with hardcoded i2c_messages and device addresses, so we
> >> > > don't need the da9xxx client devices to be instantiated. Because the
> >> > > fixup is used on specific boards only, the addresses are not going to
> >> > > change.
> >> > >
> >> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> >
> >> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be> (r8a7791/koelsch)
> >>
> >> Can I get a Fixes tag or some indication of if it should apply
> >> to v4.9 or as a fix for v4.8.
> >
> > I'd say:
> >
> > Fixes: 663fbb52159cca ("ARM: shmobile: R-Car Gen2: Add da9063/da9210 regulator quirk")
> >
> > and should go to 4.8. Geert?
> 
> That's right. CC stable, for v4.1+ and any LTS(I) it's been backported to.

Thanks, got it.

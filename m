Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52709 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753135AbcIAOWn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 10:22:43 -0400
Date: Thu, 1 Sep 2016 16:22:37 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>
Subject: Re: [PATCH] ARM: shmobile: fix regulator quirk for Gen2
Message-ID: <20160901142236.GG14300@verge.net.au>
References: <20160830145430.2182-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWdtVAY=4WiJWQfWtb5P71seANESm8tjLKpBboRwwJBMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWdtVAY=4WiJWQfWtb5P71seANESm8tjLKpBboRwwJBMw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 30, 2016 at 05:15:58PM +0200, Geert Uytterhoeven wrote:
> Hi Wolfram,
> 
> On Tue, Aug 30, 2016 at 4:54 PM, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > The current implementation only works if the da9xxx devices are added
> > before their drivers are registered. Only then it can apply the fixes to
> > both devices. Otherwise, the driver for the first device gets probed
> > before the fix for the second device can be applied. This is what
> > fails when using the IP core switcher or when having the i2c master
> > driver as a module.
> 
> Thanks a lot!
> That could also happen when irqc is a victim of deferred probing.
> 
> > So, we need to disable both da9xxx once we detected one of them. We now
> > use i2c_transfer with hardcoded i2c_messages and device addresses, so we
> > don't need the da9xxx client devices to be instantiated. Because the
> > fixup is used on specific boards only, the addresses are not going to
> > change.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be> (r8a7791/koelsch)

Can I get a Fixes tag or some indication of if it should apply
to v4.9 or as a fix for v4.8.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43105 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751788AbdHXK5R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 06:57:17 -0400
Date: Thu, 24 Aug 2017 06:57:04 -0400
From: Simon Horman <horms@verge.net.au>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] GR-Peach DTS update
Message-ID: <20170824105704.GG27788@verge.net.au>
References: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
 <20170824105350.GD27788@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170824105350.GD27788@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 24, 2017 at 06:53:50AM -0400, Simon Horman wrote:
> On Thu, Aug 24, 2017 at 10:48:39AM +0200, Jacopo Mondi wrote:
> > Hello Simon,
> >    now that RZ/A1 pin controller is merged, it's time to enable some peripheral
> > devices on GR-Peach has it has been done for Genmai and RSK boards.
> > 
> > The series is based on Simon's "renesas-dt2-for-v4.14" tag release, so it should
> > be ideally applied after v4.14-rc1 is out, as it needs pin controller nodes to
> > be defined in r7s72100.dtsi.
> > 
> > Patch 2/4 enables EHTER interface, even if I've not been able to exchange any
> > traffic on that. I can set the ip address and probe the device and double
> > checked the pin configuration process against u-boot sources (where the
> > interface is working instead). Sending the patch anyway and let you decide what
> > to do with that.
> > 
> > Thanks
> >    j
> > 
> > Jacopo Mondi (4):
> >   arm: dts: gr-peach: Remove empty line
> >   arm: dts: gr-peach: Add SCIF2 pin group
> >   arm: dts: gr-peach: Add ETHER pin group
> >   arm: dts: gr-peach: Add user led device nodes
> 
> Thanks I have applied the 1st, 2nd and 4th (non-ETHER) patches above for v4.15.
> I am leaving the 3rd (ETHER) patch pending resolution of the review
> provided by Geert.

BTW, the prefix these patches should start with "ARM:".
I fixed this when applying the patches described above.

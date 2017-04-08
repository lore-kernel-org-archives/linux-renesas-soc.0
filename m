Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50613 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752385AbdDHNSo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Apr 2017 09:18:44 -0400
Date: Sat, 8 Apr 2017 09:18:39 -0400
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: Re: [PATCH 0/4] arm64: renesas: enable M3ULCB board peripherals
Message-ID: <20170408131839.GD20684@verge.net.au>
References: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1489788135.8957.2.camel@collabora.co.uk>
 <CAMuHMdX9caECvsBnfUQhbQKdW_uGJ_VXAUksMMXw7EAGP8QUCQ@mail.gmail.com>
 <20170407135212.GA24096@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170407135212.GA24096@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 07, 2017 at 09:52:13AM -0400, Simon Horman wrote:
> On Thu, Apr 06, 2017 at 11:53:45AM +0200, Geert Uytterhoeven wrote:
> > Hi Simon,
> > 
> > On Fri, Mar 17, 2017 at 11:02 PM, Sjoerd Simons
> > <sjoerd.simons@collabora.co.uk> wrote:
> > > On Thu, 2017-01-26 at 17:53 +0300, Vladimir Barinov wrote:
> > >> This adds the folowing:
> > >> - R8A7796 SoC based M3ULCB board peripherals
> > >>
> > >> Vladimir Barinov (4):
> > >> [1/4] arm64: dts: m3ulcb: enable I2C
> > >> [2/4] arm64: dts: m3ulcb: Update memory node to 2 GiB map
> 
> I have queued up the above two patches.
> > >> [3/4] arm64: dts: m3ulcb: enable EthernetAVB
> 
> Please update the above patch to reflect the changes made in
> ef3f08c83fd1 ("arm64: dts: r8a7796: salvator-x: Fix EthernetAVB PHY timing")
> 
> > >> [4/4] arm64: dts: m3ulcb: enable HS200 for eMMC
> 
> I will look at queuing this up in the near future
> with other HS200 enablement patches.

I have now done so; patches 1,2,4 are queued up for v4.13.

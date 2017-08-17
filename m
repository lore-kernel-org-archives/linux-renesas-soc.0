Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52180 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752031AbdHQIZo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2017 04:25:44 -0400
Date: Thu, 17 Aug 2017 10:25:42 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: r8a7796: add USB-DMAC and HSUSB device
 nodes
Message-ID: <20170817082542.GC27693@verge.net.au>
References: <1501763357-26075-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170804110026.GB9178@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170804110026.GB9178@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 04, 2017 at 01:00:27PM +0200, Simon Horman wrote:
> On Thu, Aug 03, 2017 at 09:29:15PM +0900, Yoshihiro Shimoda wrote:
> > This patch is based on the renesas.git / renesas-devel-20170731v2-v4.13-rc3 tag.
> > 
> > For usb-dmac, we should wait for the following patch (even if we don't apply
> > the patch, the usb-dmac driver can be probed correctly though.)
> >  https://patchwork.kernel.org/patch/9876639/
> > 
> > For hsusb, we need the "arm64: dts: r8a7796: add usb host device nodes" patch
> > set for using usb2_phy0.
> 
> Thanks, I am marking this series as deferred pending acceptance of
> the dependencies of "arm64: dts: r8a7796: add usb host device nodes".
> Please repost this series or otherwise ping me once those
> dependencies are in place.

The dependency is now in place and I have applied this series.

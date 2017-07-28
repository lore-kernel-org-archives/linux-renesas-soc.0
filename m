Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37176 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751796AbdG1IZe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2017 04:25:34 -0400
Date: Fri, 28 Jul 2017 10:25:13 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: renesas: r8a7795: salvator-xs: enable
 usb 2.0 channel 3
Message-ID: <20170728082512.GC7945@verge.net.au>
References: <1501068660-4032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170727152047.GI16143@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170727152047.GI16143@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 27, 2017 at 05:20:47PM +0200, Simon Horman wrote:
> On Wed, Jul 26, 2017 at 08:30:57PM +0900, Yoshihiro Shimoda wrote:
> > This patch is based on the renesas-drivers.git /
> > renesas-drivers-2017-07-18-v4.13-rc1 tag and
> > "pinctrl: sh-pfc: r8a7795: add usb2.0 on R-Car H3 ES2.0" patch set and
> > "arm64: dts: renesas: r8a7795: add usb2.0 for R-Car H3 ES2.0" patch set.
> > 
> > Yoshihiro Shimoda (3):
> >   arm64: dts: renesas: r8a7795: salvator-xs: enable usb2_phy ch3
> >   arm64: dts: renesas: r8a7795: salvator-xs: enable USB 2.0 channel 3
> >   arm64: dts: renesas: r8a7795: salvator-xs: enable HSUSB channel 3
> 
> Hi Shimoda-san,
> 
> I am marking these patches as deferred pending an Ack from Geert
> on the pfc changes. I assume that will not happen until after he comes
> back from holiday's. Let me know if that is going to be a problem.

Sorry, I forgot to mention. Assuming it is a not a problem please
repost or otherwise ping me once the dependencies are Acked by Geert.

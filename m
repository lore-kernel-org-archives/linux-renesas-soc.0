Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45517 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751031AbdK3J6E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 04:58:04 -0500
Date: Thu, 30 Nov 2017 10:58:00 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 0/3] arm64: dts: renesas: r8a77970: connect VIN to CSI40
Message-ID: <20171130095800.hz2di6ksk5x6yyfc@verge.net.au>
References: <20171126005012.22573-1-niklas.soderlund+renesas@ragnatech.se>
 <20171129095317.ha34kb5xkq6chqbt@verge.net.au>
 <20171129123208.GA22365@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171129123208.GA22365@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 29, 2017 at 01:32:08PM +0100, Niklas Söderlund wrote:
> Hi Simon,
> 
> On 2017-11-29 10:53:17 +0100, Simon Horman wrote:
> > On Sun, Nov 26, 2017 at 01:50:09AM +0100, Niklas Söderlund wrote:
> > > Hi,
> > > 
> > > This series describes how to connect VIN0-3 to CSI40 and the HDMI input 
> > > of the adv7482 on the expansion board. It is tested on V3M together with 
> > > V3M enablement for VIN and CSI-2 drivers on-top of Kieran's 
> > > renesas-drivers-next-v3m branch [1].
> > > 
> > > It works and it's possible to program the EDID and capture frame frames.  
> > > Remember to switch SW18 to the off position to route the CSI-2 bus to 
> > > the expansion board instead of the MAX9286 for GMSL input.
> > > 
> > > 1. git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
> > 
> > Hi Niklas,
> > 
> > how do you view the path to upstream of this patch-set?
> 
> I think there are a few things that needs to go upstream before this 
> set.
> 
> - The VIN and CSI-2 Gen3 driver support.
> - All or some of the V3M DT patches from renesas-drivers-next-v3m.
> 
> I would mark this as deferred as I expect some of the patches in 
> renesas-drivers-next-v3m needs more work and therefor this set also 
> needs to be updated before it's ready to go upstream.

Understood, I have marked them as deferred as you suggest.

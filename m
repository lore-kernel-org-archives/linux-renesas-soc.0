Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:46350 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751069AbdK2McM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 07:32:12 -0500
Received: by mail-lf0-f67.google.com with SMTP id r143so3643173lfe.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Nov 2017 04:32:12 -0800 (PST)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Wed, 29 Nov 2017 13:32:08 +0100
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 0/3] arm64: dts: renesas: r8a77970: connect VIN to CSI40
Message-ID: <20171129123208.GA22365@bigcity.dyn.berto.se>
References: <20171126005012.22573-1-niklas.soderlund+renesas@ragnatech.se>
 <20171129095317.ha34kb5xkq6chqbt@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171129095317.ha34kb5xkq6chqbt@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On 2017-11-29 10:53:17 +0100, Simon Horman wrote:
> On Sun, Nov 26, 2017 at 01:50:09AM +0100, Niklas S�derlund wrote:
> > Hi,
> > 
> > This series describes how to connect VIN0-3 to CSI40 and the HDMI input 
> > of the adv7482 on the expansion board. It is tested on V3M together with 
> > V3M enablement for VIN and CSI-2 drivers on-top of Kieran's 
> > renesas-drivers-next-v3m branch [1].
> > 
> > It works and it's possible to program the EDID and capture frame frames.  
> > Remember to switch SW18 to the off position to route the CSI-2 bus to 
> > the expansion board instead of the MAX9286 for GMSL input.
> > 
> > 1. git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
> 
> Hi Niklas,
> 
> how do you view the path to upstream of this patch-set?

I think there are a few things that needs to go upstream before this 
set.

- The VIN and CSI-2 Gen3 driver support.
- All or some of the V3M DT patches from renesas-drivers-next-v3m.

I would mark this as deferred as I expect some of the patches in 
renesas-drivers-next-v3m needs more work and therefor this set also 
needs to be updated before it's ready to go upstream.

-- 
Regards,
Niklas S�derlund

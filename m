Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59618 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752297AbdK2JxV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 04:53:21 -0500
Date: Wed, 29 Nov 2017 10:53:17 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 0/3] arm64: dts: renesas: r8a77970: connect VIN to CSI40
Message-ID: <20171129095317.ha34kb5xkq6chqbt@verge.net.au>
References: <20171126005012.22573-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171126005012.22573-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Nov 26, 2017 at 01:50:09AM +0100, Niklas Söderlund wrote:
> Hi,
> 
> This series describes how to connect VIN0-3 to CSI40 and the HDMI input 
> of the adv7482 on the expansion board. It is tested on V3M together with 
> V3M enablement for VIN and CSI-2 drivers on-top of Kieran's 
> renesas-drivers-next-v3m branch [1].
> 
> It works and it's possible to program the EDID and capture frame frames.  
> Remember to switch SW18 to the off position to route the CSI-2 bus to 
> the expansion board instead of the MAX9286 for GMSL input.
> 
> 1. git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git

Hi Niklas,

how do you view the path to upstream of this patch-set?

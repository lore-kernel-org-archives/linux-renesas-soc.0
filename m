Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51195 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424713AbeBOQWj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 11:22:39 -0500
Date: Thu, 15 Feb 2018 17:22:36 +0100
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: lager: Move cec_clock to root node
Message-ID: <20180215162235.hid2lj7r67w2taon@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180213140431.GC18618@bigcity.dyn.berto.se>
 <7974005.brYq9PAmLL@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 13, 2018 at 03:54:56PM +0200, Laurent Pinchart wrote:
> Hi Geert,
> 
> Thank you for the patch.
> 
> On Tuesday, 13 February 2018 15:40:45 EET Geert Uytterhoeven wrote:
> > cec-clock is a fixed clock generator that is not controlled by i2c-12
> > and thus should not be a child of the i2c-12 bus node. Rather, it should
> > be a child of the root node of the DT.
> > 
> > Fixes: c5aa87977626e778 ("ARM: dts: lager: Add CEC clock for HDMI
> > transmitter")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Tue, Feb 13, 2018 at 03:04:31PM +0100, Niklas Söderlund wrote:
> Hi Geert,
> 
> Thanks for your patch.
> 
> On 2018-02-13 14:40:45 +0100, Geert Uytterhoeven wrote:
> > cec-clock is a fixed clock generator that is not controlled by i2c-12
> > and thus should not be a child of the i2c-12 bus node. Rather, it should
> > be a child of the root node of the DT.
> > 
> > Fixes: c5aa87977626e778 ("ARM: dts: lager: Add CEC clock for HDMI transmitter")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks, applied.

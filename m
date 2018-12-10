Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40573 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbeLJLCo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 06:02:44 -0500
Date: Mon, 10 Dec 2018 12:02:39 +0100
From: Simon Horman <horms@verge.net.au>
To: jacopo mondi <jacopo@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: draak: Fix CVBS input
Message-ID: <20181210110239.k4ot5do3bue2rzsz@verge.net.au>
References: <20181210094355.15108-1-laurent.pinchart+renesas@ideasonboard.com>
 <20181210095601.GA5491@w540>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181210095601.GA5491@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 10, 2018 at 10:56:01AM +0100, jacopo mondi wrote:
> Hi Laurent,
> 
> On Mon, Dec 10, 2018 at 11:43:55AM +0200, Laurent Pinchart wrote:
> > A typo in the adv7180 DT node prevents successful probing of the VIN.
> > Fix it.
> 
> My bad, sorry about this. I tested the HDMI connection, and didn't
> notice this stupid error on the CVBS one.
> 
> >
> > Fixes: 6a0942c20f5c ("arm64: dts: renesas: draak: Describe CVBS input")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks, I have tentatively this as a fix for v4.20.

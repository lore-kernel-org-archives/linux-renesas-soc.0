Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36400 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbeIQM74 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 08:59:56 -0400
Date: Mon, 17 Sep 2018 09:33:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <uli@fpond.eu>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 12/16] arm64: dts: renesas: r8a77990: Add I2C device
 nodes
Message-ID: <20180917073342.nhqajf4o7jr4en5c@verge.net.au>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180914091046.483-13-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180914091046.483-13-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 14, 2018 at 12:10:42PM +0300, Laurent Pinchart wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> Add device nodes for I2C ch{0,1,2,3,4,5,6,7} to R-Car E3 R8A77990 device
> tree.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 123 ++++++++++++++++++++++++++++++
>  1 file changed, 123 insertions(+)

I believe this duplicates the following patch already queued-up for
v4.20.

Fixes: bc011dfa3065 ("arm64: dts: renesas: r8a77990: Add I2C device nodes")

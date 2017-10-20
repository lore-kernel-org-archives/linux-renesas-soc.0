Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37749 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751193AbdJTJ1h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 05:27:37 -0400
Date: Fri, 20 Oct 2017 11:27:18 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH LOCAL v2] arm64: defconfig: Add renesas_defconfig
Message-ID: <20171020092717.ejhavj72xgv3ybpn@verge.net.au>
References: <1508144925-14849-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1508144925-14849-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 16, 2017 at 11:08:45AM +0200, Geert Uytterhoeven wrote:
> Add a defconfig for Renesas R-Car Gen3 boards.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against renesas-devel-20171013-v4.14-rc4.
> Not intended for upstream merge.
> 
> Loosely based on arm64 defconfig, with support for non-Renesas SoCs and
> boards removed, and missing support added.
> 
> Simon, if you include this in your tree, I can add to renesas-drivers
> extra configuration for drivers that are in renesas-drivers, but not yet
> upstream.
> 
> People submitting topic branches for inclusion in renesas-drivers are
> encouraged to update renesas_defconfig where appropriate.

Thanks,

I have created a topic/renesas-defconfig branch to hold this
not-for-upstream config. I will include that in the devel branch
of the renesas tree for now on.

I do not plan to include it in the next branch at this time, as that branch
is included in linux-next and is for code targeted at upstream.

If you would like to refine the above then lets discuss.

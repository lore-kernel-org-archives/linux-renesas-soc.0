Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44498 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbeJQQwF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 12:52:05 -0400
Date: Wed, 17 Oct 2018 10:57:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: revise hsusb's reg size
Message-ID: <20181017085719.5ukyuml3ugmfdtmp@verge.net.au>
References: <1539669890-25719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539669890-25719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 16, 2018 at 03:04:50PM +0900, Yoshihiro Shimoda wrote:
> This patch revises the reg size of each hsusb device node for
> r8a7795, r8a7796 and r8a77965.
> 
> Reported-by: Biju Das <biju.das@bp.renesas.com>
> Fixes: d2422e108812 ("arm64: dts: r8a7795: Add HSUSB device node")
> Fixes: 4725f2b88057 ("arm64: dts: renesas: r8a7795: add hsusb ch3 device node")
> Fixes: b9535853777f ("arm64: dts: r8a7796: Add HSUSB device node")
> Fixes: 9e1b00a2ef43 ("arm64: dts: renesas: r8a77965: Add "reg" properties")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks Shimoda-san,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


Also, could you let me know if this has any run-time effect?
If so perhaps it should be treated as a fix for v4.20 rather than
a patch for v4.21.

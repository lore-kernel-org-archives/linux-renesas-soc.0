Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53197 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbdH3GoI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 02:44:08 -0400
Date: Wed, 30 Aug 2017 08:44:03 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: draak: Add serial console pins
Message-ID: <20170830064402.GB10398@verge.net.au>
References: <1503912370-20180-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503912370-20180-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 28, 2017 at 11:26:10AM +0200, Geert Uytterhoeven wrote:
> Add pin control for SCIF2.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be applied after v4.14-rc1, when commit 794a6711764658a1 ("pinctrl:
> sh-pfc: Initial R8A77995 PFC support") has hit mainline.
> 
> Else the serial console will fail, reporting (on earlycon):
> 
>     sh-sci e6e88000.serial: could not find pctldev for node /soc/pin-controller@e6060000/scif2, deferring probe

Thanks, please ping me once that has happened.
In the meantime I have marked this patch as deferred.

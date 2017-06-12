Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44467 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751969AbdFLJCA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2017 05:02:00 -0400
Date: Mon, 12 Jun 2017 11:01:50 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: salvator-x: Add missing index to PWM pinctrl
 subnode name
Message-ID: <20170612090149.GA15434@verge.net.au>
References: <1496929500-8551-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496929500-8551-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 08, 2017 at 03:45:00PM +0200, Geert Uytterhoeven wrote:
> R-Car Gen3 SoCs contain multiple PWM modules.  Hence to avoid conflicts,
> pinctrl subnodes for PWM should include indices referring to their
> instances.
> 
> Fixes: b33be33670217533 ("arm64: dts: salvator-x: Add panel backlight support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks. I have queued this up for v4.13 as it fixes a patch which
has been accepted by the ARM-SoC maintainers for v4.13.

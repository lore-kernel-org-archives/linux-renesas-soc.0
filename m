Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52091 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbeK3ViY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 16:38:24 -0500
Date: Fri, 30 Nov 2018 11:29:30 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: shmobile: R-Mobile: Move pm-rmobile to
 drivers/soc/renesas/
Message-ID: <20181130102929.cctoby2vxp7uv3ld@verge.net.au>
References: <20181129110931.11783-1-geert+renesas@glider.be>
 <20181129110931.11783-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129110931.11783-3-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 29, 2018 at 12:09:31PM +0100, Geert Uytterhoeven wrote:
> The pm-rmobile driver is really a driver for the System Controller
> (SYSC) found in R-Mobile SoCs.  An equivalent driver for R-Car SoCs is
> already located under drivers/soc/renesas/.
> 
> Hence move the pm-rmobile driver from arch/arm/mach-shmobile/ to
> drivers/soc/renesas/, and rename it to rmobile-sysc.
> 
> Enable compile-testing on non-ARM and non-R-Mobile SoCs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.

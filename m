Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55140 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932254AbeBUQRl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Feb 2018 11:17:41 -0500
Date: Wed, 21 Feb 2018 17:17:36 +0100
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: defconfig: Enable PWM and USB for R-Car
Message-ID: <20180221161735.ayz5s7yvmidpbd6i@verge.net.au>
References: <1519192636-21139-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519192636-21139-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 21, 2018 at 02:57:16PM +0900, Yoshihiro Shimoda wrote:
> Enables PWM controller, USB-DMAC that is used by HS-USB, USB 3.0
> peripheral controller and USB 3.0 PHY for R-Car SoCs.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.

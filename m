Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40497 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbeH3SzC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 14:55:02 -0400
Date: Thu, 30 Aug 2018 16:52:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: salvator-xs: Improve SATA switch
 settings comments
Message-ID: <20180830145225.y7tqdmdpzzdoe6r3@verge.net.au>
References: <20180830123807.19353-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180830123807.19353-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 30, 2018 at 02:38:07PM +0200, Geert Uytterhoeven wrote:
> The comments describing the non-default switch settings to use SATA are
> confusing: 'Off' refers to the switch position, not to the MD12 logic
> value, while the parentheses suggest otherwise.  Rephrase to fix this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks Geert, thanks Wolfram, applied for v4.20.

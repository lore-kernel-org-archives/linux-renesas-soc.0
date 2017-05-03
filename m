Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49217 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751014AbdECHD7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 May 2017 03:03:59 -0400
Date: Wed, 3 May 2017 09:03:54 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v6] arm64: dts: salvator-x: Add current sense amplifiers
Message-ID: <20170503070351.GB13576@verge.net.au>
References: <1493750773-7750-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493750773-7750-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 02, 2017 at 08:46:13PM +0200, Geert Uytterhoeven wrote:
> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Add device nodes for two Maxim max961x current sense amplifiers
> sensing VDD_08 and DVFS_08 lines.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> [geert: r8a7796-salvator-x.dts => salvator-x.dtsi]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v6:
>   - r8a7796-salvator-x.dts => salvator-x.dtsi

Thanks, queued up for v4.13.

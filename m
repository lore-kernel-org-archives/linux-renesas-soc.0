Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58819 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751834AbdC1MRD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 08:17:03 -0400
Date: Tue, 28 Mar 2017 14:16:38 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: r8a7795: salvator-x: Add current sense
 amplifiers
Message-ID: <20170328121633.GA20146@verge.net.au>
References: <1490694282-9439-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1490694282-9439-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 28, 2017 at 11:44:42AM +0200, Geert Uytterhoeven wrote:
> Add device nodes for two Maxim max961x current sense amplifiers
> sensing the VDD_0.8V and DVFS_0.8V lines.
> 
> Based on a patch for r8a7796-salvator-x.dts by Jacopo Mondi.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Pending acceptance of the maxim,max9611 DT bindings.

I have marked this as deferred accordingly.

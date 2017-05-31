Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43573 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751009AbdEaUEP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 May 2017 16:04:15 -0400
Date: Wed, 31 May 2017 22:04:10 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5] arm64: dts: r8a7795: h3ulcb: Add support for R-Car H3
 ES2.0
Message-ID: <20170531200410.GH22266@verge.net.au>
References: <1496217580-5628-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496217580-5628-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 31, 2017 at 09:59:40AM +0200, Geert Uytterhoeven wrote:
> Split off support for H3ULCB boards with the ES1.x revision of the R-Car
> H3 SoC into a separate file.  The main r8a7795-h3ulcb.dts file now
> corresponds to H3ULCB with R-Car H3 ES2.0 or later.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - Now also tested on H3ULCB with H3 ES2.0, so please apply.  Thanks!

Thanks, applied.

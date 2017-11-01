Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53797 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751840AbdKAIbH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Nov 2017 04:31:07 -0400
Date: Wed, 1 Nov 2017 09:31:03 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] arm64: dts: renesas: eagle: Add watchdog timer
 support
Message-ID: <20171101083102.aaaylqkfid7wigov@verge.net.au>
References: <1509378989-25069-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509378989-25069-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 30, 2017 at 04:56:26PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series adds support for the watchdog timer on R-Car V3M, and
> enables it on the Eagle development board.
> 
> This allows to use the watchdog timer to reset the board, until PSCI is
> enhanced to include such functionality.
> 
> Dependencies:
>   - renesas-devel-20171030-v4.14-rc7,
>   - "[PATCH] dt-bindings: watchdog: renesas-wdt: Add support for the
>      r8a77970 wdt", which is a trivial addition.

Thanks, I agree that binding change is trivial and furthermore I see
that its been heavily Acked. I have gone ahead and applied this series.

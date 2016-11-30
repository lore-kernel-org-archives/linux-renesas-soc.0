Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:65257 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751148AbcK3Ppq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 10:45:46 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: arm@kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [git pull] Renesas RZ/G1M and RZ/G1E CPG Core Clock Definitions
Date: Wed, 30 Nov 2016 16:45:03 +0100
Message-ID: <5238348.B92zWRuNkF@wuerfel>
In-Reply-To: <1479904798-12768-1-git-send-email-geert+renesas@glider.be>
References: <1479904798-12768-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, November 23, 2016 1:39:58 PM CET Geert Uytterhoeven wrote:
> Renesas RZ/G1M and RZ/G1E CPG Core Clock Definitions
> 
> This contains clock definitions shared by clock drivers and DTS files,
> and is provided as a dependency for the latter.
> 
> This has already been pulled by Stephen as part of a larger pull
> request, and is present in clk/clk-next, together with the corresponding
> clock drivers.
> 

Pulled into next/dt, thanks!

	Arnd

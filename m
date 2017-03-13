Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49477 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752665AbdCMJVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 05:21:44 -0400
Date: Mon, 13 Mar 2017 10:21:33 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/13] arm: dts: renesas: Tidy-up status
Message-ID: <20170313092132.GC19296@verge.net.au>
References: <1489151956-19270-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1489151956-19270-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 10, 2017 at 02:19:03PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series performs some cleanups on the Renesas DT source files:
>   - Patch 1 replaces "ok" by "okay" in statuses, as the latter is the
>     recommended form,
>   - Patches 2-13 drop superfluous status updates when overriding the
>     clock frequencies of fixed-frequency clocks, as they have already
>     been enabled in the SoC-specific DTS file.
> 
> Thanks!

Thanks, applied.

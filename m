Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51846 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934828AbeE2O3Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 May 2018 10:29:24 -0400
Date: Tue, 29 May 2018 14:40:15 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: Use r8a77965-cpg-mssr
 binding definitions
Message-ID: <20180529124014.kduaibb4tsbbixgu@verge.net.au>
References: <1527513329-18780-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527513329-18780-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 28, 2018 at 03:15:29PM +0200, Geert Uytterhoeven wrote:
> Replace the hardcoded clock indices by R8A77965_CLK_* symbols.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Commit 7ce36da900c0a2ff ("clk: renesas: cpg-mssr: Add support for R-Car
> M3-N") providing the definitions is in v4.17-rc1.

This looks fine but I will wait to see if there are other reviews before
applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52116 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753319AbcKWOX3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 09:23:29 -0500
Date: Wed, 23 Nov 2016 15:23:23 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: r8a7796: Add all MSIOF nodes
Message-ID: <20161123142322.GE9057@verge.net.au>
References: <1479749213-13744-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479749213-13744-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 21, 2016 at 06:26:53PM +0100, Geert Uytterhoeven wrote:
> Add the device nodes for all MSIOF SPI controllers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested with MSIOF2(B) on EXIO connector D of r8a7796/salvator-x, using
> spidev, gpio-74x164, and a logic analyzer.

Thanks, I have queued this up for v4.11.

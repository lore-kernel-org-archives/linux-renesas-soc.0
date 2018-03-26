Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45027 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750973AbeCZIt0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Mar 2018 04:49:26 -0400
Date: Mon, 26 Mar 2018 10:49:22 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77965: Add all MSIOF device
 nodes
Message-ID: <20180326084921.srkxhjh7uk5ziuss@verge.net.au>
References: <1521796749-26376-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521796749-26376-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 23, 2018 at 10:19:09AM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> Add the device nodes for all MSIOF SPI controllers.
> 
> Based on several similar patches of the R8A7796 device tree
> by Geert Uytterhoeven <geert+renesas@glider.be>
> and Simon Horman <horms+renesas@verge.net.au>.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Use numerical power domain indices for initial r8a77965.dtsi]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.

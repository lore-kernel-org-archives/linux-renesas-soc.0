Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52325 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbeHaRoU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 13:44:20 -0400
Date: Fri, 31 Aug 2018 15:36:45 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Use CPG/MSSR and SYSC
 binding definitions
Message-ID: <20180831133644.geqsvpgb4xlyfgmf@verge.net.au>
References: <20180830145220.6708-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180830145220.6708-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 30, 2018 at 04:52:20PM +0200, Geert Uytterhoeven wrote:
> Use the SoC-specific CPG/MSSR include file to allow future use of
> R8A77990_CLK_* symbols.
> Replace the hardcoded power domain indices by R8A77990_PD_* symbols.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert, applied for v4.20.

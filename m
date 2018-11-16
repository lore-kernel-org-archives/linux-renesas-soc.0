Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48478 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbeKQA4b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 19:56:31 -0500
Date: Fri, 16 Nov 2018 06:43:48 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: shmobile: Hide ARCH_RZN1 to improve consistency
Message-ID: <20181116144347.swzwn6io5vo4jv23@verge.net.au>
References: <20181116133803.24202-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181116133803.24202-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 16, 2018 at 02:38:03PM +0100, Geert Uytterhoeven wrote:
> Unlike all other family-specific Kconfig symbols for Renesas ARM SoCs,
> ARCH_RZN1 is user-visible.  As this symbol is already selected by the
> SoC-specific ARCH_R9A06G032 symbol, there is no need for that.
> 
> Hide ARCH_RZN1 from the user, and move it up, where all other
> family-specific Kconfig symbols live.  Drop the select of CPU_V7, as
> this is already implied by the dependency of ARCH_RENESAS on
> ARCH_MULTI_V7.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert,

applied for v4.21.

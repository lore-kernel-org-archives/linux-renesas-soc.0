Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40005 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729078AbeH3SNa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 14:13:30 -0400
Date: Thu, 30 Aug 2018 16:11:07 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] [LOCAL] arm64: renesas_defconfig: Enable CRYPTO_DEV_CCREE
Message-ID: <20180830141106.uxe3t36ic2u4xfpx@verge.net.au>
References: <20180828144752.10408-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180828144752.10408-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 28, 2018 at 04:47:52PM +0200, Geert Uytterhoeven wrote:
> Enable support for the CryptoCell core present in some R-Car Gen3 SoCs,
> which allows to offload crypto operations.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

I have applied this to the topic/renesas-defconfig branch which is included
in the devel branch and tags of the Renesas tree as a convenience to
developers.  The branch is not, however, included in the next branch or
tags nor is it targeted at upstream.

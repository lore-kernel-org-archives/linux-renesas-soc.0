Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58713 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750760AbdK2IYR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 03:24:17 -0500
Date: Wed, 29 Nov 2017 09:24:13 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/LOCAL] arm64: defconfig: Refresh renesas_defconfig
Message-ID: <20171129082412.wpokzlakgpwscme7@verge.net.au>
References: <1511876145-8355-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511876145-8355-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 28, 2017 at 02:35:45PM +0100, Geert Uytterhoeven wrote:
> RC_CORE defaults to n again since commit 5573d124292a01af ("[media]
> media: default for RC_CORE should be n").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/configs/renesas_defconfig | 1 -
>  1 file changed, 1 deletion(-)

Thanks, I have rebased the topic/renesas-defconfig branch on v4.15-rc1
and applied this on top.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37628 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750798AbeAPJMH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 04:12:07 -0500
Date: Tue, 16 Jan 2018 10:12:03 +0100
From: Simon Horman <horms@verge.net.au>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, geert@glider.be
Subject: Re: [PATCH] [LOCAL] arm64: renesas_defconfig: Use a default 128MB of
 CMA
Message-ID: <20180116091203.mn54twa4ovfzyuya@verge.net.au>
References: <1516021154-17400-1-git-send-email-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516021154-17400-1-git-send-email-kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jan 15, 2018 at 12:59:16PM +0000, Kieran Bingham wrote:
> Our media tests frequently need large areas of CMA.
> Define the default allocation to be 128 MBytes to support
> larger use-cases.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> 
> v1.1
>  - Collected Laurent's Acked-by

Thanks, I have applied this to the topic/renesas-defconfig branch which is
included in the devel branch and tags of the Renesas tree as a convenience
to developers.  The branch is not, however, included in the next branch or
tags nor is it targeted at upstream.

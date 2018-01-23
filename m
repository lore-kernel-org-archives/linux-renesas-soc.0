Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39413 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751237AbeAWKaX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jan 2018 05:30:23 -0500
Date: Tue, 23 Jan 2018 11:30:17 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: renesas_defconfig: add driver for PCA9654
Message-ID: <20180123103015.rtuj7kcadiq7h2rh@verge.net.au>
References: <20180119113852.1894-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180119113852.1894-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 19, 2018 at 12:38:52PM +0100, Wolfram Sang wrote:
> We enabled it in the DTS, so we should have it here, too.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, I have applied this to the topic/renesas-defconfig branch which is
included in the devel branch and tags of the Renesas tree as a convenience
to developers.  The branch is not, however, included in the next branch or
tags nor is it targeted at upstream.

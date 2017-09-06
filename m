Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47542 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751836AbdIFI06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 04:26:58 -0400
Date: Wed, 6 Sep 2017 10:26:39 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: alt: use correct logic for SD WP pins
Message-ID: <20170906082639.GC10048@verge.net.au>
References: <20170905172631.31083-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170905172631.31083-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 05, 2017 at 07:26:31PM +0200, Wolfram Sang wrote:
> The WP pins are ACTIVE_HIGH, fix it in the DTS.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, I applied this for v4.15 with:

Fixes: 2b41091b896b ("ARM: dts: alt: add SDHI0 and 1 support")

Let me know if you'd prefer it to be handled as a fix for v4.14.
If the tag above is correct then it looks like this problem
has been present since v4.9.

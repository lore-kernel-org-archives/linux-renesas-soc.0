Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:36590 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726417AbeJOAX5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 14 Oct 2018 20:23:57 -0400
Date: Sun, 14 Oct 2018 18:42:18 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulrich Hecht <uli+renesas@fpond.eu>
Cc: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH] serial: sh-sci: do not warn if DMA transfers are not
 supported
Message-ID: <20181014164218.GA3028@kunai>
References: <1539352069-1028-1-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539352069-1028-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 12, 2018 at 03:47:49PM +0200, Ulrich Hecht wrote:
> Not all (H)SCIF devices support DMA, and failure to set it up is not
> normally a cause for concern. This patch demotes the associated warning to
> debug output.
> 
> Inspired by BSP patch "sci: sh-sci: Fix transfer sequence of unsupport DMA
> transfer" (6beb1f98d3bd30) by Hiromitsu Yamasaki.
> 
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

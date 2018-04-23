Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45034 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754842AbeDWKtN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Apr 2018 06:49:13 -0400
Date: Mon, 23 Apr 2018 12:49:09 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: shmobile: Disable CONFIG_FB_SH_MOBILE_MERAM
Message-ID: <20180423104909.6eaa4dcihhhk4vnv@verge.net.au>
References: <1524230141-7612-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524230141-7612-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 20, 2018 at 03:15:39PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> The last Renesas ARM platform using this driver was removed in commit
> a521422ea4ae6128 ("ARM: shmobile: mackerel: Remove Legacy C board
> code"), hence CONFIG_FB_SH_MOBILE_MERAM can be disabled.
> 
> Thanks!

Thanks, applied.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38462 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752071AbdDCKf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 06:35:27 -0400
Date: Mon, 3 Apr 2017 06:35:23 -0400
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: koelsch: Correct clock frequency of X2 DU
 clock input
Message-ID: <20170403103522.GK31988@verge.net.au>
References: <1491213319-7668-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1491213319-7668-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 03, 2017 at 11:55:19AM +0200, Geert Uytterhoeven wrote:
> The X2 crystal oscillator on the Koelsch development board provides a
> 74.25 MHz clock, not a 148.5 MHz clock.
> 
> Fixes: cd21cb46e14aae3a ("ARM: shmobile: koelsch: Add DU external pixel clocks to DT")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Confirmed by schematics, user manual, and physical inspection of 2
> Koelsch instances (my scope has not enough bandwidth to measure the
> actual frequency).
> 
> Probably this was copied from r8a7790-lager.dts, as Lager does have two
> identical crystal oscillators X2 and X13.
> 
> Note that X2 is socketed, so it can be changed.

Thanks, I have queued this up.

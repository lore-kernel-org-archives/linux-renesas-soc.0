Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45110 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752329AbeB1N0N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Feb 2018 08:26:13 -0500
Date: Wed, 28 Feb 2018 14:26:10 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: Fix error check in regulator
 quirk
Message-ID: <20180228132609.3u6l7rg3pnloq4br@verge.net.au>
References: <1519809180-6522-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519809180-6522-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 28, 2018 at 10:13:00AM +0100, Geert Uytterhoeven wrote:
> On systems with two regulators, a bogus error message is printed on
> success:
> 
>     i2c 6-0058: i2c error 2
> 
> While adding support for Stout, the number of messages to send was
> made variable, but the corresponding return value check of
> i2c_transfer() wasn't updated.
> 
> Fixes: ff938cd14d67a704 ("ARM: shmobile: stout: enable R-Car Gen2 regulator quirk")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51461 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750792AbcKIHeO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Nov 2016 02:34:14 -0500
Date: Wed, 9 Nov 2016 08:34:06 +0100
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Shinobu Uehara <shinobu.uehara.xc@renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: r8a7794: Correct hsusb parent clock
Message-ID: <20161109073406.GA30093@verge.net.au>
References: <1478545627-32280-1-git-send-email-geert+renesas@glider.be>
 <HK2PR06MB0548F5A24A6C6BBB7BB4C024D8A60@HK2PR06MB0548.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK2PR06MB0548F5A24A6C6BBB7BB4C024D8A60@HK2PR06MB0548.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 08, 2016 at 12:16:17PM +0000, Yoshihiro Shimoda wrote:
> Hi Geert-san,
> 
> > -----Original Message-----
> > From: Geert Uytterhoeven
> > Sent: Tuesday, November 08, 2016 4:07 AM
> > 
> > The parent clock of the HSUSB clock is the HP clock, not the MP clock.
> > 
> > Fixes: c7bab9f929e51761 ("ARM: shmobile: r8a7794: Add USB clocks to device tree")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thank you for the patch.
> 
> Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks, I have queued this up.

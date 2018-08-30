Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40331 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbeH3Sny (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 14:43:54 -0400
Date: Thu, 30 Aug 2018 16:41:22 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: Fix HS-USB compatible
Message-ID: <20180830144121.iiambdyg3xam4vj2@verge.net.au>
References: <20180828135702.3748-1-geert+renesas@glider.be>
 <OSBPR01MB22935B8A7C939E2E185CA868D8080@OSBPR01MB2293.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB22935B8A7C939E2E185CA868D8080@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 30, 2018 at 03:04:06AM +0000, Yoshihiro Shimoda wrote:
> Hi Geert-san,
> 
> > From: Geert Uytterhoeven, Sent: Tuesday, August 28, 2018 10:57 PM
> > 
> > Should be "renesas,usbhs-r8a77965", not "renesas,usbhs-r8a7796".
> > 
> > Fixes: a06e8af801760a98 ("arm64: dts: renesas: r8a77965: add HS-USB node")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thank you for the patch!
> 
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks Geert, thanks Shimoda-san, applied for v4.20.

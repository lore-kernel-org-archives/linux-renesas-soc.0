Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40370 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729785AbeH3SrU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 14:47:20 -0400
Date: Thu, 30 Aug 2018 16:44:47 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: Fix clock/reset for
 usb2_phy1
Message-ID: <20180830144446.26ndpzc7sycstyzs@verge.net.au>
References: <20180828141327.6916-1-geert+renesas@glider.be>
 <OSBPR01MB22938CB79DF68D66A40D7E9DD8080@OSBPR01MB2293.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB22938CB79DF68D66A40D7E9DD8080@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 30, 2018 at 03:04:48AM +0000, Yoshihiro Shimoda wrote:
> Hi Geert-san,
> 
> > From: Geert Uytterhoeven, Sent: Tuesday, August 28, 2018 11:13 PM
> > 
> > usb2_phy1 accidentally uses the same clock/reset as usb2_phy0.
> > 
> > Fixes: b5857630a829a8d5 ("arm64: dts: renesas: r8a77965: add usb2_phy nodes")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thank you for the patch!
> 
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks Geert, thanks Shimoda-san, applied for v4.20.

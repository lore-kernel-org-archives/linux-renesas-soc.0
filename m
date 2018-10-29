Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42288 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727565AbeJ3A6Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 20:58:24 -0400
Date: Mon, 29 Oct 2018 17:09:05 +0100
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: renesas: add/enable USB2.0 peripheral for
 R-Car [DE]3
Message-ID: <20181029160859.v26w4fr73mpnthf5@verge.net.au>
References: <1540369953-4097-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540369953-4097-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 24, 2018 at 05:32:33PM +0900, Yoshihiro Shimoda wrote:
> This patch adds/enables USB2.0 peripheral for R-Car [DE]3 boards.
> 
> R-Car E3 Ebisu board connects the ID pin to the SoC, so this adds
> a group "usb0_id" into usb0_pins node. Also, to use SW15 pin 3 side,
> this patch adds vbus0_usb2 node on r8a77990-ebisu.dts.
> 
> R-Car D3 Draak board doesn't connect the ID pin, so this adds
> "renesas,no-otg-pins" property into usb2_phy0 node.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Changed from v2:
>  - Use otg pin on r8a77990-ebisu board. So, I revise the commit log.
>  - I got Reviewed-by from Simon-san at v2. However, since I change
>    the integration at v3 as above. I didn't add Reviewed-by on this.
> 
> Changed from v1:
>  - Revise the reg size for each hsusb node.

Thanks, applied for v4.21.

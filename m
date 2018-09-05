Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38583 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbeIEPDH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 11:03:07 -0400
Date: Wed, 5 Sep 2018 12:33:27 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: revise properties for usb 2.0
Message-ID: <20180905103326.lsn57rilweolpews@verge.net.au>
References: <1535703651-5152-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535703651-5152-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 31, 2018 at 05:20:51PM +0900, Yoshihiro Shimoda wrote:
> R-Car Gen3 needs to enable/deassert clocks/resets of both usb 2.0
> host (included phy) and peripheral. Otherwise, other side device
> cannot work correctly. So, this patch revises properties of clocks
> and resets. After that, each device driver can enable/deassert
> clocks/resets by its self.
> 
> Notes:
>  - To work the renesas_usbhs driver correctly when host side drivers
>    are disabled and the renesas_usbhs driver doesn't have multiple
>    clock management, this patch doesn't change the order of the clocks
>    property in each hsusb node.
>  - This patch doesn't have any side-effects even if the renesas_usbhs
>    driver doesn't have reset_control and multiple clock management.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks Shimoda-san,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

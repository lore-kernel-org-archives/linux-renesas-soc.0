Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35605 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727588AbeIYNZp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Sep 2018 09:25:45 -0400
Date: Tue, 25 Sep 2018 09:19:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: renesas: revise properties for R-Car Gen3
 SoCs' usb 2.0
Message-ID: <20180925071930.yvfnxfnc2da4cnqx@verge.net.au>
References: <1537516457-20421-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537516457-20421-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 21, 2018 at 04:54:17PM +0900, Yoshihiro Shimoda wrote:
> R-Car Gen3 SoCs need to enable/deassert clocks/resets of both usb 2.0
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
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks Shimoda-san,

applied for v4.20.

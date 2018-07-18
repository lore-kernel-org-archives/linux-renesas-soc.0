Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49469 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729095AbeGRKC5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 06:02:57 -0400
Date: Wed, 18 Jul 2018 11:25:54 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Enable USB3.0 host for
 Ebisu board
Message-ID: <20180718092553.rz7crbwl3mpqwlaz@verge.net.au>
References: <1531889654-24918-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531889654-24918-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 18, 2018 at 01:54:14PM +0900, Yoshihiro Shimoda wrote:
> This patch adds and USB3.0 host device node and enable it for
> R-Car E3 Ebisu board.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  - The dt-binding for usb-xhci has already been merged into linux-next:
> 
>  https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/Documentation/devicetree/bindings/usb/usb-xhci.txt?h=next-20180717&id=4eb44f69e77141992e305d9e75e021b196071cdd
> 
>  - However, peripheral side is not yet (because the spec is not the same
>    with other SoCs a little, so I need to modify the driver). So, I don't
>    add "usb3_peri0" for now.
> 
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 12 ++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 11 +++++++++++
>  2 files changed, 23 insertions(+)

Thanks Shimoda-san,

applied.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53016 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751920AbeCTQMK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 12:12:10 -0400
Date: Tue, 20 Mar 2018 17:12:04 +0100
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: renesas: r8a77965: add usb related nodes
Message-ID: <20180320161204.7vqsiukgvv7uyn6t@verge.net.au>
References: <1521462507-23287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521462507-23287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 19, 2018 at 09:28:20PM +0900, Yoshihiro Shimoda wrote:
> All dt-bindings exist on next-20180319. Since Renesas tree closed for
> v4.17, this patch set should be for v4.18.
> 
> Yoshihiro Shimoda (7):
>   arm64: dts: renesas: r8a77965: add usb2_phy nodes
>   arm64: dts: renesas: r8a77965: add usb3_phy node
>   arm64: dts: renesas: r8a77965: add USB 2.0 host nodes
>   arm64: dts: renesas: r8a77965: add usb_dmac nodes
>   arm64: dts: renesas: r8a77965: add HS-USB node
>   arm64: dts: renesas: r8a77965: add USB 3.0 host node
>   arm64: dts: renesas: r8a77965: add USB 3.0 peripheral node
> 
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 122 +++++++++++++++++++++++++++---
>  1 file changed, 112 insertions(+), 10 deletions(-)

Thanks, applied.

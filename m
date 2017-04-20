Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57437 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937926AbdDTLuk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 07:50:40 -0400
Date: Thu, 20 Apr 2017 20:50:34 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: r8a7796: salvator-x: Set drive-strength for
 ravb pins
Message-ID: <20170420115033.GP3760@verge.net.au>
References: <1492681847-20190-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1492681847-20190-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 20, 2017 at 11:50:47AM +0200, Geert Uytterhoeven wrote:
> The EthernetAVB should not depend on the bootloader to setup correct
> drive-strength values.  Values for drive-strength where found by
> examining the registers after the bootloader has configured the
> registers and successfully used the EthernetAVB.
> 
> Based on commit 7d73a4da2681dc5d ("arm64: dts: r8a7795: salvator-x: Set
> drive-strength for ravb pins").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> While technically this depends on "pinctrl: sh-pfc: r8a7796: Add group
> for AVB MDIO and MII pins", and despite a scary message if that patch
> hasn't been applied:
> 
>     sh-pfc e6060000.pin-controller: invalid group "avb_mii" for function "avb"
> 
> Ethernet still works fine without it.

Thanks, I have queued this up.

It looks like we also need to consider something like this for [hm]3ulcb.

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44939 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727292AbeGMHfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 03:35:52 -0400
Date: Fri, 13 Jul 2018 09:22:28 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: host: xhci-rcar: Add a condition check about
 PLL active
Message-ID: <20180713072227.dhqrmrwul5dtlf2r@verge.net.au>
References: <1530614818-7634-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1530614818-7634-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530614818-7634-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 03, 2018 at 07:46:58PM +0900, Yoshihiro Shimoda wrote:
> This patch adds a condition check about the PLL acvice of this

Should "acvise" be "device" ?

> controller. Otherwise, the controller might cause hang when
> any USB clocks are not supplied yet and accesses the xHCI registers.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

The above nit notwithstanding:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

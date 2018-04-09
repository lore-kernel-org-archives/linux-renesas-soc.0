Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55713 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751589AbeDILwr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Apr 2018 07:52:47 -0400
Date: Mon, 9 Apr 2018 13:52:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 3/4] usb: gadget: udc: renesas_usb3: should call
 pm_runtime_enable() before add udc
Message-ID: <20180409115243.l3hwgczjthezen62@verge.net.au>
References: <1522671694-10229-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1522671694-10229-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522671694-10229-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 02, 2018 at 09:21:33PM +0900, Yoshihiro Shimoda wrote:
> This patch fixes an issue that this driver causes panic if a gadget
> driver is already loaded because usb_add_gadget_udc() might call
> renesas_usb3_start() via .udc_start, and then pm_runtime_get_sync()
> in renesas_usb3_start() doesn't work correctly.
> Note that the usb3_to_dev() macro should not be called at this timing
> because the macro uses the gadget structure.
> 
> Fixes: cf06df3fae28 ("usb: gadget: udc: renesas_usb3: move pm_runtime_{en,dis}able()")
> Cc: <stable@vger.kernel.org> # v4.15+
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

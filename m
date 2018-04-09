Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55680 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751863AbeDILtF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Apr 2018 07:49:05 -0400
Date: Mon, 9 Apr 2018 13:49:01 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 1/4] usb: gadget: udc: renesas_usb3: fix double phy_put()
Message-ID: <20180409114900.e5opyh3zxt7qkkrc@verge.net.au>
References: <1522671694-10229-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1522671694-10229-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522671694-10229-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 02, 2018 at 09:21:31PM +0900, Yoshihiro Shimoda wrote:
> This patch fixes an issue that this driver cause double phy_put()
> calling. This driver must not call phy_put() in the remove because
> the driver calls devm_phy_get() in the probe.
> 
> Fixes: 279d4bc64060 ("usb: gadget: udc: renesas_usb3: add support for generic phy")
> Cc: <stable@vger.kernel.org> # v4.15+
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

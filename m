Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55705 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751524AbeDILvh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Apr 2018 07:51:37 -0400
Date: Mon, 9 Apr 2018 13:51:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: gadget: udc: renesas_usb3: should remove debugfs
Message-ID: <20180409115129.3qvklt7y74uwrxxb@verge.net.au>
References: <1522671694-10229-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1522671694-10229-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522671694-10229-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 02, 2018 at 09:21:32PM +0900, Yoshihiro Shimoda wrote:
> This patch fixes an issue that this driver doesn't remove its debugfs.
> 
> Fixes: 43ba968b00ea ("usb: gadget: udc: renesas_usb3: add debugfs to set the b-device mode")
> Cc: <stable@vger.kernel.org> # v4.14+
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

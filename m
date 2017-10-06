Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:34169 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751862AbdJFRbl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Oct 2017 13:31:41 -0400
Date: Fri, 6 Oct 2017 12:31:34 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: gadget: udc: renesas_usb3: add support for
 generic phy
Message-ID: <20171006173134.p47olvf3d3odndi4@rob-hp-laptop>
References: <1506685501-24988-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1506685501-24988-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506685501-24988-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 29, 2017 at 08:45:01PM +0900, Yoshihiro Shimoda wrote:
> This patch adds support for generic phy as an optional. If you want
> to use a generic phy (e.g. phy-rcar-gen3-usb3 driver) on this driver,
> you have to do "insmod phy-rcar-gen3-usb3.ko" first for now.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/usb/renesas_usb3.txt       |  4 ++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/usb/gadget/udc/renesas_usb3.c              | 26 ++++++++++++++++++++--
>  2 files changed, 28 insertions(+), 2 deletions(-)

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:16181 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750707AbdC1MGF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 08:06:05 -0400
From: Felipe Balbi <balbi@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/4] usb: gadget: udc: renesas_usb3: add sysfs "role" to set "b-device" mode
In-Reply-To: <1490702004-8167-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1490702004-8167-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1490702004-8167-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Tue, 28 Mar 2017 15:06:00 +0300
Message-ID: <87efxhhahj.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Hi,

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> Sadly, to change the role ("host" and "peripheral") of USB3.0 DRD
> controller on R-Car Gen3, software has to set the DRD_CON register
> which is included in a usb3.0 peripheral controler's register.
> To simply implementation, the previous code always set peripheral mode
> as hardcoded. However, to support usb role swap in the future,
> the hardcoded is not good. So, this patch adds sysfs "role" to set
> the mode by a user.
> After applied this patch, since the DRD controller will act as host
> mode after probed, a user needs to change the mode via the sysfs.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

in patch 3, you add extcon to monitor ID and VBUS pins. Do you really
need this sysfs file at all?

-- 
balbi

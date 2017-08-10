Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:2127 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751373AbdHJLE2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Aug 2017 07:04:28 -0400
Subject: Re: [PATCH 0/3] usb: host: xhci: {plat,rcar}: add support for R-Car
 H3 ES2.0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org
References: <1500899413-28565-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <598C3E84.4090405@linux.intel.com>
Date: Thu, 10 Aug 2017 14:07:48 +0300
MIME-Version: 1.0
In-Reply-To: <1500899413-28565-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 24.07.2017 15:30, Yoshihiro Shimoda wrote:
> This patch set is based on the latest Greg's usb.git / usb-next branch
> (the commit id = 141769851cb73e8f986e9ed83129cde3b645288d)
>
> Yoshihiro Shimoda (3):
>    usb: host: xhci: rcar: Add firmware_name selection by
>      soc_device_match()
>    usb: host: xhci: plat: re-fact xhci_plat_priv for R-Car Gen3
>    usb: host: xhci: rcar: Add support for R-Car H3 ES2.0
>
>   drivers/usb/host/xhci-plat.c | 10 +---------
>   drivers/usb/host/xhci-rcar.c | 40 ++++++++++++++++++++++++++++++++++++++--
>   2 files changed, 39 insertions(+), 11 deletions(-)
>

Thanks, adding

-Mathias

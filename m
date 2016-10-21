Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:22619 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932256AbcJUK5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 06:57:12 -0400
Subject: Re: [PATCH v2 0/2] usb: host: xhci: plat: add support for Renesas
 r8a7796 SoC
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mark.rutland@arm.com
References: <1476867015-30554-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Mathias Nyman <mathias.nyman@intel.com>
Message-ID: <5809F499.5030304@intel.com>
Date: Fri, 21 Oct 2016 13:57:29 +0300
MIME-Version: 1.0
In-Reply-To: <1476867015-30554-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 19.10.2016 11:50, Yoshihiro Shimoda wrote:
> This patch set is based on the latest Greg's usb.git / usb-next branch.
> (commit id = 1001354ca34179f3db924eb66672442a173147dc)
>
> Changes from v1:
>   - Revise the comment in patch 1.
>   - Don't add a new macro because the macro will be not used in the future.
>     (Especially, the xhci-rcar driver will need to check SoC revision and
>      change the firmware name.)
>
> Yoshihiro Shimoda (2):
>    usb: host: xhci: rcar: add a new firmware version for r8a7796
>    usb: host: xhci: plat: add support for Renesas r8a7796 SoC
>
>   Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>   drivers/usb/host/xhci-plat.c                       | 9 +++++++++
>   drivers/usb/host/xhci-rcar.c                       | 4 ++++
>   drivers/usb/host/xhci-rcar.h                       | 1 +
>   4 files changed, 15 insertions(+)
>

Thanks, added it to my tree

-Mathias

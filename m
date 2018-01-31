Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:26409 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752337AbeAaM0D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 07:26:03 -0500
Subject: Re: [PATCH] usb: host: xhci-hub: avoid xhci_warn() when PORT_PE was
 clear.
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <1517399893-24883-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <9a651725-c50f-5e07-6911-b630ac8a7cb8@linux.intel.com>
Date: Wed, 31 Jan 2018 14:28:59 +0200
MIME-Version: 1.0
In-Reply-To: <1517399893-24883-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 31.01.2018 13:58, Yoshihiro Shimoda wrote:
> The commit 37be66767e3c ("usb: hub: Fix auto-remount of safely removed
> or ejected USB-3 devices") causes the following error when we
> disconnected a usb 3.0 device on some environment (e.g. R-Car H3):
> 
>   xhci-hcd ee000000.usb: Cannot set link state.
>   usb usb8-port1: cannot disable (err = -32)
> 
> According to Figure 35 in xhci spec, the PED (PORT_PE) will
> be set to 0 after the usb3 root hub enters "Error" or "Disconnected"
> state. So, this patch avoids the error messages to return -ENODEV when
> asked to set the USB_PORT_FEAT_LINK_STATE feature to U3 and PORT_PE
> was clear.
> 
> Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   drivers/usb/host/xhci-hub.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 2a90229..7e95f9e 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -1229,8 +1229,11 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>   			 * port link state above '3' (U3) and the port
>   			 * must be enabled.
>   			 */
> -			if ((temp & PORT_PE) == 0 ||
> -				(link_state > USB_SS_PORT_LS_U3)) {
> +			if ((temp & PORT_PE) == 0) {
> +				retval = -ENODEV;
> +				break;
> +			}
> +			if (link_state > USB_SS_PORT_LS_U3) {
>   				xhci_warn(xhci, "Cannot set link state.\n");
>   				goto error;
>   			}
> 

Thanks.
Didn't notice this before writing a similar patch.
Anyway, I'll make sure one of them goes forward after rc1

-Mathias  

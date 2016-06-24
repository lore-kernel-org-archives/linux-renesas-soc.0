Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:42220 "EHLO
	relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751394AbcFXGfy convert rfc822-to-8bit
	(ORCPT <rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 24 Jun 2016 02:35:54 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "balbi@kernel.org" <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 0/2] usb: renesas_usbhs: fix issues on specific situations
Date: Fri, 24 Jun 2016 06:35:48 +0000
Message-ID: <SG2PR06MB091960EE7D94862DFE5428BFD82E0@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1465371170-4828-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1465371170-4828-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Felipe,

Would you review this patch set?

Best regards,
Yoshihiro Shimoda

> From: Yoshihiro Shimoda
> Sent: Wednesday, June 08, 2016 4:33 PM
> To: balbi@kernel.org
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; linux-renesas-soc@vger.kernel.org; stable@vger.kernel.org;
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Subject: [PATCH 0/2] usb: renesas_usbhs: fix issues on specific situations
> 
> This patch set is based on the latest Felipe's usb.git / testing/fixes branch.
> (commit id = 50c763f8c1bac0dc00f7788a75f227276c0efd54)
> 
> Yoshihiro Shimoda (2):
>   usb: renesas_usbhs: fix NULL pointer dereference in xfer_work()
>   usb: renesas_usbhs: protect the CFIFOSEL setting in usbhsg_ep_enable()
> 
>  drivers/usb/renesas_usbhs/fifo.c       | 18 ++++++++++++++----
>  drivers/usb/renesas_usbhs/mod_gadget.c |  9 ++++++++-
>  2 files changed, 22 insertions(+), 5 deletions(-)
> 
> --
> 1.9.1

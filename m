Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:50596 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751830AbdI0Igw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2017 04:36:52 -0400
Date: Wed, 27 Sep 2017 10:36:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: renesas_usbhs: fix usbhsf_fifo_clear() behavior
Message-ID: <20170927083648.GA20317@kroah.com>
References: <1506499445-14826-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506499445-14826-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 27, 2017 at 05:04:05PM +0900, Yoshihiro Shimoda wrote:
> This patch fixes two issues:
>  - the usbhsf_fifo_clear() is possible to cause 10 msec delay if
>    the pipe is RX direction and empty because the FRDY bit will never
>    be set to 1 in such case.
>  - sets the BCLR of {C,Dn}FIFOCTR to 1 even when it's non-DCP pipe and
>    the FRDY bit sets to 0.

Should this be two different patches because of this?

thanks,

greg k-h

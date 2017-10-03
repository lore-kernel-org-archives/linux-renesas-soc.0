Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44287 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750812AbdJCSdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 14:33:45 -0400
Date: Tue, 3 Oct 2017 20:33:54 +0200
From: Greg KH <greg@kroah.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        wsa@the-dreams.de, linux-serial@vger.kernel.org,
        magnus.damm@gmail.com
Subject: Re: [PATCH 2/2] serial: sh-sci: Support for HSCIF RX sampling point
 adjustment
Message-ID: <20171003183354.GA22877@kroah.com>
References: <1506690534-27302-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1506690534-27302-3-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506690534-27302-3-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 29, 2017 at 03:08:54PM +0200, Ulrich Hecht wrote:
> HSCIF has facilities that allow moving the RX sampling point by between
> -8 and 7 sampling cycles (one sampling cycles equals 1/15 of a bit
> by default) to improve the error margin in case of slightly mismatched
> bit rates between sender and receiver.
> 
> This patch allows changing the default (0, meaning center) using the
> sysfs attribute "rx_sampling_point".
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  drivers/tty/serial/sh-sci.c | 62 +++++++++++++++++++++++++++++++++++++++++++--
>  drivers/tty/serial/sh-sci.h |  4 +++
>  2 files changed, 64 insertions(+), 2 deletions(-)

Adding random sysfs files for random serial ports isn't good, especially
if you do not document them in Documentation/ABI.

I don't want to see this, but if you write sysfs files in the future,
here's some review comments:

> +static DEVICE_ATTR(rx_sampling_point, 0644,
> +		   rx_sampling_point_show,
> +		   rx_sampling_point_store);

DEVICE_ATTR_RW()

> +	if (port->port.type == PORT_HSCIF) {
> +		sysfs_remove_file(&dev->dev.kobj,
> +				  &dev_attr_rx_sampling_point.attr);

No driver code should ever call sysfs functions, this should be either:
	device_create_file()
or properly use an attribute group.

thanks,

greg k-h

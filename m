Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:59692 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751950AbcERNXS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 18 May 2016 09:23:18 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: wsa@the-dreams.de, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv2] i2c: rcar: add DMA support
Date: Wed, 18 May 2016 15:23:07 +0200
Message-ID: <6110679.RmWR1Poicp@wuerfel>
In-Reply-To: <1463228228-32560-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1463228228-32560-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Saturday 14 May 2016 14:17:08 Niklas S�derlund wrote:
> +       chan = dma_request_slave_channel_reason(dev, chan_name);
> +       if (IS_ERR(chan)) {
> +               ret = PTR_ERR(chan);
> +               dev_dbg(dev, "request_channel failed for %s (%d)\n",
> +                       chan_name, ret);
> +               return chan;
> +       }
> 

I think you should now use dma_request_chan() for new drivers.

	Arnd

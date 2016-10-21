Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:40466 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754148AbcJULU3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 07:20:29 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xuan Truong Nguyen <nx-truong@jinso.co.jp>
Cc: duclm <lm-duc@jinso.co.jp>, ryusuke.sakato.bx@renesas.com,
        kuninori.morimoto.gx@renesas.com, magnus.damm@gmail.com,
        geert+renesas@glider.be, h-inayoshi@jinso.co.jp,
        yoshihiro.shimoda.uh@renesas.com, nv-dung@jinso.co.jp,
        cm-hiep@jinso.co.jp, laurent.pinchart+renesas@ideasonboard.com,
        horms+renesas@verge.net.au, linux-renesas-soc@vger.kernel.org,
        wsa@sang-engineering.com
Subject: Re: The failure summary report of GEN2 for linux stable v4.8
Date: Fri, 21 Oct 2016 14:20:24 +0300
Message-ID: <5754513.jIbGsJMV7d@avalon>
In-Reply-To: <a101cec4-c9ee-48fa-4f16-5e4cb2b8fab7@jinso.co.jp>
References: <57A46D20.7040106@jinso.co.jp> <1557504.I3EyWl6QE0@avalon> <a101cec4-c9ee-48fa-4f16-5e4cb2b8fab7@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Truong,

On Friday 21 Oct 2016 19:53:47 Xuan Truong Nguyen wrote:
> Hello Laurent.
> 
> > The document mentions that you have used shmobile_defconfig. However, that
> > configuration in v4.8 doesn't enable CONFIG_CMA, which causes at least the
> > DU driver to fail probing the device. I thus assume you have modified the
> > configuration to enable CMA. The fact that shmobile_defconfig doesn't
> > include the uvcvideo driver used by test 14 seems to confirm local
> > modifications to the configuration.
> > Issue 8 ("Lager: bad image quality when shown on HDMI display") can't be
> > reproduced on my system when displaying a test pattern with the modetest
> > application. Could you please share more information on how to reproduce
> > the problem ?
> 
> We retested this issue No 8 again with the CONFIG_CMA enabled but the
> result is the same. you could see it by the error.jpg image in attachments.
> the display device used is Panasonic TH-L19C3 (refer the device.jpg). we
> also send you my configs file, too (lager_du.config).

Thank you for the information, I'll try to reproduce the problem here with 
your kernel configuration.

> just one more thing, with CONFIG_CMA enabled, the driver fails on
> probing if we boot the board without the HDMI cable inserted in advance.
> we have to insert the cable before booting the board. and not all the
> display work with current HDMI driver (as our LG display will not work)
> we are using the mainline upstream version 4.8

Interesting, I'll check that too.

> if you need any information to debug, please lets us know.

Could you please tell me what you're using to test the display ?

-- 
Regards,

Laurent Pinchart

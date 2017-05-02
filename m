Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39636 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751060AbdEBK6Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 06:58:16 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: jmondi <jacopo@jmondi.org>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 1/2] media: platform: Add SH CEU camera interface driver
Date: Tue, 02 May 2017 13:59:31 +0300
Message-ID: <2385030.nbc1FUkfUQ@avalon>
In-Reply-To: <20170502094842.GC5814@w540>
References: <1493282548-27673-1-git-send-email-jacopo@jmondi.org> <2468637.9LR39KYxFA@avalon> <20170502094842.GC5814@w540>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Tuesday 02 May 2017 11:48:42 jmondi wrote:
> On Thu, Apr 27, 2017 at 02:47:14PM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> 
> [snip]
> 
> > > +	pcdev = devm_kzalloc(&pdev->dev, sizeof(*pcdev), GFP_KERNEL);
> > 
> > devm_kzalloc() is harmful here. You're embedding a struct video_device
> > instead struct sh_ceu_dev, and the video device can outlive the platform
> > driver remove() call if the device node is kept open by userspace when
> > the device is removed. You should use kzalloc() and implement a .release
> > callback for the video_device to kfree() the memory.
> 
> Does this apply to video_unregister_device() as well?
> Should I keep it registered after platform driver removal?

No, the video device must be unregistered in the platform driver's remove() 
callback. As explained in my previous reply the driver private data structure 
can still be reachable if a userspace application has the device node opened 
when it gets unregistered, so you can't free it in the remove() callback.

> Other drivers (eg atmel-isc and pxa_camera) unregister the video
> device in their sensor unbind callbacks.
> As video device has pointer to fops embedded, if we unregister it at
> sensor unbind time, does the ipotetical application having an open
> reference to the device node lose the ability to properly close it?

An application will always be able to close an open file handle, and that will 
always end up in the v4l2_file_operations release() handler, which can access 
the driver's private data structure (including the video_device instance it 
embeds). That's why you can't free the memory before the last file handle is 
closed.

-- 
Regards,

Laurent Pinchart

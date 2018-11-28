Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:36812 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728833AbeK2ECI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Nov 2018 23:02:08 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: Issue with enabling VSP source on rcar gen2 koelsch board
Date: Wed, 28 Nov 2018 19:00:13 +0200
Message-ID: <2577289.0toRb0HB0W@avalon>
In-Reply-To: <OSBPR01MB2103C4452BD3C3E0803CA34FB8D10@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <OSBPR01MB2103C4452BD3C3E0803CA34FB8D10@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Wednesday, 28 November 2018 15:20:58 EET Biju Das wrote:
> Hi all,
> 
> On the past, I have tested vsp source  on rcar gen2 koelsch board, using the
> patches series below(Apart from the below  patch series, I have enabled
> "CONFIG_DRM_RCAR_VSP=y")
> https://git.linuxtv.org/pinchartl/media.git/log/?h=drm/du/panels
> 
> 1) [HACK] ARM: shmobile: r8a7791: Link the VSP1 and DU
> 2) [HACK] v4l: vsp1: Disable UAPI for VSP1D
> 3) [HACK] drm: rcar-du: Enable VSP source support for R8A7791
> 
> But on the latest renesas-dev branch looks like  it is broken

That doesn't surprise me too much as I don't actively maintain that code.

For my information, what are your use cases ? Do you think this approach 
should be pursued and patches merged upstream ? The amount of work will be 
quite high though, given that it introduces a new userspace API, we will have 
to publish an open-source implementation in an X.org or Wayland driver.

> The issue is kernel doesn't boot, if I connect display panel.  Looks like it
> is hanging in register_framebuffer.
> 
> [    5.344412] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    5.364250] [drm] No driver support for vblank timestamp query.
> 
> Have any one noticed this issue?

This usually means that the kernel crashes with the console lock taken, 
preventing the oops from being printed. As a debugging hack you can comment 
out the locking calls in console_lock(), console_trylock() and 
console_unlock() (kernel/printk/printk.c).

-- 
Regards,

Laurent Pinchart

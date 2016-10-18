Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59987 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935250AbcJRPzV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 11:55:21 -0400
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
Date: Tue, 18 Oct 2016 18:55:18 +0300
Message-ID: <2351232.duWS6KBH5O@avalon>
In-Reply-To: <1557504.I3EyWl6QE0@avalon>
References: <57A46D20.7040106@jinso.co.jp> <9d9a647b-d75f-e89a-2d4d-55e409ccabae@jinso.co.jp> <1557504.I3EyWl6QE0@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

On Tuesday 18 Oct 2016 17:13:32 Laurent Pinchart wrote:

[snip]

> Issue 14 ("USB-CAM: Warning message appears if remove the usb-camera cable
> under using") is likely not a Renesas-specific problem, but as I'm the
> maintainer of the uvcvideo webcam driver you used for testing I'll
> investigate that.

I confirm that this issue can be reproduced on an x86 machine running v4.4.6. 
It isn't Renesas-specific.

-- 
Regards,

Laurent Pinchart

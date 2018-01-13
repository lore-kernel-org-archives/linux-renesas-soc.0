Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:39322 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965425AbeAMJd6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 Jan 2018 04:33:58 -0500
Received: by mail-lf0-f68.google.com with SMTP id m8so8366766lfc.6
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jan 2018 01:33:57 -0800 (PST)
Subject: Re: [PATCH v2 2/2] drm: rcar-du: lvds: Fix LVDS startup on R-Car gen2
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <11845752.a3eY2rs97p@avalon>
 <20180112231002.26213-1-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <38ec7142-1bef-656a-1399-f3642028d460@cogentembedded.com>
Date: Sat, 13 Jan 2018 12:33:55 +0300
MIME-Version: 1.0
In-Reply-To: <20180112231002.26213-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 1/13/2018 2:10 AM, Laurent Pinchart wrote:

> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> According to the latest revision 2.00 of the R-Car gen2 manual, the LVDS
> must be enabled and the bias crcuit enabled after the LVDS I/O pins are
> enabled, not before. Fix the gen2 LVDS startup sequence accordingly.
> 
> While at it, also fix the comment preceding the first LVDCR0 write that
> still talks about hardcoding the LVDS mode 0.

    Please do this in a separate commit then...

> Fixes: 90374b5c25c9 ("drm/rcar-du: Add internal LVDS encoder support")

    You forgot to specify the other commit this one fixes -- I mean the 
comment fix.

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> [Set the mode and input at the same time as the BEN and LVEN bits]
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> Hi Sergei,
> 
> For your convenience (and if you agree with bundling mode setup with the first
> write as explained in my review of patch 1/2), here's the updated version of
> patch 2/2 that I have taken in my development branch. If you're fine with it
> I'll keep it, otherwise we can continue the review discussion.

    As I said, I don't know how to interpret the note 3 in either manual.

[...]

MBR, Sergei

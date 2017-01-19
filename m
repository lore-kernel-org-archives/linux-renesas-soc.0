Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51594 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754052AbdASSn3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 13:43:29 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stuvart S <lovelinuxdeeply@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: About Rcar Du
Date: Thu, 19 Jan 2017 20:37:15 +0200
Message-ID: <2868417.013uUPaKtK@avalon>
In-Reply-To: <CAAMGra6pVHm7RUth2L2R=Vu3fut4MyPkOgzqwxzM4DWXv81s=Q@mail.gmail.com>
References: <CAAMGra4__ZZWocyP=Yyhgz=8Xb_aDyuEKAn_3+X54Wp0oKwmAQ@mail.gmail.com> <2727959.pNfnb7DPey@avalon> <CAAMGra6pVHm7RUth2L2R=Vu3fut4MyPkOgzqwxzM4DWXv81s=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hellu Stuvart,

On Thursday 19 Jan 2017 23:06:08 Stuvart S wrote:
> Hi Laurent,
> 
> Thank you for that information. I am not meaning to capture the
> frames to memory but, I have my own C code snippet to alter image to
> some other forms which reads from a frame buffer ..here I am going to
> do the tapping of image data from DU and modify according to my code
> and write back to same location so that I expect the DU output will
> alter..Actually there should be the image data which is get transfered
> through DU unit to various DU outputs right?
> 
> or should I Concentrate on framebuffer?...I Could see a file named
> framebuffer.c in /driver/gpu/drm/ in the stable kernel release which I
> Could not in older versions..I don't know what is the reason of that..

I think you need to learn more about the DRM/KMS API. At this point this isn't 
a DU-specific issue, and what you want to do isn't how the display APIs in 
Linux operate.

-- 
Regards,

Laurent Pinchart

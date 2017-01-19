Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49714 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751350AbdASJY1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 04:24:27 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stuvart S <lovelinuxdeeply@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: About Rcar Du
Date: Thu, 19 Jan 2017 11:15:08 +0200
Message-ID: <3684631.gUSRQtF07Z@avalon>
In-Reply-To: <CAAMGra4__ZZWocyP=Yyhgz=8Xb_aDyuEKAn_3+X54Wp0oKwmAQ@mail.gmail.com>
References: <CAAMGra4__ZZWocyP=Yyhgz=8Xb_aDyuEKAn_3+X54Wp0oKwmAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Stuvart,

On Thursday 19 Jan 2017 08:24:38 Stuvart S wrote:
> Hi Laurent and all,
>     I would like to ask a very basic question here .. I have an Rcar E2
> board with me..Linux 4.8 version kernel is running perfectly on this
> board.. Now I am getting videos on HDMI output.. I would like to modify
> this video by tapping from du unit and rescale that video .. I found that
> many du output source code are there in driver/gpu/drm/rcar-du ..I dont
> know which of these that I have to edit.. Am I able to take video/ image
> data from du? I am a newbi in this field ..

The DU doesn't have any scaler, you will need to use an external scaler, such 
as the one included in the VSP (using OpenGL for scaling is also an option if 
you have support for the GPU). No kernel modification is needed for this, the 
DU and VSP are both supported in mainline with a DRM/KMS and V4L2 driver 
respectively.

-- 
Regards,

Laurent Pinchart

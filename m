Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54151 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751562AbdEDMxB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 May 2017 08:53:01 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: jmondi <jacopo@jmondi.org>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC v2 1/2] media: platform: Add SH CEU camera interface driver
Date: Thu, 04 May 2017 15:54:19 +0300
Message-ID: <2978338.Pa9pg5uBv6@avalon>
In-Reply-To: <SG2PR06MB1165604125099267D61005DB8AEA0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1493282548-27673-1-git-send-email-jacopo@jmondi.org> <20170503095236.GD5814@w540> <SG2PR06MB1165604125099267D61005DB8AEA0@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Thursday 04 May 2017 12:23:32 Chris Brandt wrote:
> On Wednesday, May 03, 2017, jmondi wrote:
> > I have a proposal here, as the original driver only supported "image
> > fetch mode" (ie. It accepts data in YUYV with components ordering
> > arbitrary swapped) as a first step we may want to replicate this, ignoring
> > data synch fetch mode (Chris, you have a driver for this you are already
> > using in your BSP so I guess it's less urgent to support it, right?).
> 
> 
> My "driver" (if you can call it that) is basically 20 lines of code that
> sets up the registers either "image capture" mode or "data fetch". The
> main reason for the code was that the current CEU driver only supported
> "image capture" which resulted in separate Y and CbCr output buffers
> output, and then the app would have to merge them back together which was a
> waste of time (and memory).
> 
> My customers simply wanted the packed format
> that came out of the camera. So, I created the 20 lines of code and we
> abandoned the CEU driver in the kernel.
> 
> Also, the LCD controller (VDC5) can display a YCbCr frame buffer directly if
> it's packed...but not if it's a separate Y/CbCr buffers.
> 
> Not to mention, if you just have a black and white camera (Y only), the
> Y/CbCr spilt function is totally useless and cuts your B&W image in half
> for no reason. 
> 
> My point: You can do the "image capture" mode (CAMCR:JPG=0) first, but no
> one will actually use the driver until the "data fetch" mode (CAMCR:JPG=1)
> is implemented. 

Thanks for the feedback. I think that, given a YUV sensor, implementing 
support for both image capture and data fetch modes won't be difficult. 
Jacopo, are you OK with that ? If you implement image capture mode first, data 
fetch mode should be just a small additional patch.

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:35680 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753956AbdASRgJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 12:36:09 -0500
Received: by mail-ua0-f193.google.com with SMTP id 96so4846912uaq.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jan 2017 09:36:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2727959.pNfnb7DPey@avalon>
References: <CAAMGra4__ZZWocyP=Yyhgz=8Xb_aDyuEKAn_3+X54Wp0oKwmAQ@mail.gmail.com>
 <3684631.gUSRQtF07Z@avalon> <CAAMGra4bptV2sNXoLPP9xRBmR+OiO=JqmqTfPtiSCiWudLPpoA@mail.gmail.com>
 <2727959.pNfnb7DPey@avalon>
From: Stuvart S <lovelinuxdeeply@gmail.com>
Date: Thu, 19 Jan 2017 23:06:08 +0530
Message-ID: <CAAMGra6pVHm7RUth2L2R=Vu3fut4MyPkOgzqwxzM4DWXv81s=Q@mail.gmail.com>
Subject: Re: About Rcar Du
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

     Thank you for that information. I am not meaning to capture the
frames to memory but, I have my own C code snippet to alter image to
some other forms which reads from a frame buffer ..here I am going to
do the tapping of image data from DU and modify according to my code
and write back to same location so that I expect the DU output will
alter..Actually there should be the image data which is get transfered
through DU unit to various DU outputs right?

or should I Concentrate on framebuffer?...I Could see a file named
framebuffer.c in /driver/gpu/drm/ in the stable kernel release which I
Could not in older versions..I don't know what is the reason of that..

Regards,
Stuvart

On 19 January 2017 at 18:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hello Stuvart,
>
> On Thursday 19 Jan 2017 09:43:16 Stuvart S wrote:
>> On Thu, Jan 19, 2017 at 2:44 PM Laurent Pinchart wrote:
>> > On Thursday 19 Jan 2017 08:24:38 Stuvart S wrote:
>> >> Hi Laurent and all,
>> >>
>> >> I would like to ask a very basic question here .. I have an Rcar E2
>> >> board with me..Linux 4.8 version kernel is running perfectly on this
>> >> board.. Now I am getting videos on HDMI output.. I would like to modify
>> >> this video by tapping from du unit and rescale that video .. I found
>> >> that many du output source code are there in driver/gpu/drm/rcar-du ..I
>> >> dont know which of these that I have to edit.. Am I able to take video/
>> >> image data from du? I am a newbi in this field ..
>> >
>> > The DU doesn't have any scaler, you will need to use an external scaler,
>> > such as the one included in the VSP (using OpenGL for scaling is also an
>> > option if you have support for the GPU). No kernel modification is needed
>> > for this, the DU and VSP are both supported in mainline with a DRM/KMS and
>> > V4L2 driver respectively.
>>
>> Thank you so much . I understand.. But here I am trying to ask about data
>> tapping from DU .. I cant see any data flow through DU source code ..which
>> area that I have to focus to do so.. Normally many DU outputs are there
>> like lvds,hdmi etc.. Here I would like to try to take the data at just
>> before output port
>
> Do you mean capturing the frames to memory ? The DU supports write-back, but
> there's no software support for it on R-Car Gen2 at the moment.
>
>> I dont know wether it is a meaningless question ..
>
> --
> Regards,
>
> Laurent Pinchart
>



-- 
                        --- Come    Let's enjoy the world of Open Source  ---


Best regards,
Stuvart

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:32811 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751791AbdBCCR2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Feb 2017 21:17:28 -0500
Subject: Re: [Lager(H2)-V4.10-rc2]: DISPLAY-UNIT: Does not support 640x480
 resolution & Does not support 16-bit for color numbers.
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <8554c00b-b546-6270-07a0-8dd597c8fdad@jinso.co.jp>
 <CAMuHMdV1fW5hDmd=H_5mO4te2xvy2YcKdWHWLtN2OhaywLGunA@mail.gmail.com>
 <3d8bc96b-d6b9-ff6a-eb6a-e47c2309a36b@jinso.co.jp>
 <3575049.48TTsaQDbs@avalon>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Stefan Agner <stefan@agner.ch>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: DongCV <cv-dong@jinso.co.jp>
Message-ID: <c8519dd8-d42b-575d-d72b-a6f32dfe4042@jinso.co.jp>
Date: Fri, 3 Feb 2017 11:17:24 +0900
MIME-Version: 1.0
In-Reply-To: <3575049.48TTsaQDbs@avalon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Laurent,

I apologize for the delayed response.
I've understoodyour opinion. Thank you very much.

Regards,
Dong


On 01/31/2017 06:47 PM, Laurent Pinchart wrote:
> Hello Dong,
>
> On Tuesday 31 Jan 2017 15:49:34 DongCV wrote:
>> DearLaurent,
>> cc: Geert
>>
>>> Cfr. Laurent Pinchart's answer in the thread "Re: The failure summary
>>>
>>> report of GEN2 for linux stable v4.10-rc2":
>>> | I confirm your analysis. However, I think this isn't a new issue. Before
>>> | the aforementioned patch, running
>>> |
>>> | # fbset -xres 640 -yres 480 -laced 0
>>> | # fbset -depth 16 -rgba 5,6,5,0
>>> |
>>> | didn't produce any error, but didn't either resize the display to
>>> | 640x480 or changed the pixel format. With the patch applied, the
>>> | commands are rejected as they should be, as they wouldn't produce the
>>> | expected results. The new behaviour is thus in my opinion correct.
>>>
>>> http://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg10879.htm
>>> l
>> I understood your opinion.
>> However,I wonder why the display size has changed when I implement the
>> following test procedure.
>> Could you explain it to me?
>>
>> * Changed the resolution.
>> - Perform the following command:
>> # bmap / dev / fb0 hdmi.bmp (Initial default size is 1024x768.  Please
>> have look at 1024x768.jpg image)
>> # fbset -xres 640 -yres 480 -laced 0
>> # bmap / dev / fb0 hdmi.bmp
>>
>> I saw the screen size has changed after running the following command.
>> "#fbset -xres -laced 0 480 640 -yres"(Please have look at 640x480.jpg image)
>> but I run the following command again
>> "#bmap / dev / fb0 hdmi.bmp", the image size did not change.
>>
>> Implement similarly with the 800x600 resolution. (Please have look at
>> 800x600.jpg image)
> That's because the screen resolution has not changed. Only the size reported
> to the fbdev emulation layer is updated, the screen resolution and framebuffer
> stay the same. This is exactly why changing the resolution through the fbdev
> device has been disabled recently, it just didn't work. This is a feature that
> will never be supported and should thus not be used.
>
> The purpose of the fbdev compatibility layer is to enable the framebuffer
> kernel console on top of a DRM/KMS device. The userspace API is available for
> applications to use, but they should not expect the full feature set of fbdev.
> Applications should be migrated to DRM/KMS.
>
>> * Changed the pixel format.
>> - Perform the following command:
>> # fbset -depth 16 -rgba 5,6,5,0
>> # bmap /dev/fb0 hdmi.bmp
>>
>> (Please have look at pixel_16bit.jpg image)
>>
>> # fbset -depth 32 -rgba 5,6,5,0
>> # bmap /dev/fb0 hdmi.bmp
>>
>> (Please have look at pixel_32bit.jpg image)
>>
>> I realize that 16bit set image differs from 32bit set image.
>>
>> Please have a look at the attached image for detail.
> This isn't supported for the same reason as above.
>

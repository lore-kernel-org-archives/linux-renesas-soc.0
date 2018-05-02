Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f174.google.com ([209.85.217.174]:35544 "EHLO
        mail-ua0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751137AbeEBI7h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 04:59:37 -0400
Received: by mail-ua0-f174.google.com with SMTP id a2so8527228uak.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 May 2018 01:59:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3133347.E1rqC9Dq6Z@avalon>
References: <20180427222154.21664-1-kieran.bingham+renesas@ideasonboard.com> <3133347.E1rqC9Dq6Z@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 May 2018 10:59:36 +0200
Message-ID: <CAMuHMdVRisZAqt3mEUVoyknatn0oOF1PChwBf7xkEASAaiAQhA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] drm: rcar-du: r8a77965 DU support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Sat, Apr 28, 2018 at 12:43 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Saturday, 28 April 2018 01:21:49 EEST Kieran Bingham wrote:
>> The r8a77965 M3-N platform supports a DPAD, HDMI and LVDS output, along
>> 3 DU channels. However, DU2 is not available in the hardware, with the
>> DPAD instead being routed through DU3.
>>
>> Provide support for this non-linear indexing with updates to the rcar-du
>> driver, before adding the device info structure for the r8a77965.
>>
>>
>> Kieran Bingham (5):
>>   dt-bindings: display: renesas: Add R-Car M3-N HDMI TX DT bindings
>>   pinctrl: sh-pfc: r8a77965: Add DU RGB output pins, groups and
>>     functions
>>   drm: rcar-du: Split CRTC handling to support hardware indexing
>>   drm: rcar-du: Allow DU groups to work with hardware indexing
>>   drm: rcar-du: Add R8A77965 support
>
> I've taken the whole series in my tree for v4.18.

Shouldn't patch #2 go through sh-pfc?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

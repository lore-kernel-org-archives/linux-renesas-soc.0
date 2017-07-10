Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34565 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932221AbdGJOF7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 10:05:59 -0400
Received: by mail-it0-f66.google.com with SMTP id o202so13409389itc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2017 07:05:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2320662.jifSpTNEif@avalon>
References: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
 <1499693302-25120-9-git-send-email-geert+renesas@glider.be> <2320662.jifSpTNEif@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jul 2017 16:05:56 +0200
Message-ID: <CAMuHMdWVQtE61BAdYaGRXenWYiW28xKd5oFXTOebXOJZ7sh_GQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] ARM: multi_v7_defconfig: Replace DRM_RCAR_HDMI by
 generic bridge options
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        Simon Horman <horms@verge.net.au>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Jul 10, 2017 at 3:41 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday 10 Jul 2017 15:28:21 Geert Uytterhoeven wrote:
>> The manual bridge implementation was removed in favor of the generic
>> one, so now we need to enable standard bridge drivers like
>> DRM_DUMB_VGA_DAC and DRM_I2C_ADV7511.
>> Both were already enabled, but the (newer) ADV7511 audio part wasn't.
>>
>> Fixes: 5c602531feb3db39 ("drm: rcar-du: Replace manual bridge implementation
>> with DRM bridge")
>
> I wonder if this patch really needs a Fixes tag. All it does is removing a now
> deleted kernel option, and adding a new unrelated one. The former is related
> to 5c602531feb3db39, but I'm not sure it should be considered as a bug.

I added a Fixes tag because it aids backporting: if 5c602531feb3db39
is backported, the defconfig update should be backported, too.

> The content of this patch looks good to me though.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

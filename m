Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:45737 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751490AbeCXBbI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Mar 2018 21:31:08 -0400
Subject: Re: [PATCH] [RFC] drm: rcar-du: keep temporary dtb files around
 during build
To: Geert Uytterhoeven <geert@linux-m68k.org>, Frank.Rowand@sony.com
Cc: Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20180315153730.3798004-1-arnd@arndb.de>
 <ED290C750E1B324E972B0017C9D4BAB06479C421@USCULXMSG01.am.sony.com>
 <CAMuHMdULWVXXSXrEBoomONQhF-Af3FGMijMnL6WL6P1XE-e7zA@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <8969d6d5-a337-d794-0ebc-43a6ce40c102@gmail.com>
Date: Fri, 23 Mar 2018 18:31:06 -0700
MIME-Version: 1.0
In-Reply-To: <CAMuHMdULWVXXSXrEBoomONQhF-Af3FGMijMnL6WL6P1XE-e7zA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 03/22/18 07:26, Geert Uytterhoeven wrote:
> Hi Frank,
> 
> On Fri, Mar 16, 2018 at 2:39 AM,  <Frank.Rowand@sony.com> wrote:
>> On Thursday, March 15, 2018 8:37 AM, Arnd Bergmann [mailto:arnd@arndb.de]  wrote:
>>>
>>> The *.dtb and *.dtb.S files get removed by 'make' during the build
>>> process,
>>> and later seem to be missed during the 'modpost' stage:
>>>
>>> rm drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dtb
>>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dtb
>>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dtb.S
>>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dtb.S
>>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb.S
>>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dtb
>>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dtb
>>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb
>>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dtb.S
>>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dtb.S
>>> WARNING: could not open
>>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb.S: No such file or
>>> directory
>>>
>>> As a workaround, this adds all those files to the 'extra-y' target list,
>>> but that's really ugly. Any ideas for a better fix?
>>
>> Does this work for you (untested, but the way it is done in
>> drivers/of/unittest-data/Makefile):
>>
>> .PRECIOUS: \
>>         $(obj)/%.dtb.S \
>>         $(obj)/%.dtb
> 
> Shouldn't that just be moved to scripts/Makefile.lib, just above the rule
> to make dtb.S, like is done for other precious objects?
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

Thank you for adding Yamada-san (later in this thread).

I acked his patch series that does what you suggest.

-Frank

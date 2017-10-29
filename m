Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:55605 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751221AbdJ2LBq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 Oct 2017 07:01:46 -0400
MIME-Version: 1.0
In-Reply-To: <87tvyke8g2.fsf@intel.com>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net> <87tvyke8g2.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 29 Oct 2017 12:01:45 +0100
Message-ID: <CAMuHMdVjs00PioP0EnnBCuiDeFjmEWPUGaxRCdXZu+C+vgMjKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/rcar-du: Use common error handling code in rcar_du_encoders_init()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 27, 2017 at 8:45 PM, Jani Nikula
<jani.nikula@linux.intel.com> wrote:
> On Tue, 24 Oct 2017, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
>> Add a jump target so that a bit of exception handling can be better reused
>> at the end of this function.
>>
>> This issue was detected by using the Coccinelle software.
>
> Please also look into the GCC software, which will detect that your
> patch does not compile.

+1 ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from [209.85.214.66] ([209.85.214.66]:32888 "EHLO
        mail-it0-f66.google.com" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1754117AbdA0Hpf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 02:45:35 -0500
Received: by mail-it0-f66.google.com with SMTP id e137so7559164itc.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 23:45:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8554c00b-b546-6270-07a0-8dd597c8fdad@jinso.co.jp>
References: <8554c00b-b546-6270-07a0-8dd597c8fdad@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Jan 2017 08:45:05 +0100
Message-ID: <CAMuHMdV1fW5hDmd=H_5mO4te2xvy2YcKdWHWLtN2OhaywLGunA@mail.gmail.com>
Subject: Re: [Lager(H2)-V4.10-rc2]: DISPLAY-UNIT: Does not support 640x480
 resolution & Does not support 16-bit for color numbers.
To: DongCV <cv-dong@jinso.co.jp>
Cc: Stefan Agner <stefan@agner.ch>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dong,

On Fri, Jan 27, 2017 at 6:38 AM, DongCV <cv-dong@jinso.co.jp> wrote:
> I've tested the linux v4.10-rc2 for Gen2 Lager and found two issues about
> DISPLAY-UNIT:  Does not support 640x480 resolution & Does not support 16-bit
> for color numbers.
>
> "root@linaro-naro:~# fbset -xres 640 -yres 480 -laced 0
>  ioctl FBIOPUT_VSCREENINFO: Invalid argument"
>
> "root@linaro-naro:~# fbset -depth 16 -rgba 5,6,5,0
>  ioctl FBIOPUT_VSCREENINFO: Invalid argument"
>
>
> And I found the patch which I think it is the cause of this issues.
> The commit name is '865afb1 drm/fb-helper: reject any changes to the fbdev'
> If I reverted this patch and retested it on H2 board, the issue will be
> gone!
>
> Please have a look at the attached testlog file for detail.

Do you get the correct output on the display after reverting that patch?

Cfr. Laurent Pinchart's answer in the thread "Re: The failure summary
report of GEN2 for linux stable v4.10-rc2":

| I confirm your analysis. However, I think this isn't a new issue. Before
| the aforementioned patch, running
|
| # fbset -xres 640 -yres 480 -laced 0
| # fbset -depth 16 -rgba 5,6,5,0
|
| didn't produce any error, but didn't either resize the display to
| 640x480 or changed the pixel format. With the patch applied, the
| commands are rejected as they should be, as they wouldn't produce the
| expected results. The new behaviour is thus in my opinion correct.

http://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg10879.html

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

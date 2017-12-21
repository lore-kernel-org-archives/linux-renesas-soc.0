Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:35249 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751690AbdLUOJK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 09:09:10 -0500
Received: by mail-qt0-f176.google.com with SMTP id u10so32533408qtg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Dec 2017 06:09:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171215153315.nxuujm4xeglmrvqo@ninjato>
References: <20171215153315.nxuujm4xeglmrvqo@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Dec 2017 15:09:09 +0100
Message-ID: <CAMuHMdXp+HheoVyyxQTBD4Az__gJD+uRzOg=ZK0gZxiBDudh=Q@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topc/ip-switch-rework-2017 for renesas drivers
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Fri, Dec 15, 2017 at 4:33 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> Here is the the topic branch to add the I2C IP core switcher to all
> busses of Gen2 boards where some kind of switching is possible (mostly
> to/from GPIO).
>
> It is based on v4.15-rc1 + renesas/dt-for-v4.16 merged in.
>
> Please pull.
>
> Kind regards,
>
>    Wolfram
>
>
> The following changes since commit ea648c135fcb40f864f0c898b94ecd39782d895c:
>
>   Merge tag 'renesas-dt-fixes-for-v4.15' into renesas/topc/ip-switch-rework-2017 (2017-12-08 12:17:55 +0100)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topc/ip-switch-rework-2017
>
> for you to fetch changes up to bec727d32dc69bdba3b4ea0b10a3b09461be6a9e:
>
>   ARM: dts: gose: use demuxer for I2C4 (2017-12-08 14:54:43 +0100)

Thank you, merges cleanly into today's linux-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

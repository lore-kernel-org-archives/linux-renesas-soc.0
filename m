Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:38703 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751652AbeCLGlP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Mar 2018 02:41:15 -0400
Received: by mail-qk0-f193.google.com with SMTP id 132so360401qkd.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Mar 2018 23:41:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1520633188-13721-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1520633188-13721-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Mar 2018 07:41:13 +0100
Message-ID: <CAMuHMdWkhiJXgvZw03xT415808533xN+KJqa1eRS3=xbefUAng@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] vsp1/du/interlaced/v1
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Fri, Mar 9, 2018 at 11:06 PM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Please consider including this branch in renesas-drivers.
>
> The following changes since commit 397eb3811ec096d0ceefa1dbea2d0ae68feb0587:
>
>   media: vsp1: Move video configuration to a cached dlb (2018-03-07 21:19:29 +0000)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/vsp1/du/interlaced/v1
>
> for you to fetch changes up to 6f3952607748a5bc62dfa59a522ac1111b5d63e4:
>
>   drm: rcar-du: Support interlaced video output through vsp1 (2018-03-09 21:43:55 +0000)

Thank you, merges cleanly into today's (well, lastFriday's) linux-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

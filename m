Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:34191 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752463AbeCNPu7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Mar 2018 11:50:59 -0400
Received: by mail-qt0-f194.google.com with SMTP id l25so3951188qtj.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Mar 2018 08:50:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1521042402-30927-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1521042402-30927-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Mar 2018 16:50:57 +0100
Message-ID: <CAMuHMdVAmcwYsSWcFRwzvmW+4BPgKZ3u-=GAFTguujA+xtR5yg@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] vsp1/du/interlaced/v2
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Wed, Mar 14, 2018 at 4:46 PM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Please consider including this release in renesas-drivers.
>
> --
> Regards
>
> Kieran
>
> The following changes since commit 397eb3811ec096d0ceefa1dbea2d0ae68feb0587:
>
>   media: vsp1: Move video configuration to a cached dlb (2018-03-07 21:19:29 +0000)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/vsp1/du/interlaced/v2
>
> for you to fetch changes up to 334f0b14fde0ddcfd02a12c41878a1b792221e4d:
>
>   drm: rcar-du: Support interlaced video output through vsp1 (2018-03-13 18:50:00 +0100)

Thank you, merges cleanly into today's linux-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

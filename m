Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:41443 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754190AbeBLO0Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 09:26:25 -0500
Received: by mail-qt0-f195.google.com with SMTP id a9so12476877qtj.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2018 06:26:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1518193418-26969-1-git-send-email-kbingham@kernel.org>
References: <1518193418-26969-1-git-send-email-kbingham@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2018 15:26:24 +0100
Message-ID: <CAMuHMdWc+NK3EXhUCPHJ8Q4twJZNcf-KrhmTvz0Qn2BLtbskSg@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] vsp1/vga-performance-fix
To: Kieran Bingham <kbingham@kernel.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Fri, Feb 9, 2018 at 5:23 PM, Kieran Bingham <kbingham@kernel.org> wrote:
> Please consider including this fix for the VSP1 in renesas-drivers.
>
> --
> Regards
>
> Kieran
>
> The following changes since commit d8a5b80568a9cb66810e75b182018e9edb68e8ff:
>
>   Linux 4.15 (2018-01-28 13:20:33 -0800)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git vsp1/vga-performance-fix
>
> for you to fetch changes up to e0c81de98739197b6fda7ba65fe4f17c7a03c384:
>
>   v4l: vsp1: Fix header display list status check in continuous mode (2018-02-09 15:57:49 +0000)

Thank you, merges cleanly into dotay's linux-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

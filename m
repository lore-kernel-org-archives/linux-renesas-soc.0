Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34023 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755391AbdCGQDF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 11:03:05 -0500
Received: by mail-io0-f193.google.com with SMTP id n76so958056ioe.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Mar 2017 08:02:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1481654294-8214-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1481654294-8214-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Mar 2017 16:54:11 +0100
Message-ID: <CAMuHMdW5ZTg6NNUNcNu=Ev8NZyihrYBUVNcHUMSOEgrNpH6sTw@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] Fix suspend/resume and race on M2M pipelines
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 13, 2016 at 7:38 PM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> The following changes since commit 69973b830859bc6529a7a0468ba0d80ee5117826:
>
>   Linux 4.9 (2016-12-11 11:17:54 -0800)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git vsp1/suspend-resume-race
>
> for you to fetch changes up to a952e0103f86d818a444923adeef50fdcb3f70b9:
>
>   media: Catch null pipes on pipeline stop (2016-12-13 16:25:13 +0000)

I've dropped this branch from today's renesas-drivers-2017-03-07-v4.11-rc1,
because it conflicted badly with Laurent's vsp1/histogram, and your branch
hadn't been updated in a while.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

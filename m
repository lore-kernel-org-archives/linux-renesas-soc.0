Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:42968 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751906AbdKWJrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 04:47:09 -0500
Received: by mail-qt0-f195.google.com with SMTP id j12so5489794qtc.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Nov 2017 01:47:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1510936566-14196-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1510936566-14196-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Nov 2017 10:47:07 +0100
Message-ID: <CAMuHMdX60SHbq2S-3m4_SiER5DgLT83jLMTFYR65wuUhrdBQDw@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] vsp1: TLB optimisation and DL caching
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Fri, Nov 17, 2017 at 5:36 PM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Please consider this updated tag for the next renesas drivers release.
>
> Regards
>
> Kieran
>
>
> The following changes since commit bebc6082da0a9f5d47a1ea2edc099bf671058bd4:
>
>   Linux 4.14 (2017-11-12 10:46:13 -0800)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/vsp1/tlb-optimise/v4
>
> for you to fetch changes up to 84592170dbe4ffdb4cc8d33aa20c23218e029ee7:
>
>   v4l: vsp1: Reduce display list body size (2017-11-17 15:38:43 +0000)

Thanks, merges cleanly into next-20171123.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

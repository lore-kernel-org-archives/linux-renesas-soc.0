Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33606 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750877AbdEIHNa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2017 03:13:30 -0400
Received: by mail-io0-f194.google.com with SMTP id l196so11143614ioe.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2017 00:13:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1494264582-23667-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1494264582-23667-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 May 2017 09:13:28 +0200
Message-ID: <CAMuHMdVUgVPT7+w-VvNhBnA95YCbYH3A4i7D2LVjeypcmwY3QQ@mail.gmail.com>
Subject: Re: [GIT PULL for renesas-drivers] VSP DRM Race V4
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Mon, May 8, 2017 at 7:29 PM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Please consider the following pull request for renesas-drivers.
>
> --
> Kieran
>
>
> The following changes since commit 13e0988140374123bead1dd27c287354cb95108e:
>
>   docs: complete bumping minimal GNU Make version to 3.81 (2017-05-06 18:49:09 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/submissions/vsp-drm-race/v4
>
> for you to fetch changes up to ca41dc36340276e09767ea8c828031ae33bcf662:
>
>   drm: rcar-du: Register a completion callback with VSP1 (2017-05-08 15:14:38 +0100)

Thank you. Looks good and merges cleanly into today's linux-next.
Let's wait and see what happens one week from now ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

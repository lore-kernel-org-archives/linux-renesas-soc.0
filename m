Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34769 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752445AbdEJIUe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 04:20:34 -0400
Received: by mail-it0-f67.google.com with SMTP id c26so2709048itd.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 01:20:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1494348424-18246-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1494348424-18246-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2017 10:20:32 +0200
Message-ID: <CAMuHMdVyCSgGZ1QcKaXeq6kjJBZJ8P4L0vmzDePk-o2HQwerXA@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] v4l: vsp1: writeback prototype
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Tue, May 9, 2017 at 6:47 PM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> The following changes since commit 13e0988140374123bead1dd27c287354cb95108e:
>
>   docs: complete bumping minimal GNU Make version to 3.81 (2017-05-06 18:49:09 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/submissions/vsp1/writeback/v3
>
> for you to fetch changes up to 5debeb08338b520f52577ca6cf9be815a54c07ea:
>
>   v4l: vsp1: Provide a writeback video device (2017-05-08 15:06:58 +0100)

Looks good, and merges cleanly into today's linux-next.

> v3:
>  - Rebased to v4.12-rc1

Interesting... Where can I find v4.12-rc1? ;-)

I see this is based on an arbitrary commit in Linus' tree instead?
While that's OK for renesas-drivers, you never want to do this for a
pull request you
sent to an upstream maintainer.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

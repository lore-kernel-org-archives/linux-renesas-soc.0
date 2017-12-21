Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:34148 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751562AbdLUOH5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 09:07:57 -0500
Received: by mail-qt0-f196.google.com with SMTP id 33so32561456qtv.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Dec 2017 06:07:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5151514.osXWQNHT4Q@avalon>
References: <5151514.osXWQNHT4Q@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Dec 2017 15:07:56 +0100
Message-ID: <CAMuHMdX-VVSF99JAmv2brauymHJb-3OvR-z76Gqc9FigXfTFDQ@mail.gmail.com>
Subject: Re: [GIT PULL for renesas-drivers] Display color keying support for Gen3
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Sun, Dec 17, 2017 at 1:18 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The following changes since commit 9428088c90b6f7d5edd2a1b0d742c75339b36f6e:
>
>   drm/qxl: reapply cursor after resetting primary (2017-12-08 13:37:02 +1000)
>
> are available in the git repository at:
>
>   git://linuxtv.org/pinchartl/media.git tags/drm-next-colorkey-v1-20171215
>
> for you to fetch changes up to 3e6d38e62e3542a8d5f93773ef42f2d0920d9629:
>
>   drm: rcar-du: Add support for color keying on Gen3 (2017-12-17 01:44:29
> +0200)

Thank you, merges cleanly into today's linux-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

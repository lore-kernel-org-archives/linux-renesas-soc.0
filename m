Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36564 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751132AbdEBJYN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 05:24:13 -0400
Received: by mail-io0-f195.google.com with SMTP id x86so28190006ioe.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 May 2017 02:24:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <19852948.3die4YcTFG@avalon>
References: <19852948.3die4YcTFG@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 May 2017 11:24:11 +0200
Message-ID: <CAMuHMdXSRN-kb0cSvi99omSYW6JA2YgvANJaLY6ysGbZpPAU2A@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] R-Car Gen3 HDMI output support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Mar 6, 2017 at 1:32 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Please find two pull requests below for renesas-drivers (in a single e-mail,
> lucky you :-)).

> The second tag contains DT changes only and is based on Simon's latest devel
> branch. Nothing special there, it should just not make it to mainline before
> the driver changes get accepted.

> The following changes since commit 2537532db23bdd9ecd2c1c956ac430a9a08738a8:
>
>   Merge branch 'arm64-dt-for-v4.12' into devel (2017-03-02 16:02:44 +0100)
>
> are available in the git repository at:
>
>   git://linuxtv.org/pinchartl/media.git tags/drm-next-dt-v3-20170306
>
> for you to fetch changes up to 111e8637fa9ad8261c25d437255c16f8e4e57116:
>
>   ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi panels
> (2017-03-06 02:12:00 +0200)

Dropped, too many conflicts ("Simon's latest devel branch", from 8 weeks ago).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

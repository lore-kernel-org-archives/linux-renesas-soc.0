Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:35833 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756238AbdDRIyo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 04:54:44 -0400
Received: by mail-io0-f196.google.com with SMTP id d203so29518451iof.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2017 01:54:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <19852948.3die4YcTFG@avalon>
References: <19852948.3die4YcTFG@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Apr 2017 10:54:43 +0200
Message-ID: <CAMuHMdUrTxowdyhFVaiJRkP7Ypyy_w6FYUaQqQ0uNsF1FErZyw@mail.gmail.com>
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
>
> The first tag contains driver changes only and is based on a merge of drm-next
> and drm-misc-next. The 5 patches from Maarten Lankhorst should be merged in
> drm-misc-next tomorrow (if all goes according to the plan). I'll rebase my
> tree on top of that, but that will only affect branches, not tags. More
> patches should also be merged in drm-misc-next in the next couple of days,
> I'll then send a pull request for the rest to Dave Airlie. In a few weeks I
> hope all of this to be in mainline.
>
> The second tag contains DT changes only and is based on Simon's latest devel
> branch. Nothing special there, it should just not make it to mainline before
> the driver changes get accepted.
>
>
> The following changes since commit 8d9874ba9561805fa7134c3371f8bf6b0650eb43:
>
>   Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm/next/base
> (2017-03-03 16:57:48 +0200)
>
> are available in the git repository at:
>
>   git://linuxtv.org/pinchartl/media.git tags/drm-du-hdmi-v3-20170306

Dropped, as I assume all of this has been merged in -next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:38406 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752580AbdCFIVN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 03:21:13 -0500
Received: by mail-it0-f43.google.com with SMTP id m27so45472995iti.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Mar 2017 00:21:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <19852948.3die4YcTFG@avalon>
References: <19852948.3die4YcTFG@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Mar 2017 09:12:45 +0100
Message-ID: <CAMuHMdXj924E4n+ZzgZ0cn8b_YLWcYRvmd57Gw_B4n=adQTyjA@mail.gmail.com>
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

Thank you, looks good!

I believe these supersede the previous two pull requests for
  1. git://linuxtv.org/pinchartl/media.git drm/du/hdmi
      (rebased as topic/drm-du-hdmi-2017-01-10-rebased2),
  2. git://linuxtv.org/pinchartl/media.git drm/next/du.
Is that correct?

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33892 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752487AbdFSI1q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 04:27:46 -0400
Received: by mail-io0-f196.google.com with SMTP id a96so10504732ioj.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jun 2017 01:27:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2212883.mR9x81Zv3F@avalon>
References: <8149481.gNmlvl7hsu@avalon> <CAMuHMdXREBCD9w8rkW6vXxh-Ro4waLN08Q1ePiS4uYoOMbGBGQ@mail.gmail.com>
 <2212883.mR9x81Zv3F@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jun 2017 10:27:44 +0200
Message-ID: <CAMuHMdWOmW5MvRfFQKvLtNDz1jB94HxFyx_OWt3Qw_HcEmHm8w@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] R-Car H3 ES2.0 display support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Jun 19, 2017 at 10:15 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Friday 16 Jun 2017 10:03:57 Geert Uytterhoeven wrote:
>> On Thu, Jun 15, 2017 at 8:54 PM, Laurent Pinchart wrote:
>> > The following changes implement display support for the R-Car H3 ES2.0.
>> > They have been split in three distinct branches:
>>
>> Thanks for your branches!
>>
>> > - tags/drm-h3-es2-dt-20170615 contains the DT changes and is based on top
>> > of topic/r8a7795es2-integration
>>
>> When merging this into next-20170616, there are lots of conflicts.
>> Most are due to your tag being based on a one-month old version of
>> renesas-devel.
>>
>> As the relevant DT changes in topic/r8a7795es2-integration have been applied
>> to renesas-devel, you could rebase on top of the latter.
>
> Do you mean renesas-devel-20170616-v4.12-rc5 ? I don't want to pull the whole

For example.

> renesas-drivers tree as a base for my development branches, I'd prefer keeping

s/drivers/devel/?

> the out-of-mainline dependencies as small as possible.

For submission upstream, your DT patches must apply to renesas-devel, so you
will have to do the rebase anyway. Doing so before sending a pull request for
renesas-drivers saves me from duplicating that work.

If you don't want all of renesas-devel, you can rebase on top of Simon's tag
arm64-dt-for-v4.13, or arm64-dt-for-v4.14, which has just appeared.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

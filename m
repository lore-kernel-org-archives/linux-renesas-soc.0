Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:33607 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751755AbdEBKKF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 06:10:05 -0400
Received: by mail-it0-f65.google.com with SMTP id v135so1278179itv.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 May 2017 03:10:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3509082.7kXcTHXJsv@avalon>
References: <19852948.3die4YcTFG@avalon> <CAMuHMdXSRN-kb0cSvi99omSYW6JA2YgvANJaLY6ysGbZpPAU2A@mail.gmail.com>
 <3509082.7kXcTHXJsv@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 May 2017 12:10:03 +0200
Message-ID: <CAMuHMdWGLmLrD-=xs+mhGHeBw4k5mFRzGjtXrChGSF2gBg7JUA@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] R-Car Gen3 HDMI output support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, May 2, 2017 at 12:06 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tuesday 02 May 2017 11:24:11 Geert Uytterhoeven wrote:
>> On Mon, Mar 6, 2017 at 1:32 AM, Laurent Pinchart wrote:
>> > Please find two pull requests below for renesas-drivers (in a single
>> > e-mail, lucky you :-)).
>> >
>> > The second tag contains DT changes only and is based on Simon's latest
>> > devel branch. Nothing special there, it should just not make it to
>> > mainline before the driver changes get accepted.
>> >
>> > The following changes since commit
> 2537532db23bdd9ecd2c1c956ac430a9a08738a8:
>> >   Merge branch 'arm64-dt-for-v4.12' into devel (2017-03-02 16:02:44 +0100)
>> >
>> > are available in the git repository at:
>> >   git://linuxtv.org/pinchartl/media.git tags/drm-next-dt-v3-20170306
>> >
>> > for you to fetch changes up to 111e8637fa9ad8261c25d437255c16f8e4e57116:
>> >   ARM: shmobile: dts: Switch to panel-lvds bindings for Mitsubishi panels
>> >
>> > (2017-03-06 02:12:00 +0200)
>>
>> Dropped, too many conflicts ("Simon's latest devel branch", from 8 weeks
>> ago).
>
> I thought the whole purpose of providing separate branches for DT integration
> was to allow you to resolve the conflicts ?

The purpose was to avoidhaving to rebase everything (driver and DT)
when only one part needs to be rebased.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

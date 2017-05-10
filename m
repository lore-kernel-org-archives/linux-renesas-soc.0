Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:34615 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751235AbdEJI3s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 04:29:48 -0400
Received: by mail-io0-f179.google.com with SMTP id k91so8864665ioi.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 01:29:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <f84580b8-06b6-5476-51bf-b9ab76add982@ideasonboard.com>
References: <1494348424-18246-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdVyCSgGZ1QcKaXeq6kjJBZJ8P4L0vmzDePk-o2HQwerXA@mail.gmail.com> <f84580b8-06b6-5476-51bf-b9ab76add982@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2017 10:29:46 +0200
Message-ID: <CAMuHMdVS49MgttuHL6-ZHck8OJdghg0oPfR31OOnGSOaJaJLpQ@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] v4l: vsp1: writeback prototype
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Wed, May 10, 2017 at 10:27 AM, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>>> v3:
>>>  - Rebased to v4.12-rc1
>>
>> Interesting... Where can I find v4.12-rc1? ;-)
>>
>> I see this is based on an arbitrary commit in Linus' tree instead?
>> While that's OK for renesas-drivers, you never want to do this for a
>> pull request you
>> sent to an upstream maintainer.
>
> Sorry - that was meant to say rebased in preparation for v4.12-rc1 ...

OK.

> As are the others of course.
> This was the point at which both DRM and V4L had been merged, and I was able to
> rebase my work on top of those as a constant representative base.
>
> If it's better I can resend pull requests after v4.12-rc1 is out ... but the
> window between then, and your integration is only one day! so I've just been
> sending these out as I've refreshed and tested them.

No need to refresh, until something Really Bad happens w.r.t. merge conflicts.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

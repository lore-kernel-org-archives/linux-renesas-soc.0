Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35231 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751753AbdFMJKo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jun 2017 05:10:44 -0400
Received: by mail-it0-f67.google.com with SMTP id f20so3132187itb.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jun 2017 02:10:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <94f3eac8-4840-d027-d80b-cc95ca76c041@ideasonboard.com>
References: <1497314657-15984-1-git-send-email-kbingham@kernel.org>
 <CAMuHMdXCALSt68C6QM95Xb7_hjUBqg6op5+uBWyJVMAREfY0AQ@mail.gmail.com> <94f3eac8-4840-d027-d80b-cc95ca76c041@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jun 2017 11:10:42 +0200
Message-ID: <CAMuHMdX9xaviqkhScwRVCMd73H2sLvfMdpXfZG3dM2Yrq1GVCg@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] media: ADV748x driver
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Kieran Bingham <kbingham@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Tue, Jun 13, 2017 at 11:06 AM, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>>>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/kbingham/rcar.git adv748x/for-renesas-drivers
>>
>> BTW, most people prefer "git://git.kernel.org/..."
>
> Ah yes, I keep getting caught up by this.
>
> All I do is:
>
>   git request-pull linux-media/master kernel.org adv748x/for-renesas-drivers
> (or such), which is of course my URL for push access to kernel.org
>
> How do you handle this? Do you have a separate remote for pull requests? or just
> update the text manually?

My .git/config has:

    [remote "renesas-drivers"]
            url =
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
            pushurl =
gitolite.kernel.org:/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

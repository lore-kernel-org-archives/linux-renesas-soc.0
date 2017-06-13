Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59179 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752268AbdFMJXk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jun 2017 05:23:40 -0400
Subject: Re: [GIT PULL FOR renesas-drivers] media: ADV748x driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1497314657-15984-1-git-send-email-kbingham@kernel.org>
 <CAMuHMdXCALSt68C6QM95Xb7_hjUBqg6op5+uBWyJVMAREfY0AQ@mail.gmail.com>
 <94f3eac8-4840-d027-d80b-cc95ca76c041@ideasonboard.com>
 <CAMuHMdX9xaviqkhScwRVCMd73H2sLvfMdpXfZG3dM2Yrq1GVCg@mail.gmail.com>
Cc: Kieran Bingham <kbingham@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <0a7285f3-726e-01d3-5012-41b181d143a3@ideasonboard.com>
Date: Tue, 13 Jun 2017 10:23:36 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX9xaviqkhScwRVCMd73H2sLvfMdpXfZG3dM2Yrq1GVCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 13/06/17 10:10, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Tue, Jun 13, 2017 at 11:06 AM, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
>>>>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/kbingham/rcar.git adv748x/for-renesas-drivers
>>>
>>> BTW, most people prefer "git://git.kernel.org/..."
>>
>> Ah yes, I keep getting caught up by this.
>>
>> All I do is:
>>
>>   git request-pull linux-media/master kernel.org adv748x/for-renesas-drivers
>> (or such), which is of course my URL for push access to kernel.org
>>
>> How do you handle this? Do you have a separate remote for pull requests? or just
>> update the text manually?
> 
> My .git/config has:
> 
>     [remote "renesas-drivers"]
>             url =
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
>             pushurl =
> gitolite.kernel.org:/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Excellent - there had to be a trick somewhere :)

Thanks - I'll apply the same to my configs

--
Kieran.



> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

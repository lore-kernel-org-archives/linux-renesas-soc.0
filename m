Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:36057 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752632AbdEQHnX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 May 2017 03:43:23 -0400
Received: by mail-it0-f42.google.com with SMTP id o5so76459955ith.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 May 2017 00:43:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87d1b83pjk.wl%kuninori.morimoto.gx@renesas.com>
References: <CAMuHMdXyc0Kt2Ec-k5xeJYTCpzoFfhEO_bbF1w2tUbyiRikR0w@mail.gmail.com>
 <87pof846ie.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdW7JpNao7jik5nFg3NxyWvs180YRWucA4co7_hLGomSUQ@mail.gmail.com>
 <87d1b83pjk.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 May 2017 09:43:11 +0200
Message-ID: <CAMuHMdVGBgGYzR3kHqwU6-9QTyU=L_FiyBVr+1FjNgDVYRd72A@mail.gmail.com>
Subject: Re: ASoC: rsnd: fix sound route path when using SRC6/SRC9
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Wed, May 17, 2017 at 9:38 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> > Hmm....
>> > I tried random code/compile, but gcc behavior seems strange.
>> > Fore example if I removed next line, this warning disappeard
>> >
>> > -               data = path[rsnd_mod_id(src)] |
>> > -                       cmd_case[rsnd_mod_id(src)] << 16;
>> > +               data = path[rsnd_mod_id(src)];
>> >
>> > Is this related to this ?
>> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59124
>>
>> Perhaps.
>>
>> I guess the main question is: can src be NULL here?
>> If yes, rsnd_mod_id(src) will be -1.
>
> No. cmd itself will not be used if src was NULL on this HW.

But gcc cannot know that, as the function is called through a function
pointer from another source file.

> But, yes, it seems gcc is checking -1 value here.
> It is OK, but why it warns only here ??

Yes, I'm also wondering why we see the warning only here.
I guess we should be lucky that we get it at least in one place ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:33083 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388352AbeGWPhQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 11:37:16 -0400
MIME-Version: 1.0
References: <CAMuHMdUENK1Zwgv2_2yiyp9wfqgwb=N5yCUZHp-uQ0NU9pX=wQ@mail.gmail.com>
 <CAOtvUMc-MxerchqR9B-+yS5PEjRLvn0Nm21MUo_gaQq_MPeCVQ@mail.gmail.com>
 <CAMuHMdVFwG2t22+TX5kvZL-5NQ2BLA7kq6fbwSFjbqPkiU46Eg@mail.gmail.com>
 <CAOtvUMfNnhE-X_S+m6j2i3cVVk_7vwo=bsgWd7zPi5onGSoLyA@mail.gmail.com> <CAOtvUMeU17v=GT3fo8uP0Lt=Wxp6jj4aD_xs87EqTiuxVOkTBA@mail.gmail.com>
In-Reply-To: <CAOtvUMeU17v=GT3fo8uP0Lt=Wxp6jj4aD_xs87EqTiuxVOkTBA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jul 2018 16:35:30 +0200
Message-ID: <CAMuHMdWmm3_02BvQHfTSCVywQ-_W9_h62qBUr9datqycF40kUQ@mail.gmail.com>
Subject: Re: CCREE performance on R-Car H3 + crash
To: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Gilad,

On Mon, Jul 23, 2018 at 4:25 PM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> On Mon, Jul 23, 2018 at 1:31 PM, Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> > On Mon, Jul 23, 2018 at 12:55 PM, Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> >> CC linux-crypto for the crash log.
> >>
> >> On Sun, Jul 22, 2018 at 7:28 AM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> >>> On Thu, Jul 19, 2018 at 3:43 PM, Geert Uytterhoeven
> >>> <geert@linux-m68k.org> wrote:
> >>> > I've noticed CCREE is used with a LUKS-formatted disk, so I did some small
> > ...
> >>
> >> $ cryptsetup benchmark
> >> # Tests are approximate using memory only (no storage IO).
> >> PBKDF2-sha1       478364 iterations per second for 256-bit key
> >> PBKDF2-sha256     927943 iterations per second for 256-bit key
> >> PBKDF2-sha512     360583 iterations per second for 256-bit key
> >> PBKDF2-ripemd160  266677 iterations per second for 256-bit key
> >> PBKDF2-whirlpool  115787 iterations per second for 256-bit key
> >> #  Algorithm | Key |  Encryption |  Decryption
> >>      aes-cbc   128b    46.0 MiB/s    46.7 MiB/s
> >>  serpent-cbc   128b           N/A           N/A
> >>  twofish-cbc   128b           N/A           N/A
> >>      aes-cbc   256b    46.5 MiB/s    46.4 MiB/s
> >>  serpent-cbc   256b           N/A           N/A
> >>  twofish-cbc   256b           N/A           N/A
> >> Segmentation fault
> >>
> >> Oops.
> >>
> >> ccree e6601000.crypto: Unsupported data size 65536.
> >> Unable to handle kernel paging request at virtual address ffffffbf5c3c3c20
> >
> > Oy. Thank you for reporting this. I'll take a look at what is going on ASAP.
>
> hmm... well, the plot thickens.
>
> I was able to recreate the "Unsupported data size 65536" message and
> now trying to understand
> why the check that causes it is there but - I wasn't able to get a
> crash, nor do I understand why
> this condition would result in a crash (it ends up returning -EINVAL)... :-(
>
> I am surely using a different tree though - I'm based on the
> cryptodev/master tree with cherry picking of just R-Car ccree clocks
> and enabling.
>
> I was thinking maybe it's a fix that is already in upstream cryptodev
> tree but not in your tree but didn't manage to identify any obvious
> suspects
>
> What tree are you based off?

My tree is based on renesas-drivers-2018-07-17-v4.18-rc5 from
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/

Do you want me to try something different?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

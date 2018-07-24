Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f174.google.com ([209.85.217.174]:41380 "EHLO
        mail-ua0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388364AbeGXIhz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 04:37:55 -0400
Received: by mail-ua0-f174.google.com with SMTP id t14-v6so2132066uao.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jul 2018 00:32:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWmm3_02BvQHfTSCVywQ-_W9_h62qBUr9datqycF40kUQ@mail.gmail.com>
References: <CAMuHMdUENK1Zwgv2_2yiyp9wfqgwb=N5yCUZHp-uQ0NU9pX=wQ@mail.gmail.com>
 <CAOtvUMc-MxerchqR9B-+yS5PEjRLvn0Nm21MUo_gaQq_MPeCVQ@mail.gmail.com>
 <CAMuHMdVFwG2t22+TX5kvZL-5NQ2BLA7kq6fbwSFjbqPkiU46Eg@mail.gmail.com>
 <CAOtvUMfNnhE-X_S+m6j2i3cVVk_7vwo=bsgWd7zPi5onGSoLyA@mail.gmail.com>
 <CAOtvUMeU17v=GT3fo8uP0Lt=Wxp6jj4aD_xs87EqTiuxVOkTBA@mail.gmail.com> <CAMuHMdWmm3_02BvQHfTSCVywQ-_W9_h62qBUr9datqycF40kUQ@mail.gmail.com>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Tue, 24 Jul 2018 10:32:47 +0300
Message-ID: <CAOtvUMcZBG-uw8r06=rBRkd+SL_9Pz1WV6zxRbcDj2DXC9Oa1Q@mail.gmail.com>
Subject: Re: CCREE performance on R-Car H3 + crash
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 23, 2018 at 5:35 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Gilad,
>
> On Mon, Jul 23, 2018 at 4:25 PM Gilad Ben-Yossef <gilad@benyossef.com> wr=
ote:
>> On Mon, Jul 23, 2018 at 1:31 PM, Gilad Ben-Yossef <gilad@benyossef.com> =
wrote:
>> > On Mon, Jul 23, 2018 at 12:55 PM, Geert Uytterhoeven
>> > <geert@linux-m68k.org> wrote:
>> >> CC linux-crypto for the crash log.
>> >>
>> >> On Sun, Jul 22, 2018 at 7:28 AM Gilad Ben-Yossef <gilad@benyossef.com=
> wrote:
>> >>> On Thu, Jul 19, 2018 at 3:43 PM, Geert Uytterhoeven
>> >>> <geert@linux-m68k.org> wrote:
>> >>> > I've noticed CCREE is used with a LUKS-formatted disk, so I did so=
me small
>> > ...
>> >>
>> >> $ cryptsetup benchmark
>> >> # Tests are approximate using memory only (no storage IO).
>> >> PBKDF2-sha1       478364 iterations per second for 256-bit key
>> >> PBKDF2-sha256     927943 iterations per second for 256-bit key
>> >> PBKDF2-sha512     360583 iterations per second for 256-bit key
>> >> PBKDF2-ripemd160  266677 iterations per second for 256-bit key
>> >> PBKDF2-whirlpool  115787 iterations per second for 256-bit key
>> >> #  Algorithm | Key |  Encryption |  Decryption
>> >>      aes-cbc   128b    46.0 MiB/s    46.7 MiB/s
>> >>  serpent-cbc   128b           N/A           N/A
>> >>  twofish-cbc   128b           N/A           N/A
>> >>      aes-cbc   256b    46.5 MiB/s    46.4 MiB/s
>> >>  serpent-cbc   256b           N/A           N/A
>> >>  twofish-cbc   256b           N/A           N/A
>> >> Segmentation fault
>> >>
>> >> Oops.
>> >>
>> >> ccree e6601000.crypto: Unsupported data size 65536.
>> >> Unable to handle kernel paging request at virtual address ffffffbf5c3=
c3c20
>> >
>> > Oy. Thank you for reporting this. I'll take a look at what is going on=
 ASAP.
>>
>> hmm... well, the plot thickens.
>>
>> I was able to recreate the "Unsupported data size 65536" message and
>> now trying to understand
>> why the check that causes it is there but - I wasn't able to get a
>> crash, nor do I understand why
>> this condition would result in a crash (it ends up returning -EINVAL)...=
 :-(
>>
>> I am surely using a different tree though - I'm based on the
>> cryptodev/master tree with cherry picking of just R-Car ccree clocks
>> and enabling.
>>
>> I was thinking maybe it's a fix that is already in upstream cryptodev
>> tree but not in your tree but didn't manage to identify any obvious
>> suspects
>>
>> What tree are you based off?
>
> My tree is based on renesas-drivers-2018-07-17-v4.18-rc5 from
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
/
>
> Do you want me to try something different?

I've tried booting your tree and see the same behavior - "Unsupported
data size" error message but no crash.

I'm running on an Savator-X R-Car H3 ES1.0 board.

Not really sure how to proceed.

Maybe you can send me your exact .config file?

Thanks,
Gilad



--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!

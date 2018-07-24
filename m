Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f169.google.com ([209.85.217.169]:38011 "EHLO
        mail-ua0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388506AbeGXPdF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 11:33:05 -0400
Received: by mail-ua0-f169.google.com with SMTP id o11-v6so2868615uak.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jul 2018 07:26:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVFwG2t22+TX5kvZL-5NQ2BLA7kq6fbwSFjbqPkiU46Eg@mail.gmail.com>
References: <CAMuHMdUENK1Zwgv2_2yiyp9wfqgwb=N5yCUZHp-uQ0NU9pX=wQ@mail.gmail.com>
 <CAOtvUMc-MxerchqR9B-+yS5PEjRLvn0Nm21MUo_gaQq_MPeCVQ@mail.gmail.com> <CAMuHMdVFwG2t22+TX5kvZL-5NQ2BLA7kq6fbwSFjbqPkiU46Eg@mail.gmail.com>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Tue, 24 Jul 2018 17:26:19 +0300
Message-ID: <CAOtvUMcq2PipfguwZhLdt-eG1Y=CY+W6tTXBKwUGHbFLz4ajtA@mail.gmail.com>
Subject: Re: CCREE performance on R-Car H3 + crash
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 23, 2018 at 12:55 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Gilad,
>
> CC linux-crypto for the crash log.
>
> On Sun, Jul 22, 2018 at 7:28 AM Gilad Ben-Yossef <gilad@benyossef.com> wr=
ote:
>> On Thu, Jul 19, 2018 at 3:43 PM, Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>> > I've noticed CCREE is used with a LUKS-formatted disk, so I did some s=
mall
>> > performance benchmarks.  The disk is an old 160 GiB SATA hard drive,
>> > connected to either Salvator-XS (R-Car H3 ES2.0) or Koelsch (R-Car M2-=
W).
>> >
>> > hdparm -t /dev/sda (unencrypted data): 62 MB/s (both systems)
>> >
>> > hdparm -t /dev/dm-0 (encrypted data, LUKS AES):
>> >
>> >     salvator-xs (CCREE): 15 MB/s
>> >     salvator-xs (SW):    62 MB/s
>> >     koelsch (SW):        47 MB/s
>> >
>> > I'm a bit disappointment by the results when using crypto acceleration=
.
>> > Apparently the in-kernel optimized arm64 implementation can decrypt at
>> > raw read speed, while CCREE can't keep up.
>>
>> Interesting. What is the encryption sector size used?
>
> crypt_config.sector_size is 512.
>
>> If it is he default of 512 bytes, you might want to try setting the
>> new block_size DM-Crypt option. I believe it will have a large effect
>> on the result.
>
> Where do I specifiy that option? I couldn't find it.

It seems my memory of the config option name failed me,
I was referring to the the sector_size and iv_large_sectors options
of dm-crypt.



> Is that compatible with the encrypted media that's already in use?

No, if you created the media with 512 sector size than obviously trying to =
mount
with a different sector size will not work.

There is a discussion right now in the MD mailing list about changes
to DM-Crypt so that
you don't have to change the sector size and still work with larger
buffers if the HW supports
auto increment the sector number in the IV, as CryptoCell indeed knows
how to do in a newer
revision of the HW than the one that is found in the R-Car, but that
won't help us here, alas.

Thanks,
Gilad


--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!

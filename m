Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f180.google.com ([209.85.217.180]:32997 "EHLO
        mail-ua0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbeGVGYP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Jul 2018 02:24:15 -0400
Received: by mail-ua0-f180.google.com with SMTP id i4-v6so9838197uak.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Jul 2018 22:28:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUENK1Zwgv2_2yiyp9wfqgwb=N5yCUZHp-uQ0NU9pX=wQ@mail.gmail.com>
References: <CAMuHMdUENK1Zwgv2_2yiyp9wfqgwb=N5yCUZHp-uQ0NU9pX=wQ@mail.gmail.com>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Sun, 22 Jul 2018 08:28:50 +0300
Message-ID: <CAOtvUMc-MxerchqR9B-+yS5PEjRLvn0Nm21MUo_gaQq_MPeCVQ@mail.gmail.com>
Subject: Re: CCREE performance on R-Car H3
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thu, Jul 19, 2018 at 3:43 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Gilad,
>
> I've noticed CCREE is used with a LUKS-formatted disk, so I did some smal=
l
> performance benchmarks.  The disk is an old 160 GiB SATA hard drive,
> connected to either Salvator-XS (R-Car H3 ES2.0) or Koelsch (R-Car M2-W).
>
> hdparm -t /dev/sda (unencrypted data): 62 MB/s (both systems)
>
> hdparm -t /dev/dm-0 (encrypted data, LUKS AES):
>
>     salvator-xs (CCREE): 15 MB/s
>     salvator-xs (SW):    62 MB/s
>     koelsch (SW):        47 MB/s
>
> I'm a bit disappointment by the results when using crypto acceleration.
> Apparently the in-kernel optimized arm64 implementation can decrypt at
> raw read speed, while CCREE can't keep up.

Interesting. What is the encryption sector size used?
If it is he default of 512 bytes, you might want to try setting the
new block_size DM-Crypt option. I believe it will have a large effect
on the result.


> Is this expected, and in line with your experiences?

Well, if you were indeed using the default 512 bytes and taking into
account that sadly the CryptoCell inside the R-Car is not wired to
utilize a coherent bus (the cache invalidation costs a fortune in
performance) it is not unexpected.

When reasoning about these things it is worth taking into account that
the design target of using CryptoCell is not to get the absolute best
raw performance as such but rather to get good performance / per cycle
/ per watt.

When the Arm AES Crypto Extension is used (I assume you are using that
and not, say, the NEON implementation) I expect the raw performance to
always be better than CryptoCell, certainly when it is not attached to
a coherent bus. However, if you check CPU utilization during the
operation (basically how much encryption is "stealing" computation
power from the CPU) and subsequent power consumption you are supposed
to see that there is a large area of work loads where it makes more
sense to utilize CryptoCell for disk encryption and use the CPU for
something else.

... in theory, at least. :-)

We've just in the middle of an office move here, but I hope things
will settle down during the ween and I'll be able to replicate your
test and see if I can advise better, but certainly using 4k encryption
section size is key, otherwise the overhead just kills everything.

Thanks!
Gilad
--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!

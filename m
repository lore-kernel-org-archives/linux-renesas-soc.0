Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f44.google.com ([209.85.213.44]:36498 "EHLO
        mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388043AbeGWLbr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 07:31:47 -0400
Received: by mail-vk0-f44.google.com with SMTP id y9-v6so62989vky.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 03:31:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVFwG2t22+TX5kvZL-5NQ2BLA7kq6fbwSFjbqPkiU46Eg@mail.gmail.com>
References: <CAMuHMdUENK1Zwgv2_2yiyp9wfqgwb=N5yCUZHp-uQ0NU9pX=wQ@mail.gmail.com>
 <CAOtvUMc-MxerchqR9B-+yS5PEjRLvn0Nm21MUo_gaQq_MPeCVQ@mail.gmail.com> <CAMuHMdVFwG2t22+TX5kvZL-5NQ2BLA7kq6fbwSFjbqPkiU46Eg@mail.gmail.com>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Mon, 23 Jul 2018 13:31:14 +0300
Message-ID: <CAOtvUMfNnhE-X_S+m6j2i3cVVk_7vwo=bsgWd7zPi5onGSoLyA@mail.gmail.com>
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
...
>
> $ cryptsetup benchmark
> # Tests are approximate using memory only (no storage IO).
> PBKDF2-sha1       478364 iterations per second for 256-bit key
> PBKDF2-sha256     927943 iterations per second for 256-bit key
> PBKDF2-sha512     360583 iterations per second for 256-bit key
> PBKDF2-ripemd160  266677 iterations per second for 256-bit key
> PBKDF2-whirlpool  115787 iterations per second for 256-bit key
> #  Algorithm | Key |  Encryption |  Decryption
>      aes-cbc   128b    46.0 MiB/s    46.7 MiB/s
>  serpent-cbc   128b           N/A           N/A
>  twofish-cbc   128b           N/A           N/A
>      aes-cbc   256b    46.5 MiB/s    46.4 MiB/s
>  serpent-cbc   256b           N/A           N/A
>  twofish-cbc   256b           N/A           N/A
> Segmentation fault
>
> Oops.
>
> ccree e6601000.crypto: Unsupported data size 65536.
> Unable to handle kernel paging request at virtual address ffffffbf5c3c3c2=
0
>

Oy. Thank you for reporting this. I'll take a look at what is going on ASAP=
.

Gilad

--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!

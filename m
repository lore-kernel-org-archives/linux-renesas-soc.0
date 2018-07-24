Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f41.google.com ([209.85.213.41]:33020 "EHLO
        mail-vk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388395AbeGXPXt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 11:23:49 -0400
Received: by mail-vk0-f41.google.com with SMTP id y70-v6so2107026vkc.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jul 2018 07:17:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUzrd5i-U7Hk-sT3iD+a2S_oPZN3s07fWo7Ln95BYd55A@mail.gmail.com>
References: <CAMuHMdUENK1Zwgv2_2yiyp9wfqgwb=N5yCUZHp-uQ0NU9pX=wQ@mail.gmail.com>
 <CAOtvUMc-MxerchqR9B-+yS5PEjRLvn0Nm21MUo_gaQq_MPeCVQ@mail.gmail.com>
 <CAMuHMdVFwG2t22+TX5kvZL-5NQ2BLA7kq6fbwSFjbqPkiU46Eg@mail.gmail.com>
 <CAOtvUMfNnhE-X_S+m6j2i3cVVk_7vwo=bsgWd7zPi5onGSoLyA@mail.gmail.com>
 <CAOtvUMeU17v=GT3fo8uP0Lt=Wxp6jj4aD_xs87EqTiuxVOkTBA@mail.gmail.com>
 <CAMuHMdWmm3_02BvQHfTSCVywQ-_W9_h62qBUr9datqycF40kUQ@mail.gmail.com>
 <CAOtvUMcZBG-uw8r06=rBRkd+SL_9Pz1WV6zxRbcDj2DXC9Oa1Q@mail.gmail.com> <CAMuHMdUzrd5i-U7Hk-sT3iD+a2S_oPZN3s07fWo7Ln95BYd55A@mail.gmail.com>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Tue, 24 Jul 2018 17:17:06 +0300
Message-ID: <CAOtvUMfCjkhJ6FhkfFzW5=ZXSEn9dUf5KxtAOkE3mJtHgNv0qQ@mail.gmail.com>
Subject: Re: CCREE performance on R-Car H3 + crash
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 24, 2018 at 10:51 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Gilad,
>
> On Tue, Jul 24, 2018 at 9:32 AM Gilad Ben-Yossef <gilad@benyossef.com> wr=
ote:
...
>> I've tried booting your tree and see the same behavior - "Unsupported
>> data size" error message but no crash.
>>
>> I'm running on an Savator-X R-Car H3 ES1.0 board.
>>
>> Not really sure how to proceed.
>>
>> Maybe you can send me your exact .config file?
>
> I cannot reproduce the crash using renesas_defconfig + CONFIG_CRYPTO_DEV_=
CCREE=3Dy
> + CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy.
>
> I can reproduce it on Salvator-X with R-Car H3 ES1.0 and Salvator-XS with
> R-Car H3 ES2.0 using the attached config.
>

OK, found what the problem was (SLAB vs. SLUB is what makes the
problem manifest as a crash, I think).

Just sent fixes to the crypto mailing list. I've spared the Renesas
list since it's not really related to it but CCed you.
I'd be delighted if you can give it a test.


Thank you very much for reporting and assistance!

Gilad

--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34758 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753131AbdHNM7K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2017 08:59:10 -0400
Received: by mail-oi0-f45.google.com with SMTP id x3so83070061oia.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2017 05:59:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170810080624.GF16647@verge.net.au>
References: <1502266866-11277-1-git-send-email-horms+renesas@verge.net.au> <20170810080624.GF16647@verge.net.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Aug 2017 14:59:09 +0200
Message-ID: <CACRpkdYai2x3hD+cm2SvZXtuiw7ZHyvi0+CTvHZKMm0EeYZCbg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: reinstate generic compat string
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 10, 2017 at 10:06 AM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Aug 09, 2017 at 10:21:06AM +0200, Simon Horman wrote:
>> commit d10bbd156926 ("gpio: rcar: add gen[123] fallback compatibility
>> strings") deprecated the generic compat string, renesas,gpio-rcar. After
>> further discussion this appears not to have been desirable as that compa=
t
>> string is compatible with all R-Car SoCs supported in upstream.
>>
>> This commit partially reverts that commit, and updates related
>> documentation and examples.
>>
>> Fixes: d10bbd156926 ("gpio: rcar: add gen[123] fallback compatibility st=
rings")
>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
> Hi Linus,
>
> I believe Geert is on holidays at the moment (maybe you are to=E2=80=BD).

Nah neither of us are as it seems :)

I wait for the two of you to figure this out before applying anything.

Yours,
Linus Walleij

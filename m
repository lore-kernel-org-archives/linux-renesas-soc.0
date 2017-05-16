Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35588 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752118AbdEPJwL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2017 05:52:11 -0400
Received: by mail-it0-f67.google.com with SMTP id 67so14406623itx.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 May 2017 02:52:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVNk=rpHYmrqGbfaGxJ1CM1DGgofZZSgunbvySD3hp3UA@mail.gmail.com>
References: <87efvpw61s.wl%kuninori.morimoto.gx@renesas.com> <CAMuHMdVNk=rpHYmrqGbfaGxJ1CM1DGgofZZSgunbvySD3hp3UA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 May 2017 11:52:09 +0200
Message-ID: <CAMuHMdU6S-uvLZreOeWZb3E9bO+qgqWsMkdGc_OJLreYi_7Zdw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7796: SSI_{WS/SCK}34 -> SSI_{WS/SCK}349
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Tue, May 16, 2017 at 10:50 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, May 16, 2017 at 10:42 AM, Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> R-Car Gen3 is using SSI_{WS/SCK}349 instead of SSI_{WS/SCK}34.
>> But, current code is based on old datasheet which had typo.
>> This patch fixes this typo.
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>> v1 -> v2
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in sh-pfc-for-v4.13.

As I haven't send a pull request yet, I'm moving the definition part of the
rename up, and folded the ssi349_ctrl part into "pinctrl: sh-pfc: r8a7796: Add
Audio clock pin support".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

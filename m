Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:41846 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751628AbeBSIiQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 03:38:16 -0500
Received: by mail-qk0-f179.google.com with SMTP id h129so11266901qke.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2018 00:38:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <b133e895-8d5e-fbae-d15a-5cf759f09406@cogentembedded.com>
References: <b133e895-8d5e-fbae-d15a-5cf759f09406@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Feb 2018 09:38:15 +0100
Message-ID: <CAMuHMdXZY0cC1oV=_Tu5DFu8FJGhw7mZd=P+_4U4VAX629EqEg@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: r8a77970-sysc: fix power area parents
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 16, 2018 at 9:09 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> According to the figure 9.2(b) of the R-Car Series, 3rd Generation User=
=E2=80=99s
> Manual: Hardware Rev. 0.80 the A2IRn and A2SCn power areas in R8A77970 ha=
ve
> the A3IR area as a parent, thus the SYSC driver has those parents wrong..=
.
>
> Fixes: bab9b2a74fe9 ("soc: renesas: rcar-sysc: add R8A77970 support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Sorry for missing this in my original review.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

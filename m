Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbeLGUl6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 15:41:58 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20181206215858.3880-1-sboyd@kernel.org> <20181206215858.3880-2-sboyd@kernel.org> <CAMuHMdVWbcoVr9E9nmKvhrUAAf4817wEQnQ6QrF1sWeHpgL_2g@mail.gmail.com>
Subject: Re: [PATCH 1/8] clk: renesas: Remove usage of CLK_IS_BASIC
Cc: Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <154421531739.168715.18141681984476948631@swboyd.mtv.corp.google.com>
In-Reply-To: <CAMuHMdVWbcoVr9E9nmKvhrUAAf4817wEQnQ6QrF1sWeHpgL_2g@mail.gmail.com>
Date: Fri, 07 Dec 2018 12:41:57 -0800
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-12-07 00:27:11)
> Hi Stephen,
>=20
> On Thu, Dec 6, 2018 at 10:59 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > This flag doesn't look to be used by any code, just set in various clk
> > init structures and then never tested again. Remove it from these
> > drivers as it doesn't provide any benefit.
> >
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: <linux-renesas-soc@vger.kernel.org>
> > Signed-off-by: Stephen Boyd <sboyd@kernel.org>
>=20
> Thanks!
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> I assume you want to apply this yourself, with the rest of the series?
>=20

Yes I'll apply it to clk-next. Thanks.

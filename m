Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731321AbeGZRZT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 13:25:19 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180726152524.9393-1-geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20180726152524.9393-1-geert+renesas@glider.be>
Message-ID: <153262126901.48062.3465085338628890690@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Rename rint to .r
Date: Thu, 26 Jul 2018 09:07:49 -0700
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-07-26 08:25:24)
> All other internal clock names have a period prepended.
> =

> Hence rename the internal RCLK from "rint" to ".r", and move it to the
> section where all other internal clocks are defined.
> =

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

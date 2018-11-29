Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726344AbeK3JAF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 04:00:05 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181128183702.231609-1-sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20181128183702.231609-1-sboyd@kernel.org>
Message-ID: <154352839199.88331.15535776216408804452@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: renesas: Mark rza2_cpg_clk_register static
Date: Thu, 29 Nov 2018 13:53:11 -0800
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Quoting Stephen Boyd (2018-11-28 10:37:02)
> This is only used in this file, so mark it static to silence a sparse
> warning.
> =

> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

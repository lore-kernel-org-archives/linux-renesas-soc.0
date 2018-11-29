Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbeK3I4a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 03:56:30 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Message-ID: <154352817823.88331.1370701337973571144@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 00/13] clk: renesas: Miscellaneous fixes
Date: Thu, 29 Nov 2018 13:49:38 -0800
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-11-29 02:49:55)
>         Hi Mike, Stephen, Laurent, Kieran,
> =

> This patch series contains several fixes for the Renesas Clock drivers
> and DT bindings, and a small simplification:
>   - Removal of non-existent clocks,
>   - Addition of the CPEX clocks, which can be used a source for a timer
>     (CMT1),
>   - Correction of DU parent clocks.
> Most of these have been found by skimming the Hardware Manual Errata.
> =

> This has been boot-tested on Salvator-X(S) (R-Car H3, M3-W, M3-N), Eagle
> (R-Car V3M), and Draak (R-Car D3), except for the DU parts.
> Testing of the DU on R-Car D3 and E3 would be appreciated, as the DU
> driver may have a workaround for the incorrect parent clock rates.
> =

> I intend to queue this in clk-renesas-for-v4.21.
> =


Ok. For the whole series:

Acked-by: Stephen Boyd <sboyd@kernel.org>

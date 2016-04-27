Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38054 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752437AbcD0OGK (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 10:06:10 -0400
Received: by mail-wm0-f49.google.com with SMTP id u206so51217888wme.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Apr 2016 07:06:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1461654582-668-1-git-send-email-geert+renesas@glider.be>
References: <1461654582-668-1-git-send-email-geert+renesas@glider.be>
Date: Wed, 27 Apr 2016 16:06:08 +0200
Message-ID: <CAPDyKFofkVaXPO013rES6FYQrtWRRFWBOqSETaqT8Q7VisHuqA@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: renesas: Clock Domain fixes
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Kevin Hilman <khilman@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 26 April 2016 at 09:09, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>         Hi Mike, Stephen,
>
> This patch series contains fixes for the Renesas CPG/MSTP and CPG/MSSR
> Clock Domains:
>   1. Postpone calls to pm_genpd_init(), as all local setup of the
>      generic_pm_domain structure should have been completed before
>      calling pm_genpd_init(),
>   2. Use always-on governor for Clock Domains, to prevent their status
>      from being shown as "off-0" in
>      /sys/kernel/debug/pm_genpd/pm_genpd_summary.
>
> I plan to queue these up with other clock updates in
> clk-renesas-for-v4.7, and send a pull request later.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (4):
>   clk: renesas: mstp: Postpone call to pm_genpd_init()
>   clk: renesas: mstp: Use always-on governor for Clock Domain
>   clk: renesas: cpg-mssr: Postpone call to pm_genpd_init()
>   clk: renesas: cpg-mssr: Use always-on governor for Clock Domain
>
>  drivers/clk/renesas/clk-mstp.c         | 3 +--
>  drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)

For the series:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

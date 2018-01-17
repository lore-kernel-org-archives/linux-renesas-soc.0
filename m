Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from cloudserver094114.home.pl ([79.96.170.134]:64999 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752610AbeAQLRP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 06:17:15 -0500
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Vinod Koul <vinod.koul@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Dan Williams <dan.j.williams@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        dmaengine@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dmaengine: rcar-dmac: Make DMAC reinit during system resume explicit
Date: Wed, 17 Jan 2018 12:15:55 +0100
Message-ID: <2226167.p7nrZLn7KR@aspire.rjw.lan>
In-Reply-To: <20180117101917.GN18649@localhost>
References: <1516181908-16930-1-git-send-email-geert+renesas@glider.be> <20180117101917.GN18649@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, January 17, 2018 11:19:17 AM CET Vinod Koul wrote:
> On Wed, Jan 17, 2018 at 10:38:28AM +0100, Geert Uytterhoeven wrote:
> > The current (empty) system sleep callbacks rely on the PM core to force
> > a runtime resume to reinitialize the DMAC registers during system
> > resume.  Without a reinitialization, e.g. SCIF DMA will hang silently
> > after a system resume on R-Car Gen3.
> > 
> > Make this explicit by using pm_runtime_force_{suspend,resume}() as the
> > system sleep callbacks instead.  Use SET_LATE_SYSTEM_SLEEP_PM_OPS() as
> > DMA engines must be initialized before all DMA slave devices.
> > 
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This is a dependency for "[PATCH 1/2] PM / genpd: Stop/start devices
> > without pm_runtime_force_suspend/resume()"
> > (https://www.spinics.net/lists/kernel/msg2696802.html), so perhaps it
> > makes most sense if Rafael takes it through the PM tree?
> 
> Sounds okay to me.
> 
> Acked-By: Vinod Koul <vinod.koul@intel.com>

OK, so I'll take it.

Thanks!

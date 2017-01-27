Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58825 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754448AbdA0IlS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 03:41:18 -0500
Date: Fri, 27 Jan 2017 09:40:38 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v6 0/3] mmc: sh_mobile_sdhi: fix missing r7s72100 clocks
Message-ID: <20170127084038.GI21195@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485443632-22612-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1485442486-18427-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1485442469-18378-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1485442460-18339-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1485442449-18300-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <SG2PR06MB1165AEC165D52358154B5EE38A770@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170126101211.GB1435@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 11:12:11AM +0100, Wolfram Sang wrote:
> 
> > Thanks, applied patch1 and patch2 for next. Patch3 is for Simon, I
> > guess!? (And I can add Rob's ack afterwards).
> 
> Can you add my tags as well. They got dropped somehow:
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

On Thu, Jan 26, 2017 at 12:53:10PM +0000, Chris Brandt wrote:
> Hi Simon,
> 
> On Thursday, January 26, 2017, Simon Horman wrote:
> > > Thanks, applied patch1 and patch2 for next. Patch3 is for Simon, I
> > > guess!? (And I can add Rob's ack afterwards).
> > 
> > Thanks, I will take care of the 3rd patch.
> > 
> > Chris, is it safe to apply the 3rd patch without the first 2 patches
> > present?
> 
> Yes, it is safe.

Thanks, I have queued this up for v4.12 with Wolfram's tag.

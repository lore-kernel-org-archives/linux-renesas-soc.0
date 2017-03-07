Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:35787 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755019AbdCGKhV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 05:37:21 -0500
Received: by mail-lf0-f53.google.com with SMTP id j90so48056014lfk.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Mar 2017 02:37:20 -0800 (PST)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Tue, 7 Mar 2017 11:28:08 +0100
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-pm@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH 1/7] thermal: rcar_gen3_thermal: add delay in
 .thermal_init on r8a7796
Message-ID: <20170307102808.GI20587@bigcity.dyn.berto.se>
References: <20170306200401.29923-1-niklas.soderlund+renesas@ragnatech.se>
 <20170306200401.29923-2-niklas.soderlund+renesas@ragnatech.se>
 <98691387-0546-4884-b0ae-09814b7964d0@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98691387-0546-4884-b0ae-09814b7964d0@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

HI Sergei,

Thanks will update for v2.

On 2017-03-07 12:49:25 +0300, Sergei Shtylyov wrote:
> On 3/6/2017 11:03 PM, Niklas S�derlund wrote:
> 
> > The .thermal_init needs to be delayed a short amount of to allow for the
> 
>    Amount of what? :-)
> 
> > TEMP register to contain something useful. If it's not delayed theses
> 
>    These.
> 
> > warnings are common during boot:
> > 
> > thermal thermal_zone0: failed to read out thermal zone (-5)
> > thermal thermal_zone1: failed to read out thermal zone (-5)
> > thermal thermal_zone2: failed to read out thermal zone (-5)
> > 
> > The warnings are triggered by the first call to .get_temp while the TEMP
> > register contains 0 and rcar_gen3_thermal_get_temp() returns -EIO since
> > a TEMP value of 0 will result in a temperature reading which is out of
> > specifications.
> > 
> > This should have been done in the initial commit which adds the driver
> > as the same issue was found and corrected for r8a7795.
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> [...]
> 
> MBR, Sergei
> 

-- 
Regards,
Niklas S�derlund

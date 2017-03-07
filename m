Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:40804 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754954AbdCGTve (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 14:51:34 -0500
Date: Tue, 7 Mar 2017 20:51:22 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-pm@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH 1/7] thermal: rcar_gen3_thermal: add delay in
 .thermal_init on r8a7796
Message-ID: <20170307195122.GA2554@tetsubishi>
References: <20170306200401.29923-1-niklas.soderlund+renesas@ragnatech.se>
 <20170306200401.29923-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170306200401.29923-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 06, 2017 at 09:03:55PM +0100, Niklas Söderlund wrote:
> The .thermal_init needs to be delayed a short amount of to allow for the
> TEMP register to contain something useful. If it's not delayed theses
> warnings are common during boot:
> 
> thermal thermal_zone0: failed to read out thermal zone (-5)
> thermal thermal_zone1: failed to read out thermal zone (-5)
> thermal thermal_zone2: failed to read out thermal zone (-5)
> 
> The warnings are triggered by the first call to .get_temp while the TEMP
> register contains 0 and rcar_gen3_thermal_get_temp() returns -EIO since
> a TEMP value of 0 will result in a temperature reading which is out of
> specifications.
> 
> This should have been done in the initial commit which adds the driver
> as the same issue was found and corrected for r8a7795.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

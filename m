Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35592 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751180AbcLMDb1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 22:31:27 -0500
Date: Mon, 12 Dec 2016 19:31:26 -0800
From: Eduardo Valentin <edubezval@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Cc: linux-pm@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCHv5 5/5] thermal: rcar_gen3_thermal: Add delay in
 .thermal_init on r8a7795
Message-ID: <20161213033125.GA11329@localhost.localdomain>
References: <20161212141805.14946-1-niklas.soderlund@ragnatech.se>
 <20161212141805.14946-6-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20161212141805.14946-6-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 12, 2016 at 03:18:05PM +0100, Niklas S�derlund wrote:
> From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> The .thermal_init needs to be delayed a short amount of time after
> setting REG_GEN3_CTSR to allow for the TEMP register to contain
> something useful. If it's not delayed theses warnings are common during
> boot:
> 
> thermal thermal_zone0: failed to read out thermal zone (-5)
> thermal thermal_zone1: failed to read out thermal zone (-5)
> thermal thermal_zone2: failed to read out thermal zone (-5)
> 
> The warnings are triggered by the first call to .get_temp while the TEMP
> register contains 0 and rcar_gen3_thermal_get_temp() returns -EIO since
> a TEMP value of 0 will result in a temperature reading which is out of
> specifications.

I think this one can be folded on patch 2/5.

Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E146BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 07:46:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AFF4421720
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 07:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="iVPZBWXA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725320AbeLTHqZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 02:46:25 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:57622 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbeLTHqY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 02:46:24 -0500
Received: from penelope.horms.nl (softbank060150141248.bbtec.net [60.150.141.248])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5496F25B770;
        Thu, 20 Dec 2018 18:46:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545291982; bh=WjZCsSp4nh+nJvHrxkZ3xKodmxIZTMnpDs/yIUva7Z4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iVPZBWXA+jWy98AB+DswiXdZk8hqxQysOtKw6pLJpNcejF4txPOA4dAtQ2NBy2Og6
         XN4aXtTcAeS7KQwiexFt8w4MUMpu5WMRF+uIyp+hyO/stYWe0QUmKENZZ5HHHpWeaH
         iuA1G3BJ9An3mc1TDmn+71a77GijC9xlaM2aFMbk=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id E1265E218FB; Wed, 19 Dec 2018 23:46:20 -0800 (PST)
Date:   Thu, 20 Dec 2018 16:46:20 +0900
From:   Simon Horman <horms@verge.net.au>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH V3 5/6] thermal: rcar_thermal: Convert to
 devm_thermal_zone_of_sensor_register_params()
Message-ID: <20181220074620.x54vni4lextgbsyf@verge.net.au>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-6-marek.vasut@gmail.com>
 <20181218110557.rrkrurhuruvzfak2@verge.net.au>
 <67eeeefa-10a4-e7b3-244c-e82f785e592c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67eeeefa-10a4-e7b3-244c-e82f785e592c@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 20, 2018 at 12:25:17AM +0100, Marek Vasut wrote:
> On 12/18/2018 12:05 PM, Simon Horman wrote:
> > On Mon, Dec 17, 2018 at 04:56:43PM +0100, marek.vasut@gmail.com wrote:
> >> From: Marek Vasut <marek.vasut@gmail.com>
> >>
> >> Convert the rcar code to devm_thermal_zone_of_sensor_register_params(),
> >> no functional change.
> >>
> >> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> >> Cc: Eduardo Valentin <edubezval@gmail.com>
> >> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Cc: Zhang Rui <rui.zhang@intel.com>
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> To: linux-pm@vger.kernel.org
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> ---
> >> V2: No change
> >> V3: - Work around the From line and SoB line checkpatch warning
> >>     - Reorder the SoB line at the end
> > 
> > As per v2:
> > 
> > This patch looks good to me, though I'm not sure why { } need
> > to be introduced into the 4th hunk.
> 
> Because it's a multi-line code , even though it's just a single
> line-wrapped function call. I can drop that part, but I think it makes
> it visually far more obvious where the conditional block starts/ends and
> I recall seeing something about this in kernel coding style too.

I lean towards removing {} but I do not feel at all strongly about this.

> 
> [...]
> 
> >> @@ -554,16 +554,20 @@ static int rcar_thermal_probe(struct platform_device *pdev)
> >>  		if (ret < 0)
> >>  			goto error_unregister;
> >>  
> >> -		if (chip->use_of_thermal)
> >> -			priv->zone = devm_thermal_zone_of_sensor_register(
> >> +		if (chip->use_of_thermal) {
> >> +			priv->zone =
> >> +				devm_thermal_zone_of_sensor_register_params(
> >>  						dev, i, priv,
> >> -						&rcar_thermal_zone_of_ops);
> >> -		else
> >> +						&rcar_thermal_zone_of_ops,
> >> +						&rcar_thermal_params);
> >> +		} else {
> >>  			priv->zone = thermal_zone_device_register(
> >>  						"rcar_thermal",
> >>  						1, 0, priv,
> >>  						&rcar_thermal_zone_ops, NULL, 0,
> >>  						idle);
> >> +		}
> >> +
> >>  		if (IS_ERR(priv->zone)) {
> >>  			dev_err(dev, "can't register thermal zone\n");
> >>  			ret = PTR_ERR(priv->zone);
> [...]
> 
> -- 
> Best regards,
> Marek Vasut
> 

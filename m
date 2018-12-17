Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C969AC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E916206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="bYyqGh7l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732237AbeLQLrX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 06:47:23 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39101 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbeLQLrX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 06:47:23 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 685AF25B781;
        Mon, 17 Dec 2018 22:47:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545047240; bh=JdtrjCMgJCEyxVOb/Pt1GLK2314bSNvFHXu8roKP8YQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bYyqGh7l01QVsEVNT1bzramVKZf3QZCy6k7zeWeBkA27kMsJts4l2U5TN1U75fr7R
         QxrRAcqDjKEOcR1+2GamGvepj39AZLAMRssmCSp+8B66JtaKBKogMf8FGzcKlVvuL+
         3sj7RSrfDDQc9CKXi/m8AzWvWgyf9YFSInceQ0L8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id BE20494048A; Mon, 17 Dec 2018 12:47:18 +0100 (CET)
Date:   Mon, 17 Dec 2018 12:47:18 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        David HERNANDEZ SANCHEZ <david.hernandezsanchez@st.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH V2 4/6] thermal: stm32: Convert to
 devm_thermal_zone_of_sensor_register_params()
Message-ID: <20181217114718.v6r66tdcweifufsg@verge.net.au>
References: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
 <20181215023010.2857-5-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181215023010.2857-5-marek.vasut+renesas@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Dec 15, 2018 at 03:30:08AM +0100, Marek Vasut wrote:
> Convert the stm32 code to devm_thermal_zone_of_sensor_register_params(),
> no functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: David HERNANDEZ SANCHEZ <david.hernandezsanchez@st.com>
> Cc: Eduardo Valentin <edubezval@gmail.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-pm@vger.kernel.org

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


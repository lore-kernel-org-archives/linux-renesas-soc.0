Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640A7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29BCE206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 11:47:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="r6Ch05gC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731759AbeLQLrH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 06:47:07 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39086 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbeLQLrG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 06:47:06 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 12FF525B781;
        Mon, 17 Dec 2018 22:47:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545047224; bh=7VMcblejzuyN9DeL/ocyKOx6VloXhTFZ+EaUuXTuF0Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r6Ch05gCHPSRI5/j4dggteY8U7Gs9IVtcL7nyNROt/GkF32y5BUs27dntI7m56veE
         NLGoOUPMNAIElm6Q3Aa4J8X/Xom1AvZTwDHHPYTzldneHFpasGjLF9oL4vtd7KvR4C
         x9mToLUfkPf6MdQJCvnVFcFhlhlDqnIo5jhHs3tk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6A81494048A; Mon, 17 Dec 2018 12:47:02 +0100 (CET)
Date:   Mon, 17 Dec 2018 12:47:02 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH V2 2/6] thermal: split
 devm_thermal_zone_of_sensor_register{,_param}()
Message-ID: <20181217114702.zw6jnotxvt6req2g@verge.net.au>
References: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
 <20181215023010.2857-3-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181215023010.2857-3-marek.vasut+renesas@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Dec 15, 2018 at 03:30:06AM +0100, Marek Vasut wrote:
> Introduce new split:devm_thermal_zone_of_sensor_register_params()
> function, which allows passing struct thermal_zone_params into it
> and convert original devm_thermal_zone_of_sensor_register() to call
> it with params set to NULL.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Eduardo Valentin <edubezval@gmail.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-pm@vger.kernel.org

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


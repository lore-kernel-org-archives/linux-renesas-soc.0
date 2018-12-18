Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B017C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 11:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDDC4217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 11:05:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="pL9vqGOr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbeLRLFV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 06:05:21 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:54307 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbeLRLFV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 06:05:21 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AAEB925B75B;
        Tue, 18 Dec 2018 22:05:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545131119; bh=Zv1OuADBcHtEVnDUv+CNml++XWUu3+ayVik2DKdMBmY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pL9vqGOr7FvB4hrz7LF34RnzYmpEjuU+IdOtgueUgvDmzVnMRS5oADQx2sv196VyX
         n9/r2k5q72d2URIYl0K+u+mVjRvGMuCKNaDDSFf7F3d69O51gmg7ZUbT6KeZ0W73IU
         FdUxycsB9QneR5JipTzN9Xy9FuSiHQDYS3TrM6n8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F1AA8940274; Tue, 18 Dec 2018 12:05:16 +0100 (CET)
Date:   Tue, 18 Dec 2018 12:05:16 +0100
From:   Simon Horman <horms@verge.net.au>
To:     marek.vasut@gmail.com
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        David HERNANDEZ SANCHEZ <david.hernandezsanchez@st.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH V3 4/6] thermal: stm32: Convert to
 devm_thermal_zone_of_sensor_register_params()
Message-ID: <20181218110516.w3t7bzspalulsn4g@verge.net.au>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-5-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181217155644.29278-5-marek.vasut@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 04:56:42PM +0100, marek.vasut@gmail.com wrote:
> From: Marek Vasut <marek.vasut@gmail.com>
> 
> Convert the stm32 code to devm_thermal_zone_of_sensor_register_params(),
> no functional change.
> 
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
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
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


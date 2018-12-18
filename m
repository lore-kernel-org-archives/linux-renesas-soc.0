Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88FCC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 11:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7FD35217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 11:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TuyUPAJC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbeLRLGP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 06:06:15 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:54340 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbeLRLGP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 06:06:15 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6BFE225B75B;
        Tue, 18 Dec 2018 22:06:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545131172; bh=vD8DI7s5rJvIyrBjcrkA0CbriDEkKGn71mtP/kPZ2qw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TuyUPAJCmeKGlBGngKWjjHX2w9fZOGOSfb4p8YzaKzeH3ZF70ienOUYQshmh6lXNZ
         XEdR+c0/TlRCSI5DmMCO+lSw+0L5CKxb/aDaWTmBweSe8GqvzRyR2S2S83dpcIKugu
         PpnOSofJS4YK9XNO6ijJ7+xmCM5QbqIqQ97cv6Hw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C9758940274; Tue, 18 Dec 2018 12:06:10 +0100 (CET)
Date:   Tue, 18 Dec 2018 12:06:10 +0100
From:   Simon Horman <horms@verge.net.au>
To:     marek.vasut@gmail.com
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH V3 6/6] thermal: rcar_gen3_thermal: Register hwmon sysfs
 interface
Message-ID: <20181218110610.g5tddfakd4ix7upb@verge.net.au>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-7-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181217155644.29278-7-marek.vasut@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 04:56:44PM +0100, marek.vasut@gmail.com wrote:
> From: Marek Vasut <marek.vasut@gmail.com>
> 
> Use devm_thermal_zone_of_sensor_register_params() with thermal zone
> params to enable the hwmon sysfs interface.
> 
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Eduardo Valentin <edubezval@gmail.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-pm@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


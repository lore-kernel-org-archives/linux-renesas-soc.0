Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CB2C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 11:04:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C6C5217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 11:04:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="gWG9xMZi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbeLRLEJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 06:04:09 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:54254 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbeLRLEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 06:04:09 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 50B6625B75B;
        Tue, 18 Dec 2018 22:04:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545131047; bh=842n/uIjSfIET1zTCvUbeSENVcpmZrq8g7HsywipoVk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gWG9xMZiawEBDc0BIiX34C/SCkx9sdUQXLOhG9ezTThkHWh4hgYK2W3kPZLlNA5u/
         4kLL016WGJ3oZdASBgDWIwph3ZfRlFBQQu6srtXWGsZxulqCkwwgsT6Y5S+rnDyA2p
         8ELZoiYJEv4lrrb/NwR3CLarJIX4SniP5mCUlREA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id AA477940274; Tue, 18 Dec 2018 12:04:05 +0100 (CET)
Date:   Tue, 18 Dec 2018 12:04:05 +0100
From:   Simon Horman <horms@verge.net.au>
To:     marek.vasut@gmail.com
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH V3 1/6] thermal: split
 thermal_zone_of_sensor_register{,_param}()
Message-ID: <20181218110405.lfitxpp7t2nperul@verge.net.au>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-2-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181217155644.29278-2-marek.vasut@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 04:56:39PM +0100, marek.vasut@gmail.com wrote:
> From: Marek Vasut <marek.vasut@gmail.com>
> 
> Introduce new thermal_zone_of_sensor_register_params() function, which
> allows passing struct thermal_zone_params into it and convert original
> thermal_zone_of_sensor_register() to call it with params set to NULL.
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


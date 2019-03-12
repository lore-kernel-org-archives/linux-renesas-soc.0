Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3D9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 09:23:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 666C5214AF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 09:23:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725844AbfCLJXG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 05:23:06 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56387 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfCLJXG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 05:23:06 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1h3dcl-0003C9-Iu; Tue, 12 Mar 2019 10:23:03 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1h3dck-0007Db-KM; Tue, 12 Mar 2019 10:23:02 +0100
Date:   Tue, 12 Mar 2019 10:23:02 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: Re: [PATCH] pwm: Avoid deadlock warning when removing PWM device
Message-ID: <20190312092302.2x6zf4imlfsevmkr@pengutronix.de>
References: <1552360594-21547-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1552360594-21547-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 12, 2019 at 12:16:34PM +0900, Yoshihiro Shimoda wrote:
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 1581f6a..2fdd6611 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -311,10 +311,12 @@ int pwmchip_add_with_polarity(struct pwm_chip *chip,
>  	if (IS_ENABLED(CONFIG_OF))
>  		of_pwmchip_add(chip);
>  
> -	pwmchip_sysfs_export(chip);
> -
>  out:
>  	mutex_unlock(&pwm_lock);
> +
> +	if (!ret)
> +		pwmchip_sysfs_export(chip);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(pwmchip_add_with_polarity);
> @@ -368,10 +370,12 @@ int pwmchip_remove(struct pwm_chip *chip)
>  
>  	free_pwms(chip);
>  
> -	pwmchip_sysfs_unexport(chip);
> -
>  out:
>  	mutex_unlock(&pwm_lock);
> +
> +	if (!ret)
> +		pwmchip_sysfs_unexport(chip);
> +

I wonder if this needs to be done before free_pwms is called. Otherwise
the pwmchip is already gone and then something is requested via sysfs.

Also a comment about why it is important not to unexport while holding
the lock would be great.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

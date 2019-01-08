Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BD0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 07:47:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B64D42183F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 07:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbfAHHrx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 02:47:53 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34839 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727473AbfAHHrx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 02:47:53 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ggm73-0000EZ-Vm; Tue, 08 Jan 2019 08:47:49 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ggm73-0004pY-Kc; Tue, 08 Jan 2019 08:47:49 +0100
Date:   Tue, 8 Jan 2019 08:47:49 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] pwm: rcar: Use "atomic" API on rcar_pwm_resume()
Message-ID: <20190108074749.d23mpcr3wscr6s5j@pengutronix.de>
References: <1546918094-13960-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1546918094-13960-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1546918094-13960-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 08, 2019 at 12:28:12PM +0900, Yoshihiro Shimoda wrote:
> To remove legacy API related functions in the future, this patch
> uses "atomic" related function instead. No change in behavior.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/pwm/pwm-rcar.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
> index ba70e83..4987c12 100644
> --- a/drivers/pwm/pwm-rcar.c
> +++ b/drivers/pwm/pwm-rcar.c
> @@ -316,18 +316,16 @@ static int rcar_pwm_suspend(struct device *dev)
>  static int rcar_pwm_resume(struct device *dev)
>  {
>  	struct pwm_device *pwm = rcar_pwm_dev_to_pwm_dev(dev);
> +	struct pwm_state state;
>  
>  	if (!test_bit(PWMF_REQUESTED, &pwm->flags))
>  		return 0;
>  
>  	pm_runtime_get_sync(dev);
>  
> -	rcar_pwm_config(pwm->chip, pwm, pwm->state.duty_cycle,
> -			pwm->state.period);
> -	if (pwm_is_enabled(pwm))
> -		rcar_pwm_enable(pwm->chip, pwm);
> +	pwm_get_state(pwm, &state);
>  
> -	return 0;
> +	return rcar_pwm_apply(pwm->chip, pwm, &state);
>  }

Orthogonal to this patch I wonder what the intended behaviour for a pwm
is on suspend. Should it stop oscilating unconditionally? Or should it
only stop if the consumer stops it as part of its own suspend callback?

As the patch only reworks and improves the code without a change in
behaviour, it is fine for me.

Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

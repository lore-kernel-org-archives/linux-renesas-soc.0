Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB92C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 07:43:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F77A20700
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 07:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfAHHnh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 02:43:37 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53179 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbfAHHnh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 02:43:37 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ggm2u-0008F8-NJ; Tue, 08 Jan 2019 08:43:32 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ggm2t-0004hn-QE; Tue, 08 Jan 2019 08:43:31 +0100
Date:   Tue, 8 Jan 2019 08:43:31 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] pwm: rcar: Add support "atomic" API
Message-ID: <20190108074331.lqwtex2pyumilfyn@pengutronix.de>
References: <1546918094-13960-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1546918094-13960-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1546918094-13960-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Tue, Jan 08, 2019 at 12:28:11PM +0900, Yoshihiro Shimoda wrote:
> This patch adds support for "atomic" API. Behavior is the same as
> when using legacy APIs.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/pwm/pwm-rcar.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
> index a41812f..ba70e83 100644
> --- a/drivers/pwm/pwm-rcar.c
> +++ b/drivers/pwm/pwm-rcar.c
> @@ -192,12 +192,49 @@ static void rcar_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
>  	rcar_pwm_update(rp, RCAR_PWMCR_EN0, 0, RCAR_PWMCR);
>  }
>  
> +static int rcar_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			  struct pwm_state *state)
> +{
> +	struct rcar_pwm_chip *rp = to_rcar_pwm_chip(chip);
> +	struct pwm_state cur_state;
> +	int div, ret;
> +
> +	/* This HW doesn't support changing polarity */
> +	pwm_get_state(pwm, &cur_state);
> +	if (state->polarity != cur_state.polarity)
> +		return -ENOTSUPP;

Does the driver only support normal polarity or only inversed polarity?
If so checking against that would be more clear here.

> +
> +	div = rcar_pwm_get_clock_division(rp, state->period);
> +	if (div < 0)
> +		return div;
> +
> +	rcar_pwm_update(rp, RCAR_PWMCR_SYNC, RCAR_PWMCR_SYNC, RCAR_PWMCR);
> +
> +	ret = rcar_pwm_set_counter(rp, div, state->duty_cycle, state->period);
> +	if (!ret)
> +		rcar_pwm_set_clock_control(rp, div);
> +
> +	/* The SYNC should be set to 0 even if rcar_pwm_set_counter failed */
> +	rcar_pwm_update(rp, RCAR_PWMCR_SYNC, 0, RCAR_PWMCR);
> +
> +	if (!ret && state->enabled)
> +		ret = rcar_pwm_enable(chip, pwm);
> +
> +	if (!state->enabled) {
> +		rcar_pwm_disable(chip, pwm);
> +		ret = 0;
> +	}

Assume the PWM runs with duty cycle 33% when
pwm_apply_state({ .enabled=0, .duty_cycle=66, .period=100 }) is called.

Does this might result in a 66% wave form being emitted? If yes, this
needs fixing.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
